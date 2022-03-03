//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/30/08, 14:04:00
// ----------------------------------------------------
// Method: helper_MoveListItem
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $itemRef_l; $2; $toParentRef_l)

//OPTIONAL PARAMETERS
C_LONGINT:C283($3; $list_l)

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$itemRef_l:=$1
$toParentRef_l:=$2
If (Count parameters:C259>=3)
	$list_l:=$3
Else 
	$list_l:=hl_TestSuites
End if 

C_TEXT:C284($type_t; $text_t)
C_LONGINT:C283($pos_l)
C_LONGINT:C283($sublist_l)
C_BOOLEAN:C305($expanded_boo)

$pos_l:=List item position:C629($list_l; $itemRef_l)

GET LIST ITEM:C378($list_l; $pos_l; $itemRef_l; $text_t; $sublist_l; $expanded_boo)

$type_t:=suite_GetListItemType($list_l; $itemRef_l)

If ($toParentRef_l=-1)  //top level, must be a suite
	
	If ($type_t="suite")
		
		DELETE FROM LIST:C624($list_l; $itemRef_l)
		
		APPEND TO LIST:C376($list_l; $text_t; $itemRef_l; $sublist_l; $expanded_boo)
		suite_SetListItemType($list_l; $type_t; $itemRef_l)
		helper_SuitesListToDocument
		
	Else 
		_E_Throw("Top level items not a 'suite' type")
	End if 
	
Else 
	
	C_TEXT:C284($parType_t; $parText_t)
	C_LONGINT:C283($parPos_l)
	C_LONGINT:C283($parSublist_l)
	C_BOOLEAN:C305($parExpanded_boo)
	
	$parPos_l:=List item position:C629($list_l; $toParentRef_l)
	
	GET LIST ITEM:C378($list_l; $parPos_l; $toParentRef_l; $parText_t; $parSublist_l; $parExpanded_boo)
	
	$parType_t:=suite_GetListItemType($list_l; $toParentRef_l)
	
	If ($parType_t="suite")
		
		DELETE FROM LIST:C624($list_l; $itemRef_l)
		
		If ($parSublist_l=0)
			$parSublist_l:=New list:C375
		End if 
		
		APPEND TO LIST:C376($parSublist_l; $text_t; $itemRef_l; $sublist_l; $expanded_boo)
		suite_SetListItemType($list_l; $type_t; $itemRef_l)
		
		Case of 
			: (Current process:C322=server_request_procssor_process)
				//do nothing
			: (server_is_running)
				client_request_update(->$itemRef_l; $text_t; $toParentRef_l)
			Else 
				helper_SuitesListToDocument
		End case 
		
	Else 
		//do nothing, shouldn't be here anyway ;-)
		_E_Throw("Invalid parent type - must be 'suite'")
	End if 
	
End if 

_callstack_pop