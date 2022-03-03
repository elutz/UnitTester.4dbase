//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_ensure_4d_pack
// Syntax: setup_ensure_4d_pack -> boolean
// Created by: Mark Schaake
// Date created: 07/24/09, 16:52:22
//
// Description:
//  Requires the 4D Pack plugin to be installed.
// 
// Returns: 
C_BOOLEAN:C305($0; $is_installed_b)
// Required Parameters: --none--
// Optional Parameters:
C_BOOLEAN:C305($1; $forceUpgrade_b)
// Other Variables:
// 
//***********************************************************************

If (Count parameters:C259>=1)
	$forceUpgrade_b:=$1
Else 
	$forceUpgrade_b:=False:C215
End if 

$is_installed_b:=setup_ensure_plugin($forceUpgrade_b; "4D Pack")

$0:=$is_installed_b

_callstack_pop