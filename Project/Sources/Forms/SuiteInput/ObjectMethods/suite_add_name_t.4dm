
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 17:13:50
// ----------------------------------------------------
// Method: Object Method: SuiteInput.suite_add_name_t
// ----------------------------------------------------

Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		Self:C308->:=helper_Trim(Get edited text:C655)
		
		If (Self:C308->="")
			OBJECT SET ENABLED:C1123(btn_accept; False:C215)
		Else 
			OBJECT SET ENABLED:C1123(btn_accept; True:C214)
		End if 
		
End case 