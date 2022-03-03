//%attributes = {"invisible":true,"shared":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/13/08, 22:26:26
// ----------------------------------------------------
// Method: Unit_DateNotEqualAssert
// Description:
// Compares two dates for inequality.
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_DATE:C307($1; $expected_d; $2; $actual_d)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $other_t)

// ----------------------------------------------------

$expected_d:=$1
$actual_d:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_NotEqualAssert(->$expected_d; ->$actual_d; $other_t)