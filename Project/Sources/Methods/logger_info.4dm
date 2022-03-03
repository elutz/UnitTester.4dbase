//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: logger_info
// Syntax: logger_info($msg_t)
// Created by: Mark Schaake
// Date created: 06/26/10, 07:50:06
//
// Description:
//  Logs info to the log file
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $msg_t)
// Optional Parameters: --none--
// Other Variables:
C_TIME:C306($ref)
// 
//***********************************************************************

$msg_t:="\r\n[INFO]: "+$1

logger_ensure_file

$ref:=Append document:C265(paths_DevLogFile)

SEND PACKET:C103($ref; $msg_t)
CLOSE DOCUMENT:C267($ref)

_callstack_pop