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
C_TIME:C306($1; $expected_time; $2; $actual_time)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $other_t)

// ----------------------------------------------------

$expected_time:=$1
$actual_time:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_NotEqualAssert(->$expected_time; ->$actual_time; $other_t)