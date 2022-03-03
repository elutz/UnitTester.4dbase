//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: helper_ArrayTextAppend
// Created by: Mark Schaake
// Date created: 05/16/09, 10:52:53
//
// Description:
//  Appends text values to a text array.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $array_text_p)
C_TEXT:C284($2; ${3})
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$array_text_p:=$1

C_LONGINT:C283($i)
For ($i; 2; Count parameters:C259)
	APPEND TO ARRAY:C911($array_text_p->; ${$i})
End for 