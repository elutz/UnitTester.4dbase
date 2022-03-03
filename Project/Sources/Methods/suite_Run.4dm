//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 20:59:25
// ----------------------------------------------------
// Method: suite_Run
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $suiteRef_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

If (Count parameters:C259>=1)
	$suiteRef_l:=$1
Else 
	$suiteRef_l:=helper_ListItemRefByPositionGet(hl_TestSuites; -1)
End if 

C_LONGINT:C283($sublist_l; $itemRef_l)

GET LIST ITEM:C378(hl_TestSuites; List item position:C629(hl_TestSuites; $suiteRef_l); $itemRef_l; $text_t; $sublist_l)

If ($sublist_l>0)
	
	RunTests($sublist_l)
	
End if 