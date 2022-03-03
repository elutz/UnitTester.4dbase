//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: logger_init
// Syntax: logger_init
// Created by: Mark Schaake
// Date created: 06/26/10, 07:46:34
//
// Description:
//  Initializes the logger for development testing (not available in production)
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters:
C_TEXT:C284($1; $header_t)
// Other Variables:
// 
//***********************************************************************

If (Count parameters:C259>=1)
	$header_t:=$1
Else 
	$header_t:="UnitTester Log"
End if 

C_TEXT:C284($path_t)
C_TIME:C306($ref)
$path_t:=paths_DevLogFile

If (Test path name:C476($path_t)=Is a document:K24:1)
	DELETE DOCUMENT:C159($path_t)
End if 
$ref:=Create document:C266($path_t)
SEND PACKET:C103($ref; $header_t)
CLOSE DOCUMENT:C267($ref)

_callstack_pop