//%attributes = {"invisible":true,"shared":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/15/08, 23:32:52
// ----------------------------------------------------
// Method: Unit_PointerNotEqualAssert
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_POINTER:C301($1; $expected_p; $2; $actual_p)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $other_t)

// ----------------------------------------------------

$expected_p:=$1
$actual_p:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_NotEqualAssert(->$expected_p; ->$actual_p; $other_t)