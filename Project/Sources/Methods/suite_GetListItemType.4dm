//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 14:59:23
// ----------------------------------------------------
// Method: suite_GetListItemType
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($0; $type_t)
C_LONGINT:C283($1; $list_l)

//OPTIONAL PARAMETERS
C_LONGINT:C283($2; $ref_l)  // default is -1 = currently selected

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1

If (Count parameters:C259>=2)
	$ref_l:=$2
Else 
	$ref_l:=0  // 0 = last added, pass -1 for currently selected
End if 

$type_t:=helper_ListItemParameterTextGet($list_l; "type"; $ref_l)

$0:=$type_t

_callstack_pop