C_TEXT:C284(reg_key_t; $key_t)
C_BLOB:C604($blob)

If (setup_license_update(reg_key_t))
	If (<>UnitTesterIsDemo_boo) & (setup_license_type#"demo")
		ALERT:C41("Thank you for purchasing UnitTester!")
	End if 
	<>UnitTesterIsDemo_boo:=(setup_license_type="demo")
	ACCEPT:C269
Else 
	ALERT:C41("Invalid license")
End if 