//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 12:51:45
// ----------------------------------------------------
// Method: Unit_DateEqualAssert
// Description:
// Compares two dates for equality.
//
// Parameters
// ----------------------------------------------------

C_DATE:C307($1; $expected_d; $2; $actual_d)
C_TEXT:C284($3; $other_t)

$expected_d:=$1
$actual_d:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_EqualAssert(->$expected_d; ->$actual_d; $other_t)
