//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 12:51:45
// ----------------------------------------------------
// Method: Unit_DateEqualAssert
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TIME:C306($1; $expected_time; $2; $actual_time)
C_TEXT:C284($3; $other_t)

$expected_time:=$1
$actual_time:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_EqualAssert(->$expected_time; ->$actual_time; $other_t)
