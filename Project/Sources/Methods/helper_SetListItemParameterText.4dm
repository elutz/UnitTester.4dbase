//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 14:56:12
// ----------------------------------------------------
// Method: helper_SetListItemParameterText
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $key_t)
C_TEXT:C284($3; $value_t)

//OPTIONAL PARAMETERS
C_LONGINT:C283($4; $ref_l)  //If not passed, applies to last added item

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1
$key_t:=$2
$value_t:=$3

If (Count parameters:C259>=4)
	$ref_l:=$4
Else 
	$ref_l:=0
End if 

helper_SetListItemParameter($list_l; $key_t; ->$value_t; $ref_l)

_callstack_pop