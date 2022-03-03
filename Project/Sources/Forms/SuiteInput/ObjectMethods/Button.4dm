
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 17:11:28
// ----------------------------------------------------
// Method: Object Method: SuiteInput.btn_accept
// ----------------------------------------------------

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		//save the prefix as new default
		C_TEXT:C284($prefix_t)
		C_LONGINT:C283($suitePos_l)
		C_LONGINT:C283($sublist_l; $listCopy_l)
		$sublist_l:=0
		$prefix_t:=conv_TestCaseMethodPrefixGet
		
		ARRAY TEXT:C222($methods_at; 0)
		helper_TextToArray(suite_add_methods_t; ->$methods_at; Char:C90(Carriage return:K15:38))
		
		If (suite_ref_l#0)
			$sublist_l:=helper_ListItemSublistGet(hl_TestSuites; suite_ref_l)
			$listCopy_l:=Copy list:C626($sublist_l)
			helper_ListExpand($listCopy_l)
			$suitePos_l:=List item position:C629(hl_TestSuites; suite_ref_l)
		Else 
			$suitePos_l:=suite_AddTestSuite(suite_add_name_t)
		End if 
		
		C_LONGINT:C283($i)
		$i:=0
		For ($i; 1; Size of array:C274($methods_at))
			If (Is a list:C621($listCopy_l))
				//We are editing an existing suite.
				//Does the test case already exist?
				If (helper_ListFindIn($listCopy_l; $prefix_t+$methods_at{$i})=0)
					suite_AddTestCase($prefix_t+$methods_at{$i}; $suitePos_l)
				End if 
			Else 
				suite_AddTestCase($prefix_t+$methods_at{$i}; $suitePos_l)
			End if 
		End for 
		
		//helper_SuitesListToDocument 
		If (Is a list:C621($listCopy_l))
			CLEAR LIST:C377($listCopy_l)
		End if 
		
		ACCEPT:C269
		
End case 