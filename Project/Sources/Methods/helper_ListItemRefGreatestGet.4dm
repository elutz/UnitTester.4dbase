//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 17:19:20
// ----------------------------------------------------
// Method: helper_GetGreatestItemRef
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($0; $ref_l)
C_LONGINT:C283($1; $list_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1

C_LONGINT:C283($copyList_l)
$copyList_l:=Copy list:C626($list_l)

helper_ListExpand($copyList_l; True:C214)

C_LONGINT:C283($i; $thisRef_l)
$i:=0
$lastRef_l:=0
For ($i; 1; Count list items:C380($copyList_l; *))
	$thisRef_l:=helper_ListItemRefByPositionGet($copyList_l; $i)
	$ref_l:=Choose:C955($ref_l<$thisRef_l; $thisRef_l; $ref_l)
End for 

CLEAR LIST:C377($copyList_l; *)

$0:=$ref_l

_callstack_pop