//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: helper_ArrayTextDeleteBlanks
// Created by: Mark Schaake
// Date created: 05/16/09, 11:32:46
//
// Description:
//  Deletes blank elements from a text array.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $array_text_p)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$array_text_p:=$1

C_LONGINT:C283($pos)
$pos:=Find in array:C230($array_text_p->; "")

While ($pos>0)
	DELETE FROM ARRAY:C228($array_text_p->; $pos)
	$pos:=Find in array:C230($array_text_p->; "")
End while 