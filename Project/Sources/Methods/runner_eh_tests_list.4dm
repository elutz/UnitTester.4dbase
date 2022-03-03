//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: runner_eh_tests_list
// Syntax: runner_eh_tests_list($event_l)
// Created by: Mark Schaake
// Date created: 07/24/09, 09:01:39
//
// Description:
//  Handles events for the tests list on the left in the test runner.
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $event_l)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$event_l:=$1


Case of 
	: ($event_l=On Data Change:K2:15)
		C_LONGINT:C283($ref_l)
		C_TEXT:C284($name_t)
		$ref_l:=helper_ListItemRefByPositionGet(hl_TestSuites; -1)
		$name_t:=helper_ListItemTextByPosGet(hl_TestSuites; -1)
		
		If (suite_GetListItemType(hl_TestSuites; -1)="unit") & (helper_ListItemTextByPosGet(hl_TestSuites; -1)#conv_TestCaseMethodPrefixGet) & (Not:C34(Is compiled mode:C492(*)))
			method_CreateTestCase($name_t; List item parent:C633(hl_TestSuites; *); True:C214; hl_TestSuites)
		End if 
		
		If (server_is_running)
			client_request_update(->$ref_l; $name_t)
		Else 
			helper_SuitesListToDocument
		End if 
		
		SORT LIST:C391(hl_TestSuites; >)
		
	: ($event_l=On Clicked:K2:4) & ((Right click:C712) | (Contextual click:C713))
		
		suite_ContextualMenu(->hl_TestSuites; True:C214)
		
	: ($event_l=On Double Clicked:K2:5)
		
		
		Case of 
			: (Is compiled mode:C492(*))
				//Do nothing
			: (suite_GetListItemType(hl_TestSuites; -1)="unit")
				C_TEXT:C284($methodName_t)
				$methodName_t:=helper_ListItemTextByPosGet(hl_TestSuites; -1)
				
				If (method_doesExist($methodName_t))
					method_Edit($methodName_t)
				Else 
					CONFIRM:C162("The test method "+$methodName_t+" does not exist.  Do you want to create it now?"; "Yes"; "No")
					If (OK=1)
						method_CreateTestCase
					End if 
				End if 
				
			: (suite_GetListItemType(hl_TestSuites; -1)="suite")
				suite_OpenInputForm(helper_ListItemRefByPositionGet(hl_TestSuites))
				
		End case 
		
End case 


_callstack_pop