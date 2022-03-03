//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: prefs_ConventionsStrictGet
// Created by: Mark Schaake
// Date created: 06/15/09, 15:46:39
//
// Description:
//  Returns the boolean value of the preferences set for
//  having coding conventions strictly enforced (no exceptions)
// 
// Returns: 
C_BOOLEAN:C305($0; $isStrict_boo)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************
C_TEXT:C284($strict_t)
prefs_GetById("conventions_strict"; ->$strict_t)

$0:=($strict_t="true")