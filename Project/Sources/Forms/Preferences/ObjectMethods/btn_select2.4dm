
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 14:22:18
// ----------------------------------------------------
// Method: Object Method: Preferences.btn_select

C_TEXT:C284($path)
$path:=helper_BuildPathSelect

If ($path#"")
	build_app_path_t:=$path
End if 