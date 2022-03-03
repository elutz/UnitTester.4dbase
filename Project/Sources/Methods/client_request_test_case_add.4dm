//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: client_request_test_case_add
// Created by: Mark Schaake
// Date created: 05/18/09, 21:46:23
//
// Description:
//  Secures the queue, then adds a test case to the queue.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $ref_long_p)
C_TEXT:C284($2; $methodName_t)
C_LONGINT:C283($3; $suiteRef_l)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************
$ref_long_p:=$1
$methodName_t:=$2
$suiteRef_l:=$3

client_request_send($ref_long_p; "add test"; $methodName_t; $suiteRef_l)