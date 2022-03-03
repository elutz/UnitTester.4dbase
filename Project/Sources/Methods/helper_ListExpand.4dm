//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 21:52:40
// ----------------------------------------------------
// Method: helper_ExpandList
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)

//OPTIONAL PARAMETERS
C_BOOLEAN:C305($2; $expand_boo)

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1

If (Count parameters:C259>=2)
	$expand_boo:=$2
Else 
	$expand_boo:=True:C214
End if 

C_TEXT:C284($text_t)
C_LONGINT:C283($sublist_l; $itemRef_l)

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Count list items:C380($list_l; *))
	GET LIST ITEM:C378($list_l; $i; $itemRef_l; $text_t; $sublist_l)
	
	If (Is a list:C621($sublist_l))
		SET LIST ITEM:C385($list_l; $itemRef_l; $text_t; $itemRef_l; $sublist_l; $expand_boo)
		helper_ListExpand($sublist_l; $expand_boo)
	End if 
	
End for 

_callstack_pop