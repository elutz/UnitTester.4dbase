//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: paths_DocumentationGet
// Created by: Mark Schaake
// Date created: 05/16/09, 18:52:24
//
// Description:
//  Returns the path to the documentation for UnitTester
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($0)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$0:=Get 4D folder:C485(Current resources folder:K5:16)+"UnitTester_Reference.pdf"

