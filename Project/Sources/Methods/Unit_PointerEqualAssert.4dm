//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 12:42:02
// ----------------------------------------------------
// Method: Unit_NumericEqualAssert
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_POINTER:C301($1; $expected_p; $2; $actual_p)
C_TEXT:C284($3; $other_t)

$expected_p:=$1
$actual_p:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_EqualAssert(->$expected_p; ->$actual_p; $other_t)