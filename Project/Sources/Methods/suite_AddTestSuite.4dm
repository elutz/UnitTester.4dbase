//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 15:43:24
// ----------------------------------------------------
// Method: suite_AddTestSuite
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_LONGINT:C283($0; $pos_l)

//REQUIRED PARAMETERS

//OPTIONAL PARAMETERS
C_TEXT:C284($1; $name_t)
C_LONGINT:C283($2; $list_l; hl_TestSuites)

// ----------------------------------------------------

If (Count parameters:C259>=1)
	$name_t:=$1
Else 
	$name_t:="New Suite"
End if 

If (Count parameters:C259>=2)
	$list_l:=$2
Else 
	$list_l:=hl_TestSuites
End if 

C_LONGINT:C283($selectedItemPos_l; $parentList_l; $sublist_l)
$selectedItemPos_l:=Selected list items:C379($list_l)

If ($selectedItemPos_l>0)
	
	C_LONGINT:C283($selectedRef_l; $parentRef_l)
	C_TEXT:C284($text_t)
	
	$selectedRef_l:=helper_ListItemRefByPositionGet($list_l; -1)
	
	If (suite_GetListItemType($list_l; $selectedRef_l)="suite")  //add as child
		
		GET LIST ITEM:C378($list_l; $selectedItemPos_l; $selectedRef_l; $text_t; $sublist_l)
		
		//Need to create a new list if this is a suite and no sublist currently exists
		If ($sublist_l=0)
			$sublist_l:=New list:C375
			SET LIST ITEM:C385($list_l; $selectedRef_l; $text_t; $selectedRef_l; $sublist_l; True:C214)
		End if 
		
	Else   //add as sibling instead of child
		$parentRef_l:=List item parent:C633($list_l; $selectedRef_l)
		GET LIST ITEM:C378($list_l; List item position:C629($list_l; $parentRef_l); $selectedRef_l; $text_t; $sublist_l)
		
	End if 
	
	
Else 
	$sublist_l:=$list_l
	
End if 

C_PICTURE:C286($pic)
C_LONGINT:C283($ref)
$pic:=helper_GetResourceImage("suite_16.png")
If (server_is_running)
	client_request_suite_add(->$ref; $name_t; $parentRef_l)
	$ref:=helper_ListAppend($sublist_l; $name_t; $ref)
Else 
	$ref:=helper_ListAppend($sublist_l; $name_t; helper_ListItemRefGreatestGet($list_l)+1)
End if 

suite_SetListItemType($list_l; "suite"; $ref)
$pos_l:=List item position:C629($list_l; $ref)

SELECT LIST ITEMS BY REFERENCE:C630($list_l; $ref)

If ($name_t="New Suite")
	EDIT ITEM:C870($list_l; List item position:C629($list_l; $ref))
End if 

$0:=$pos_l