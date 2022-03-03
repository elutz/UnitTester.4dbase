//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/01/08, 09:22:56
// ----------------------------------------------------
// Method: suite_GetSelectedItems
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)
C_POINTER:C301($2; $items_alp)  // Pointer to long array of item refs that will be appended

//OPTIONAL PARAMETERS
C_POINTER:C301($3; $selectedItemRefs_alp)


// ----------------------------------------------------

$list_l:=$1
$items_alp:=$2

If (Count parameters:C259>=3)  //Passed only in recursion
	$selectedItemRefs_alp:=$3
Else 
	ARRAY LONGINT:C221($items_al; 0)
	C_LONGINT:C283($pos_l)
	$pos_l:=Selected list items:C379($list_l; $items_al; *)
	$selectedItemRefs_alp:=->$items_al
End if 

C_LONGINT:C283($copy_l)
$copy_l:=Copy list:C626($list_l)

C_LONGINT:C283($i; $ref_l)
$i:=0
For ($i; 1; Size of array:C274($selectedItemRefs_alp->))
	
	$type_t:=suite_GetListItemType($copy_l; $selectedItemRefs_alp->{$i})
	
	Case of 
		: ($type_t="suite")  //Add all items, and sub suites
			
			ARRAY LONGINT:C221($subUnits_al; 0)
			suite_GetAllUnitItemRefs($copy_l; $selectedItemRefs_alp->{$i}; ->$subUnits_al)
			helper_ArrayAppendArray(->$subUnits_al; $items_alp)
			
		: ($type_t="unit")
			
			APPEND TO ARRAY:C911($items_alp->; $selectedItemRefs_alp->{$i})
			
	End case 
	
End for 

CLEAR LIST:C377($copy_l; *)