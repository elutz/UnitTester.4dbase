//%attributes = {"invisible":true}


// User name (OS): Mark Schaake
// Date and time: 05/12/09, 22:04:36
//--------------------------------------------------------------------------------
// Method: suite_ListItemTypeIsTestCase
// 
//
//--------------------------------------------------------------------------------
//
//Return Value
C_BOOLEAN:C305($0; $isSuite_boo)

//Required Parameters
C_LONGINT:C283($1; $list_l)

//Optional Parameters
C_LONGINT:C283($2; $ref_l)

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1
If (Count parameters:C259>=2)
	$ref_l:=$2
Else 
	$ref_l:=-1
End if 

$isSuite_boo:=(suite_GetListItemType($list_l; $ref_l)="unit")

$0:=$isSuite_boo

_callstack_pop  //keep this at the end of the method