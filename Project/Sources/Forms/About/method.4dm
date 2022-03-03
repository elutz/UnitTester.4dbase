
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_TEXT:C284(version_t; current_year_t)
		prefs_GetById("version"; ->version_t)
		current_year_t:=String:C10(Year of:C25(Current date:C33))
End case 
