//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: paths_SupportPluginGet
// Syntax: paths_SupportPluginGet -> text
// Created by: Mark Schaake
// Date created: 07/04/09, 14:51:40
//
// Description:
//  Returns the path of the UnitTester plugin on the server.
// 
// Returns: 
C_TEXT:C284($0)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************


$0:=paths_HostPluginsFolderGet+"UnitTester.bundle"