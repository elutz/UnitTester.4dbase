//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 12:48:10
// ----------------------------------------------------
// Method: Unit_TextEqualAssert
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_TEXT:C284($1; $expected_t; $2; $actual_t)
C_TEXT:C284($3; $other_t)

$expected_t:=$1
$actual_t:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_EqualAssert(->$expected_t; ->$actual_t; $other_t)
