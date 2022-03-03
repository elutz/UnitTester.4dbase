//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 02/26/09, 16:23:57
// ----------------------------------------------------
// Method: Unit_Callback
// Description:
// This method is automatically in the worker process
// once a test method has fully executed. This method
// then pulls the next test off the stack to be sent
// to the worker process for execution (sounds terrible doesn't it!)
// Also updates GUI variables.
//
// ----------------------------------------------------
// ----------------------------------------------------

C_BOOLEAN:C305($passed_boo; test_passed_boo; test_case_passed_boo)
C_BOOLEAN:C305(log_enabled_b)
test_case_passed_boo:=True:C214

C_LONGINT:C283($i; $pos; $find; $assertList_l; $testsList_l; $pos)
C_TEXT:C284($testCaseMethodError_t; $userData_t)
C_BOOLEAN:C305($printedTestCaseMethodError_b)
$testsList_l:=New list:C375

$testCaseMethodError_t:="Test case method error"
$printedTestCaseMethodError_b:=False:C215

If (log_enabled_b)
	xml_test_case_t:=DOM Create XML element:C865(xml_test_cases_t; "test_case"; "name"; <>TestCaseMethods_at{test_current_position_l})
	$userData_t:=<>UserData_at{test_current_position_l}
	If ($userData_t#"")
		xml_user_data_t:=DOM Create XML element:C865(xml_test_case_t; "user_data")
		DOM SET XML ELEMENT VALUE:C868(xml_user_data_t; $userData_t)
	End if 
	xml_tests:=DOM Create XML element:C865(xml_test_case_t; "tests")
End if 

$i:=0
For ($i; 1; Size of array:C274(<>TestNames_at))
	
	//are we logging? If so, need to reset the assert_log_t
	If (log_enabled_b)
		test_log_t:=""
		assert_log_t:=""
		xml_test_t:=DOM Create XML element:C865(xml_tests; "test"; "name"; <>TestNames_at{$i})
		xml_assertions_t:=DOM Create XML element:C865(xml_test_t; "assertions")
	End if 
	
	test_passed_boo:=True:C214
	$assertList_l:=New list:C375
	
	//Is this a duplicate test name? If so, need to fail and alert user
	If (helper_IsDuplicateInArray(-><>TestNames_at{$i}; -><>TestNames_at)) & (<>TestNames_at{$i}#$testCaseMethodError_t)
		results_assertion_fail($assertList_l; "UT-Error - Duplicate test name, all tests names must be unique within a test case")
	Else 
		
		If ((<>TestNames_at{$i}=$testCaseMethodError_t) & Not:C34($printedTestCaseMethodError_b)) | ((<>TestNames_at{$i}#$testCaseMethodError_t))
			
			//process assertions for the test
			$pos:=Find in array:C230(<>TestAssertionTestNames_at; <>TestNames_at{$i}; $pos+1)
			
			While ($pos>0)
				
				If (<>UnitTesterIsDemo_boo) & (unitsum_count_assertions_l>30)
					results_assertion_fail($assertList_l; "over demonstration limits")
				Else 
					
					If (<>TestAssertionsPassed_boo{$pos})
						results_assertion_pass
					Else 
						results_assertion_fail($assertList_l; <>TestAssertionsFailures_at{$pos})
					End if 
					
				End if 
				
				$pos:=Find in array:C230(<>TestAssertionTestNames_at; <>TestNames_at{$i}; $pos+1)
				
			End while 
			
		End if 
		
	End if 
	
	//Print the test here
	If (test_passed_boo)
		results_test_pass($testsList_l; <>TestNames_at{$i})
	Else 
		results_test_fail($testsList_l; <>TestNames_at{$i}; $assertList_l)
	End if 
	
End for 

If (test_case_passed_boo)
	results_test_case_pass(hlTestResults; <>TestCaseMethods_at{test_current_position_l}; $testsList_l)
Else 
	results_test_case_fail(hlTestResults; <>TestCaseMethods_at{test_current_position_l}; $testsList_l)
End if 

unitsum_success_units_r:=Round:C94(100*(unitsum_pass_units_l/unitsum_count_units_l); 1)
unitsum_success_tests_r:=Round:C94(100*(unitsum_pass_tests_l/unitsum_count_tests_l); 1)
unitsum_success_assertions_r:=Round:C94(100*(unitsum_pass_assertions_l/unitsum_count_assertions_l); 1)

helper_ArrayClear(-><>TestNames_at; -><>TestAssertionTestNames_at; -><>TestAssertionsPassed_boo; -><>TestAssertionsFailures_at)

helper_Increment(->test_current_position_l)

If (test_current_position_l>0) & (test_current_position_l<=Size of array:C274(<>TestCaseMethods_at))
	
	vProgress_t:=String:C10(test_current_position_l)+" of "+String:C10(Size of array:C274(<>TestCaseMethods_at))
	progTherm:=100*test_current_position_l/Size of array:C274(<>TestCaseMethods_at)
	helper_OffloadToDaemon("unittest"; <>TestCaseMethods_at{test_current_position_l}; "_Unit_Callback")
	
Else 
	
	helper_QuitDaemon("unittest")
	
	If (unitsum_fail_units_l>0)
		vComplete_t:="Testing complete : "+String:C10(unitsum_fail_units_l)+Choose:C955(unitsum_fail_units_l=1; " case"; " cases")+" FAILED"
	Else 
		vComplete_t:="Testing complete : all tests PASSED"
	End if 
	
	testing_boo:=False:C215
	progTherm:=0
	
	OBJECT SET VISIBLE:C603(*; "progress_@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "complete_@"; True:C214)
	OBJECT SET VISIBLE:C603(*; "complete_success@"; unitsum_fail_units_l=0)
	OBJECT SET VISIBLE:C603(*; "complete_failed@"; unitsum_fail_units_l>0)
	
	If (run_all_b)
		
		//log file?
		If (log_enabled_b)
			//set the summary values
			C_TEXT:C284($ref_t; $timestamp_t)
			C_BLOB:C604($xml_blob)
			$timestamp_t:=helper_TimestampGet
			DOM SET XML ATTRIBUTE:C866(xml_summaries_t; "finish"; helper_TimestampToISO($timestamp_t))
			DOM SET XML ATTRIBUTE:C866(xml_summaries_t; "elapsed"; String:C10(helper_TimestampDifferenceGet(test_start_t; $timestamp_t); HH MM SS:K7:1))
			DOM SET XML ATTRIBUTE:C866(xml_test_run_t; "pass"; Choose:C955(unitsum_fail_units_l=0; "true"; "false"))
			$ref_t:=DOM Create XML element:C865(xml_summaries_t; "summary"; "name"; "Test Cases"; "count"; unitsum_count_units_l; "passed"; unitsum_pass_units_l; "failed"; unitsum_fail_units_l; "percent_passed"; unitsum_success_units_r)
			$ref_t:=DOM Create XML element:C865(xml_summaries_t; "summary"; "name"; "Tests"; "count"; unitsum_count_tests_l; "passed"; unitsum_pass_tests_l; "failed"; unitsum_fail_tests_l; "percent_passed"; unitsum_success_tests_r)
			$ref_t:=DOM Create XML element:C865(xml_summaries_t; "summary"; "name"; "Assertions"; "count"; unitsum_count_assertions_l; "passed"; unitsum_pass_assertions_l; "failed"; unitsum_fail_assertions_l; "percent_passed"; unitsum_success_assertions_r)
			
			DOM EXPORT TO VAR:C863(xml_test_run_t; $xml_blob)
			DOM CLOSE XML:C722(xml_test_run_t)
			
			log_save($xml_blob)
			
			log_enabled_b:=False:C215
		End if 
		
		//auto build preference set? If so, and all tests passed, go ahead and build.
		If (unitsum_fail_units_l=0) & (prefs_GetForCheckbox("post_build_auto")=1)
			runner_eh_build_btn(On Clicked:K2:4)
		End if 
		
		//Need to make sure run_all_b is set to False so a subsequent run selected does not trigger a build.
		run_all_b:=False:C215
		
	End if 
	
End if 