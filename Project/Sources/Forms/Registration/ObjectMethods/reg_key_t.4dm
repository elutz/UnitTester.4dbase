
Case of 
	: (Form event code:C388=On After Keystroke:K2:26) | (Form event code:C388=On After Edit:K2:43) | (Form event code:C388=On Data Change:K2:15)
		
		C_TEXT:C284($text_t)
		$text_t:=Replace string:C233(Get edited text:C655; "-"; "")
		
		If (Length:C16($text_t)=16)
			OBJECT SET ENABLED:C1123(btn_ok; True:C214)
		Else 
			OBJECT SET ENABLED:C1123(btn_ok; False:C215)
		End if 
		
End case 
