//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:03:58
// ----------------------------------------------------
// Method: SetListItemIcon
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l; $2; $ref_l)
C_POINTER:C301($3; $icon_p)

//OPTIONAL PARAMETERS

$list_l:=$1
$ref_l:=$2
$icon_p:=$3

If ($ref_l=-1)
	SET LIST ITEM ICON:C950($list_l; *; $icon_p->)
Else 
	SET LIST ITEM ICON:C950($list_l; $ref_l; $icon_p->)
End if 