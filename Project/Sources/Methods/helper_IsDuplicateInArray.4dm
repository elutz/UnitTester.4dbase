//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/10/09, 12:34:06
//--------------------------------------------------------------------------------
// Method: helper_IsDuplicateInArray
// Returns true if the passed value is a duplicate in the passed array.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_BOOLEAN:C305($0; $isDuplicate_boo)

//Required Parameters
C_POINTER:C301($1; $val_p)
C_POINTER:C301($2; $arr_p)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$val_p:=$1
$arr_p:=$2

C_LONGINT:C283($pos)
$pos:=Find in array:C230($arr_p->; $val_p->)

If ($pos>0) & ($pos<Size of array:C274($arr_p->))
	$isDuplicate_boo:=(Find in array:C230($arr_p->; $val_p->; $pos+1)>0)
Else 
	$isDuplicate_boo:=False:C215
End if 

$0:=$isDuplicate_boo

_callstack_pop  //keep this at the end of the method