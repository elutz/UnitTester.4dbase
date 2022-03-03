
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 12/07/08, 16:29:07
// ----------------------------------------------------
// Method: Object Method: CreateMethod.method_name_t

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)
		
		C_LONGINT:C283(method_length_l)
		method_length_l:=31-Length:C16(Get edited text:C655)
		
End case 