//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: logger_error
// Syntax: logger_error($msg_t)
// Created by: Mark Schaake
// Date created: 06/26/10, 07:54:47
//
// Description:
//  Logs error to the log file
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $msg_t)
// Optional Parameters: --none--
// Other Variables:
C_TIME:C306($ref)
// 
//***********************************************************************

$msg_t:="\r\n[ERROR]: "+$1

logger_ensure_file

$ref:=Append document:C265(paths_DevLogFile)

SEND PACKET:C103($ref; $msg_t)
CLOSE DOCUMENT:C267($ref)

_callstack_pop