//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: paths_DevLogFile
// Syntax: paths_DevLogFile -> text
// Created by: Mark Schaake
// Date created: 06/26/10, 08:03:21
//
// Description:
//  The file path for the development log file
// 
// Returns: 
C_TEXT:C284($0; $path_t)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************


$0:=Get 4D folder:C485(Logs folder:K5:19)+"dev.log.txt"

_callstack_pop