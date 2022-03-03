//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 14:59:16
// ----------------------------------------------------
// Method: suite_SetListItemType
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $type_t)

//OPTIONAL PARAMETERS
C_LONGINT:C283($3; $ref_l)

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1
$type_t:=$2

If (Count parameters:C259>=3)
	$ref_l:=$3
Else 
	$ref_l:=0  //last item added, pass -1 for currently selected item
End if 

helper_SetListItemParameterText($list_l; "type"; $type_t; $ref_l)
suite_SetListItemIcon($list_l; $ref_l)

_callstack_pop