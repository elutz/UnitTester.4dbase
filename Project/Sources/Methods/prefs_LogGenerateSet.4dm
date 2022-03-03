//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: prefs_LogGenerateSet
// Syntax: prefs_LogGenerateSet($set_boo) -> integer
// Created by: Mark Schaake
// Date created: 06/18/09, 12:04:10
//
// Description:
//  Sets the preference to generate log files.
// 
// Returns: --nothing--
// Required Parameters: 
C_BOOLEAN:C305($1; $set_boo)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$set_boo:=$1

prefs_SetById("logs_generate"; Choose:C955($set_boo; "true"; "false"))