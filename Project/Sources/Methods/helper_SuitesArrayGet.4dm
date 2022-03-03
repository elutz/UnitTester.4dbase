//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/13/09, 05:32:06
//--------------------------------------------------------------------------------
// Method: Unit__SuitesArrayGet
// Populates the passed text array the test suite names.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_POINTER:C301($1; $names_atp)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$names_atp:=$1

C_LONGINT:C283($hList_l; $ref_l)
$hList_l:=New list:C375

helper_ArrayClear($names_atp)
helper_TestFileToListLoad(paths_TestFileGet; ->$hList_l)
helper_ListExpand($hList_l)

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Count list items:C380($hList_l))
	$ref_l:=helper_ListItemRefByPositionGet($hList_l; $i)
	If (suite_ListItemTypeIsSuite($hList_l; $ref_l))
		APPEND TO ARRAY:C911($names_atp->; helper_ListItemTextByRefGet($hList_l; $ref_l))
	End if 
End for 

CLEAR LIST:C377($hList_l)

_callstack_pop  //keep this at the end of the method