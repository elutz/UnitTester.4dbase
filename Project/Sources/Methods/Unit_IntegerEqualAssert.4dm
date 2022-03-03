//%attributes = {"invisible":true,"shared":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 22:41:00
// ----------------------------------------------------
// Method: Unit_IntegerEqualAssert
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_LONGINT:C283($1; $expected_l; $2; $actual_l)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $other_t)

// ----------------------------------------------------

$expected_l:=$1
$actual_l:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_EqualAssert(->$expected_l; ->$actual_l; $other_t)