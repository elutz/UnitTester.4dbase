//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:03:27
// ----------------------------------------------------
// Method: AppendToList
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($0)
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $text_t)

//OPTIONAL PARAMETERS
C_LONGINT:C283($3; $itemRef_l)
C_LONGINT:C283($4; $sublist_l)
C_BOOLEAN:C305($5; $sublistExpanded_boo)

_callstack_push(Current method name:C684)

$list_l:=$1
$text_t:=$2

If (Count parameters:C259>=3)
	$itemRef_l:=$3
End if 

If ($itemRef_l<=0)
	$itemRef_l:=Count list items:C380($list_l; *)+1
End if 

If (Count parameters:C259>=4)
	$sublist_l:=$4
Else 
	$sublist_l:=0
End if 

If (Count parameters:C259>=5)
	$sublistExpanded_boo:=$5
Else 
	$sublistExpanded_boo:=False:C215
End if 

If (Is a list:C621($sublist_l))
	APPEND TO LIST:C376($list_l; $text_t; $itemRef_l; $sublist_l; $sublistExpanded_boo)
Else 
	APPEND TO LIST:C376($list_l; $text_t; $itemRef_l)
End if 

$0:=$itemRef_l

_callstack_pop