//%attributes = {"invisible":true,"shared":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/15/08, 23:33:49
// ----------------------------------------------------
// Method: Unit_TextNotEqualAssert
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $expected_t; $2; $actual_t)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $other_t)

// ----------------------------------------------------

$expected_t:=$1
$actual_t:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_NotEqualAssert(->$expected_t; ->$actual_t; $other_t)