
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_TEXT:C284(reg_key_t; reg_type_t; $type_t)
		C_BLOB:C604($key_blob)
		$key_blob:=server_document_to_blob(paths_UnitLicenseGet)
		reg_key_t:=server_document_to_text(paths_UnitLicenseGet)
		$type_t:=setup_license_type($key_blob)
		
		Case of 
			: ($type_t="single")
				reg_type_t:="Single-User"
			: ($type_t="team")
				reg_type_t:="Team Development - "+setup_license_seats_tostring($key_blob)
			: ($type_t="demo")
				reg_type_t:="Demonstration"
		End case 
		
		If (Length:C16(reg_key_t)=16)
			reg_key_t:=Insert string:C231(reg_key_t; "-"; 13)
			reg_key_t:=Insert string:C231(reg_key_t; "-"; 9)
			reg_key_t:=Insert string:C231(reg_key_t; "-"; 5)
		End if 
		
		OBJECT SET ENABLED:C1123(btn_ok; False:C215)
		
End case 
