//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 22:02:43
// ----------------------------------------------------
// Method: helper_GetListItemSublist
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($0; $sublist_l)
C_LONGINT:C283($1; $list_l; $2; $itemRef_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$list_l:=$1
$itemRef_l:=$2

C_TEXT:C284($text_t)

GET LIST ITEM:C378($list_l; List item position:C629($list_l; $itemRef_l); $itemRef_l; $text_t; $sublist_l)

$0:=$sublist_l