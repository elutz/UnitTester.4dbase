//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 14:55:19
// ----------------------------------------------------
// Method: helper_GetListItemText
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($0; $text_t)

//OPTIONAL PARAMETERS
C_LONGINT:C283($2; $itemPos_l)

// ----------------------------------------------------

$list_l:=$1

If (Count parameters:C259>=2)
	$itemPos_l:=$2
Else 
	$itemPos_l:=-1  //currently selected
End if 


If ($itemPos_l>=0)
	GET LIST ITEM:C378($list_l; $itemPos_l; $itemRef_l; $text_t)
Else 
	GET LIST ITEM:C378($list_l; *; $itemRef_l; $text_t)
End if 

$0:=$text_t