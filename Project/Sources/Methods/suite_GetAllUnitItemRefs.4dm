//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/18/08, 16:26:30
// ----------------------------------------------------
// Method: suite_GetAllUnitItemRefs
// Description
// Populates the passed pointer with the references of all sub-unit item reference numbers
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)
C_LONGINT:C283($2; $ref_l)
C_POINTER:C301($3; $sublist_alp)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$list_l:=$1
$ref_l:=$2
$sublist_alp:=$3

GET LIST ITEM:C378($list_l; List item position:C629($list_l; $ref_l); $ref_l; $text_t; $sublist_l)

C_LONGINT:C283($copy_l)
$copy_l:=Copy list:C626($sublist_l)

helper_ListExpand($copy_l)

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Count list items:C380($copy_l; *))
	If (suite_GetListItemType($copy_l; helper_ListItemRefByPositionGet($copy_l; $i))="unit")
		APPEND TO ARRAY:C911($sublist_alp->; helper_ListItemRefByPositionGet($copy_l; $i))
	End if 
End for 

CLEAR LIST:C377($copy_l)