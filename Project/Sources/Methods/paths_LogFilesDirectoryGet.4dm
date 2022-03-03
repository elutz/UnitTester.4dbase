//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: paths_LogFilesDirectoryGet
// Syntax: paths_LogFilesDirectoryGet -> text
// Created by: Mark Schaake
// Date created: 06/18/09, 14:50:16
//
// Description:
//  Returns the default directory for holding log files.
//
// Returns:
C_TEXT:C284($0; $path_t)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
//
//***********************************************************************

prefs_GetById("log_directory"; ->$path_t)

If ($path_t="")
	$path_t:=paths_TestsResourceFolderGet+"logs"+Folder separator:K24:12
End if 

$0:=$path_t