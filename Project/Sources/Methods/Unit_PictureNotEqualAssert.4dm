//%attributes = {"invisible":true,"shared":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/15/08, 23:34:28
// ----------------------------------------------------
// Method: Unit_TimeNotEqualAssert
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_PICTURE:C286($1; $expected_pic; $2; $actual_pic)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $other_t)

// ----------------------------------------------------

$expected_pic:=$1
$actual_pic:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_NotEqualAssert(->$expected_pic; ->$actual_pic; $other_t)