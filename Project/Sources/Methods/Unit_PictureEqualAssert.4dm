//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 12:51:45
// ----------------------------------------------------
// Method: Unit_PictureEqualAssert
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_PICTURE:C286($1; $expected_pic; $2; $actual_pic)
C_TEXT:C284($3; $other_t)

$expected_pic:=$1
$actual_pic:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_EqualAssert(->$expected_pic; ->$actual_pic; $other_t)
