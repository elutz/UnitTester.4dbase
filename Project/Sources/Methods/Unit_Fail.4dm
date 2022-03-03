//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/27/08, 10:44:20
// ----------------------------------------------------
// Method: Unit_Fail
// Description
// 
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS
C_TEXT:C284($1; $failure_t)

// ----------------------------------------------------

If (Count parameters:C259>=1)
	$failure_t:=$1
Else 
	$failure_t:="Not yet implemented"
End if 

Unit_TrueAssert(False:C215; $failure_t)