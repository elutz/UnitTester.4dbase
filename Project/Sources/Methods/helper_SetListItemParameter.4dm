//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 14:57:51
// ----------------------------------------------------
// Method: helper_SetListItemParameter
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $key_t)
C_POINTER:C301($3; $value_p)

//OPTIONAL PARAMETERS
C_LONGINT:C283($4; $ref_l)  //If not passed, applies to last added item
// 0 = last item added
// -1 = selected item

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1
$key_t:=$2
$value_p:=$3

If (Count parameters:C259>=4)
	$ref_l:=$4
Else 
	$ref_l:=0
End if 

If ($ref_l>=0)
	SET LIST ITEM PARAMETER:C986($list_l; $ref_l; $key_t; $value_p->)
Else 
	SET LIST ITEM PARAMETER:C986($list_l; *; $key_t; $value_p->)
End if 

_callstack_pop