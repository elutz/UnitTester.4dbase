//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: prefs_LogGenerateGet
// Syntax: prefs_LogGenerateGet -> boolean
// Created by: Mark Schaake
// Date created: 06/18/09, 12:01:04
//
// Description:
//  Returns preference to generate a log file.
//  True = generate, False = don't generate
// 
// Returns: 
C_BOOLEAN:C305($0; $generate_boo)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
C_TEXT:C284($gen_t)
// 
//***********************************************************************

prefs_GetById("logs_generate"; ->$gen_t)

$0:=($gen_t="true")