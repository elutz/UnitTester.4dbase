//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/27/08, 11:58:29
// ----------------------------------------------------
// Method: RunTests
// Description:
// Runs the tests. A second parameter can specify a selection
// of hierarchical list items. Otherwise, all items in the list
// are executed.
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)

//OPTIONAL PARAMETERS
C_POINTER:C301($2; $selectedItems_alp)
//Other vars
C_LONGINT:C283(hlTestResults)
// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1

ARRAY TEXT:C222(<>TestCaseMethods_at; 0)
ARRAY TEXT:C222(<>TestNames_at; 0)
ARRAY TEXT:C222(<>UserData_at; 0)
ARRAY TEXT:C222(<>TestAssertionTestNames_at; 0)
ARRAY BOOLEAN:C223(<>TestAssertionsPassed_boo; 0)
ARRAY TEXT:C222(<>TestAssertionsFailures_at; 0)
C_BOOLEAN:C305(<>UnitTesterIsDemo_boo)  //hard-coded in On load of main form to establish demo (True) or unrestricted (False)
C_BOOLEAN:C305(testing_boo)
C_LONGINT:C283($copyList_l)
C_BOOLEAN:C305(log_enabled_b)
C_BOOLEAN:C305(run_all_b)

testing_boo:=True:C214
$copyList_l:=Copy list:C626($list_l)

If (Count parameters:C259>=2)
	$selectedItems_alp:=$2
End if 

//===================================================================
//Build an array of test method names to be queued up
//===================================================================

C_TEXT:C284($methodName_t)

helper_ListExpand($copyList_l; True:C214)  //list must be expanded for cycling through items

If (Not:C34(Is nil pointer:C315($selectedItems_alp)))
	
	C_LONGINT:C283($i)
	$i:=0
	For ($i; 1; Size of array:C274($selectedItems_alp->))
		
		$methodName_t:=helper_ListItemTextByRefGet($copyList_l; $selectedItems_alp->{$i})
		
		If (method_doesExist($methodName_t))
			APPEND TO ARRAY:C911(<>TestCaseMethods_at; $methodName_t)
		Else 
			
		End if 
		
	End for 
	
Else 
	
	C_LONGINT:C283($i)
	$i:=0
	
	For ($i; 1; Count list items:C380($copyList_l))
		
		$itemRef_l:=helper_ListItemRefByPositionGet($copyList_l; $i)
		
		If (suite_GetListItemType($copyList_l; $itemRef_l)="unit")
			
			$methodName_t:=helper_ListItemTextByPosGet($copyList_l; $i)
			
			If (method_doesExist($methodName_t))
				APPEND TO ARRAY:C911(<>TestCaseMethods_at; $methodName_t)
			Else 
				
			End if 
			
		End if 
		
	End for 
	
End if 

ARRAY TEXT:C222(<>UserData_at; Size of array:C274(<>TestCaseMethods_at))
CLEAR LIST:C377($copyList_l; *)
CLEAR LIST:C377(hlTestResults; *)


//===================================================================
//Initialization of GUI variables for displaying test results
//===================================================================

hlTestResults:=New list:C375

C_TEXT:C284(vProgress_t; vComplete_t)
vProgress_t:=""
vComplete_t:=""

C_LONGINT:C283(test_current_position_l)  //Queue management

//Variables for tracking statistics are declared here. There are 4 levels
//in UnitTester. All are related one-to-many. Top to bottom = 
//               Suite
//             ____|____
//            |         |
//         Case       Case
//       ____|____
//      |         |
//    Test      Test
//           ____|____
//          |         |
//      Assertion   Assertion

//Suites statistics. Not currently used in GUI?
C_LONGINT:C283(unitsum_count_suites_l)
C_LONGINT:C283(unitsum_pass_suites_l; unitsum_fail_suites_l)
C_REAL:C285(unitsum_success_suites_r; vPercentSuitesFailed_r)

//Units statistics (any suite can have multiple units to test)
C_LONGINT:C283(unitsum_count_units_l)
C_LONGINT:C283(unitsum_pass_units_l; unitsum_fail_units_l)
C_REAL:C285(unitsum_success_units_r; vPercentUnitsFailed_r)

//Tests statistics (any unit can have multiple tests)
C_LONGINT:C283(unitsum_count_tests_l)
C_LONGINT:C283(unitsum_pass_tests_l; unitsum_fail_tests_l)
C_REAL:C285(unitsum_success_tests_r; vPercentTestsFailed_r)

//Assertions statistics (any test can have multiple assertions)
C_LONGINT:C283(unitsum_count_assertions_l)
C_LONGINT:C283(unitsum_pass_assertions_l; unitsum_fail_assertions_l)
C_REAL:C285(unitsum_success_assertions_r; vPercentAssertionsFailed_r)

C_PICTURE:C286(vOk_pic; vFail_pic; vAssertOk_pic; vAssertFail_pic; vFailureLead_pic)

ARRAY PICTURE:C279(test_Icons; 0)
ARRAY TEXT:C222(test_Failures; 0)
ARRAY BOOLEAN:C223(test_Succeeded; 0)

unitsum_count_suites_l:=0
unitsum_pass_suites_l:=0
unitsum_fail_suites_l:=0
unitsum_success_suites_r:=0
vPercentSuitesFailed_r:=0

unitsum_count_units_l:=0
unitsum_pass_units_l:=0
unitsum_fail_units_l:=0
unitsum_success_units_r:=0
vPercentUnitsFailed_r:=0

unitsum_count_tests_l:=0
unitsum_pass_tests_l:=0
unitsum_fail_tests_l:=0
unitsum_success_tests_r:=0
vPercentTestsFailed_r:=0

unitsum_count_assertions_l:=0
unitsum_pass_assertions_l:=0
unitsum_fail_assertions_l:=0
unitsum_success_assertions_r:=0
vPercentAssertionsFailed_r:=0

test_current_position_l:=1

vOk_pic:=helper_GetResourceImage("passed_16.png")
vFail_pic:=helper_GetResourceImage("failed_16.png")
vAssertOk_pic:=helper_GetResourceImage("assert_passed_16.png")
vAssertFail_pic:=helper_GetResourceImage("assert_failed_16.png")
vFailureLead_pic:=helper_GetResourceImage("failure_lead_16.png")

//===================================================================
//Run the tests in a worker process by calling helper_OffloadToDaemon.
//Each time a test is completed a callback is made to Unit_Callback
//which pulls the next test method off the queue for execution
//in the worker process. This allows for a nice interface where
//the developer can watch as tests pass and fail. I candy if you will.
//===================================================================

If (Size of array:C274(<>TestCaseMethods_at)>0)  //We can run the tests!
	
	If (<>UnitTesterIsDemo_boo) & (Size of array:C274(<>TestCaseMethods_at)>10)
		ALERT:C41("This version of the UnitTester component is for demonstration only.  You are limited to a maximum of 10 test case methods and 30 assertions.")
	Else 
		
		OBJECT SET VISIBLE:C603(*; "progress_@"; True:C214)  //progress bar, status message
		OBJECT SET VISIBLE:C603(*; "complete_@"; False:C215)  //completion graphic - Pass or Fail?
		
		If (test_current_position_l>0) & (test_current_position_l<=Size of array:C274(<>TestCaseMethods_at))
			vProgress_t:=String:C10(test_current_position_l)+" of "+String:C10(Size of array:C274(<>TestCaseMethods_at))
			helper_OffloadToDaemon("unittest"; <>TestCaseMethods_at{test_current_position_l}; "_Unit_Callback")
		End if 
		
	End if 
	
Else   //No tests to run, make sure progress indicators are hidden on GUI
	
	OBJECT SET VISIBLE:C603(*; "progress_@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "complete_@"; False:C215)
	
End if 

_callstack_pop