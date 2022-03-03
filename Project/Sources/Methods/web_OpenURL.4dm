//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: web_OpenURL
// Created by: Mark Schaake
// Date created: 05/16/09, 18:50:09
//
// Description:
//  Opens the web form at the specified URL.
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; web_path_t)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

web_path_t:=$1

helper_OpenProjectForm("Web")