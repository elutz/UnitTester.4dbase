//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:05:01
// ----------------------------------------------------
// Method: RemoveAllElementsFromArray
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_POINTER:C301($1)
C_POINTER:C301(${2})

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$array_ap:=$1

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Count parameters:C259)
	If (helper_IsArray(${$i}))
		If (Size of array:C274(${$i}->)>0)
			DELETE FROM ARRAY:C228(${$i}->; 1; Size of array:C274(${$i}->))
		End if 
	End if 
End for 