//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 15:23:02
// ----------------------------------------------------
// Method: helper_GetListItemRefByPosition
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l; $0; $ref_l)
C_TEXT:C284($text_t)

//OPTIONAL PARAMETERS
C_LONGINT:C283($2; $pos_l)  //If not passed, returns currenlty selected ref
//------------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1

If (Count parameters:C259>=2)
	$pos_l:=$2
Else 
	$pos_l:=-1
End if 

If ($pos_l>=0)
	GET LIST ITEM:C378($list_l; $pos_l; $ref_l; $text_t)
Else 
	GET LIST ITEM:C378($list_l; *; $ref_l; $text_t)
End if 

$0:=$ref_l

_callstack_pop