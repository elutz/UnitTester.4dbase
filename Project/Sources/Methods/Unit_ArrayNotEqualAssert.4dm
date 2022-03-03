//%attributes = {"invisible":true,"shared":true}
//***********************************************************************
// Method Name: Unit_ArrayNotEqualAssert
// Created by: Mark Schaake
// Date created: 05/16/09, 03:23:45
//
// Description:
//  Asserts inequality of arrays
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $unexpectedArray_p)
C_POINTER:C301($2; $actualArray_p)
// Optional Parameters: 
C_TEXT:C284($3; $failureMssg_t)
//***********************************************************************

$unexpectedArray_p:=$1
$actualArray_p:=$2
If (Count parameters:C259>=3)
	$failureMssg_t:=$3
Else 
	$failureMssg_t:=""
End if 

Unit_NotEqualAssert($unexpectedArray_p; $actualArray_p; $failureMssg_t)