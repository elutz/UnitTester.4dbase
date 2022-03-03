
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 17:11:47
// ----------------------------------------------------
// Method: Form Method: SuiteInput
// ----------------------------------------------------
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_TEXT:C284(suite_add_name_t; suite_add_methods_t; $method_t)
		C_TEXT:C284($prefix_t)
		$prefix_t:=conv_TestCaseMethodPrefixGet
		
		If (suite_ref_l#0)
			//Get the suite test cases and put in suite_add_methods_t
			suite_add_name_t:=helper_ListItemTextByRefGet(hl_TestSuites; suite_ref_l)
		Else 
			suite_add_name_t:=""
		End if 
		suite_add_methods_t:=""
		
		OBJECT SET ENTERABLE:C238(suite_add_name_t; (suite_add_name_t=""))
		
		If (suite_add_name_t="")
			OBJECT SET ENABLED:C1123(btn_accept; False:C215)
			
			EDIT ITEM:C870(suite_add_name_t)
		End if 
		
End case 