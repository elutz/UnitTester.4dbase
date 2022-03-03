//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 20:08:27
// ----------------------------------------------------
// Method: suite_ContextualMenu
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_POINTER:C301($1; $object_p)
C_BOOLEAN:C305($2; $mousePopup_boo)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$object_p:=$1
$mousePopup_boo:=$2

ARRAY TEXT:C222($items_at; 0)
C_LONGINT:C283($itemPos_l)
C_BOOLEAN:C305($itemIsSelected_boo)
C_TEXT:C284($itemType_t; $selected_t)

$itemPos_l:=Selected list items:C379(hl_TestSuites)
$itemIsSelected_boo:=($itemPos_l>0)

If ($itemIsSelected_boo)
	$itemType_t:=suite_GetListItemType(hl_TestSuites; -1)
	
	APPEND TO ARRAY:C911($items_at; "Run selected")
	APPEND TO ARRAY:C911($items_at; "-")
	APPEND TO ARRAY:C911($items_at; "New Test Suite")
	If (Is compiled mode:C492(*))
		APPEND TO ARRAY:C911($items_at; "(New Test Case - not available compiled")
	Else 
		APPEND TO ARRAY:C911($items_at; "New Test Case")
	End if 
	APPEND TO ARRAY:C911($items_at; "-")
	APPEND TO ARRAY:C911($items_at; "Delete")
Else 
	APPEND TO ARRAY:C911($items_at; "(Run selected")
	APPEND TO ARRAY:C911($items_at; "-")
	APPEND TO ARRAY:C911($items_at; "New Test Suite")
	APPEND TO ARRAY:C911($items_at; "(New Test Case")
	APPEND TO ARRAY:C911($items_at; "-")
	APPEND TO ARRAY:C911($items_at; "(Delete")
End if 

$selected_t:=helper_PopupMenu($object_p; ->$items_at; $mousePopup_boo)

Case of 
	: ($selected_t="Run selected")
		RunSelected
		
	: ($selected_t="New Test Suite")
		suite_OpenInputForm
		
	: ($selected_t="New Test Case")
		suite_OpenInputForm(helper_ListItemRefByPositionGet(hl_TestSuites))
		
	: ($selected_t="Delete")
		suite_DeleteSelected
		
End case 
