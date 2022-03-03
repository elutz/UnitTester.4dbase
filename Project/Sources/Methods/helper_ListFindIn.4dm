//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/04/09, 16:11:43
//--------------------------------------------------------------------------------
// Method: helper_FindInList
// Finds a list item position or returns 0.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_LONGINT:C283($0; $pos_l)

//Required Parameters
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $val_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1
$val_t:=$2

C_LONGINT:C283($i; $ref_l)
C_TEXT:C284($text_t)
$i:=1

While ($pos_l=0) & ($i<=Count list items:C380($list_l))
	GET LIST ITEM:C378($list_l; $i; $ref_l; $text_t)
	If ($val_t=$text_t)
		$pos_l:=$i
	End if 
	$i:=$i+1
End while 

$0:=$pos_l

_callstack_pop  //keep this at the end of the method