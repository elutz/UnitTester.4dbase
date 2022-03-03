//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:01:59
// ----------------------------------------------------
// Method: AppendToListWithIcon
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($0)
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $text_t)
C_POINTER:C301($3; $picture_p)

//OPTIONAL PARAMETERS
C_LONGINT:C283($4; $itemRef_l)
C_LONGINT:C283($5; $sublist_l)
C_BOOLEAN:C305($6; $sublistExpanded_boo)

$list_l:=$1
$text_t:=$2
$picture_p:=$3

If (Count parameters:C259>=4)
	$itemRef_l:=$4
Else 
	$itemRef_l:=helper_DefaultValue(->$itemRef_l)->
End if 

If (Count parameters:C259>=5)
	$sublist_l:=$5
Else 
	$sublist_l:=helper_DefaultValue(->$sublist_l)->
End if 

If (Count parameters:C259>=6)
	$sublistExpanded_boo:=$6
Else 
	$sublistExpanded_boo:=helper_DefaultValue(->$sublistExpanded_boo)->
End if 

$itemRef_l:=helper_ListAppend($list_l; $text_t; $itemRef_l; $sublist_l; $sublistExpanded_boo)
helper_SetListItemIcon($list_l; $itemRef_l; $picture_p)

$0:=$itemRef_l