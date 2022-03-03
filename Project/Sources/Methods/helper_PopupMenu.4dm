//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 11:25:35
// ----------------------------------------------------
// Method: helper_PopupMenu
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($0; $selected_t)
C_POINTER:C301($1; $item; $2; $menuItems)

//OPTIONAL PARAMETERS
C_BOOLEAN:C305($3; $mousePopup_b)

// ----------------------------------------------------

$item:=$1
$menuItems:=$2

If (Count parameters:C259>=3)
	$mousePopup_b:=$3
Else 
	$mousePopup_b:=False:C215
End if 

C_LONGINT:C283($i)
C_LONGINT:C283($selected_l; $left; $top; $right; $bottom)
C_TEXT:C284($itemText)

For ($i; 1; Size of array:C274($menuItems->))
	If ($i=1)
		$itemText:=$menuItems->{$i}
	Else 
		$itemText:=$itemText+";"+$menuItems->{$i}
	End if 
End for 

If ($mousePopup_b)
	C_LONGINT:C283($button)
	GET MOUSE:C468($left; $bottom; $button)
Else 
	OBJECT GET COORDINATES:C663($item->; $left; $top; $right; $bottom)
End if 

$selected_l:=Pop up menu:C542($itemText; 1; $left; $bottom)

If ($selected_l>0)
	$selected_t:=$menuItems->{$selected_l}
Else 
	$selected_t:=""
End if 

$0:=$selected_t