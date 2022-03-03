
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 14:22:18
// ----------------------------------------------------
// Method: Object Method: Preferences.btn_select

C_TEXT:C284($path; $start)
If (log_directory_path_t#"")
	$start:=log_directory_path_t
Else 
	If (Test path name:C476(Get 4D folder:C485(Logs folder:K5:19; *))=Is a folder:K24:2)
		$start:=Get 4D folder:C485(Logs folder:K5:19; *)
	Else 
		
	End if 
End if 

$path:=Select folder:C670("Select the directory to contain log files"; $start)

If ($path#"")
	log_directory_path_t:=$path
End if 