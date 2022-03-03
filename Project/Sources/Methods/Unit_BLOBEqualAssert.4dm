//%attributes = {"invisible":true,"shared":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 20:37:28
//--------------------------------------------------------------------------------
// Method: Unit_BLOBEqualAssert
// Asserts that two BLOBs are equal.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_BLOB:C604($1; $expected_blob)
C_BLOB:C604($2; $actual_blob)

//Optional Parameters
C_TEXT:C284($3; $other_t)

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$expected_blob:=$1
$actual_blob:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

Unit_EqualAssert(->$expected_blob; ->$actual_blob; $other_t)

_callstack_pop  //keep this at the end of the method
