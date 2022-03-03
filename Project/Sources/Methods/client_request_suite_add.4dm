//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: client_request_suite_add
// Created by: Mark Schaake
// Date created: 05/18/09, 22:01:31
//
// Description:
//  Secures the queue, then adds a test suite to the queue.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $ref_long_p)
C_TEXT:C284($2; $suiteName_t)
// Optional Parameters: 
C_LONGINT:C283($3; $parentRef_l)
// Other Variables:
// 
//***********************************************************************

$ref_long_p:=$1
$suiteName_t:=$2
If (Count parameters:C259>=3)
	$parentRef_l:=$3
Else 
	$parentRef_l:=0
End if 

client_request_send($ref_long_p; "add suite"; $suiteName_t; $parentRef_l)