//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: paths_CurrentVersionFile
// Syntax: paths_CurrentVersionFile -> text
// Created by: Mark Schaake
// Date created: 06/17/09, 09:22:46
//
// Description:
//  Returns the path to the text file containing the 
//  current version of UnitTester. This file is in the web
//  public directory and is used to "check for updates"
//  by client installations.
// 
// Returns: 
C_TEXT:C284($0)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************


$0:="Macintosh HD:Applications:MAMP:htdocs:UnitTester4D:public:currentversion.txt"