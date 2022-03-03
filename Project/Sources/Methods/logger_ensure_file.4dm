//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: logger_ensure_file
// Syntax: logger_ensure_file
// Created by: Mark Schaake
// Date created: 06/26/10, 08:27:42
//
// Description:
//  Creates the log file if it doesn't already exist
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

If (Test path name:C476(paths_DevLogFile)#Is a document:K24:1)
	logger_init
End if 

_callstack_pop