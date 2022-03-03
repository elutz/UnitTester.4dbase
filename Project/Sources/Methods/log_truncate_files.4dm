//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: log_truncate_files
// Syntax: log_truncate_files
// Created by: Mark Schaake
// Date created: 06/20/09, 07:44:59
//
// Description:
//  Truncates the files in the designated logs folder
//  according the the user's Log File Preferences.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
C_TEXT:C284($logsDir_t)
C_LONGINT:C283($maxLogs_l; $numToDelete_l; $i)
ARRAY TEXT:C222($docs_at; 0)
// 
//***********************************************************************

$logsDir_t:=paths_LogFilesDirectoryGet
prefs_GetById("log_keep_last"; ->$maxLogs_l)

If (Test path name:C476($logsDir_t)=Is a folder:K24:2) & ($maxLogs_l>0)
	
	$maxLogs_l:=2*$maxLogs_l  //do this because there are two files for each log: the .xml and .html
	DOCUMENT LIST:C474($logsDir_t; $docs_at)
	$numToDelete_l:=Size of array:C274($docs_at)-$maxLogs_l
	If ($numToDelete_l>0)
		SORT ARRAY:C229($docs_at; >)
		$i:=0
		For ($i; 1; $numToDelete_l)
			DELETE DOCUMENT:C159($logsDir_t+$docs_at{$i})
		End for 
	End if 
	
End if 

_callstack_pop