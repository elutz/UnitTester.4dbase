//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: helper_EditMenuAdd
// Syntax: helper_EditMenuAdd
// Created by: Mark Schaake
// Date created: 05/26/10, 12:04:33
//
// Description:
//  Adds an edit menu to the menu bar.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

//Set the menu bar
C_TEXT:C284($menuRef_t; $utMenuRef_t; $editMenuRef_t)
$menuRef_t:=Create menu:C408
$editMenuRef_t:=Create menu:C408

If (Not:C34(Is compiled mode:C492))
	APPEND MENU ITEM:C411($editMenuRef_t; "Goto Design Mode")
	SET MENU ITEM PROPERTY:C973($editMenuRef_t; -1; Associated standard action:K28:8; ak return to design mode:K76:62)
	SET MENU ITEM SHORTCUT:C423($editMenuRef_t; -1; Character code:C91("d"))
	
	APPEND MENU ITEM:C411($editMenuRef_t; "-")
End if 

APPEND MENU ITEM:C411($editMenuRef_t; "Undo")
SET MENU ITEM PROPERTY:C973($editMenuRef_t; -1; Associated standard action:K28:8; ak undo:K76:51)
SET MENU ITEM SHORTCUT:C423($editMenuRef_t; -1; Character code:C91("z"))

APPEND MENU ITEM:C411($editMenuRef_t; "-")

APPEND MENU ITEM:C411($editMenuRef_t; "Cut")
SET MENU ITEM PROPERTY:C973($editMenuRef_t; -1; Associated standard action:K28:8; ak cut:K76:53)
SET MENU ITEM SHORTCUT:C423($editMenuRef_t; -1; Character code:C91("x"))

APPEND MENU ITEM:C411($editMenuRef_t; "Copy")
SET MENU ITEM PROPERTY:C973($editMenuRef_t; -1; Associated standard action:K28:8; ak copy:K76:54)
SET MENU ITEM SHORTCUT:C423($editMenuRef_t; -1; Character code:C91("c"))

APPEND MENU ITEM:C411($editMenuRef_t; "Paste")
SET MENU ITEM PROPERTY:C973($editMenuRef_t; -1; Associated standard action:K28:8; ak paste:K76:55)
SET MENU ITEM SHORTCUT:C423($editMenuRef_t; -1; Character code:C91("v"))

APPEND MENU ITEM:C411($editMenuRef_t; "-")

APPEND MENU ITEM:C411($editMenuRef_t; "Select All")
SET MENU ITEM PROPERTY:C973($editMenuRef_t; -1; Associated standard action:K28:8; ak select all:K76:57)
SET MENU ITEM SHORTCUT:C423($editMenuRef_t; -1; Character code:C91("a"))

APPEND MENU ITEM:C411($editMenuRef_t; "Show Clipboard")
SET MENU ITEM PROPERTY:C973($editMenuRef_t; -1; Associated standard action:K28:8; ak show clipboard:K76:58)

APPEND MENU ITEM:C411($menuRef_t; "Edit"; $editMenuRef_t)
SET MENU BAR:C67($menuRef_t)

_callstack_pop