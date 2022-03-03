//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: prefs_CheckboxToString
// Syntax: prefs_CheckboxToString($checkbox_l)
// Created by: Mark Schaake
// Date created: 07/04/09, 14:16:42
//
// Description:
//  Returns a string value for storing in prefernces:
//  1 = true
//  2 = false
// 
// Returns:
C_TEXT:C284($0)
// Required Parameters: 
C_LONGINT:C283($1; $checkbox_l)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$checkbox_l:=$1

$0:=Choose:C955($checkbox_l=1; "true"; "false")