//%attributes = {"invisible":true,"shared":true}
//***********************************************************************
// Method Name: Unit_ArrayEqualAssert
// Created by: Mark Schaake
// Date created: 05/16/09, 03:22:31
//
// Description:
//  Asserts equality of arrays
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $expectedArray_p)
C_POINTER:C301($2; $actualArray_p)
// Optional Parameters: 
C_TEXT:C284($3; $failureMssg_t)
//***********************************************************************

$expectedArray_p:=$1
$actualArray_p:=$2
If (Count parameters:C259>=3)
	$failureMssg_t:=$3
Else 
	$failureMssg_t:=""
End if 

Unit_EqualAssert($expectedArray_p; $actualArray_p; $failureMssg_t)