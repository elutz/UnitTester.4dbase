//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: paths_TestsResourceFolderGet
// Date created: 05/15/09, 14:49:56
// Created by: Mark Schaake
// Returns: 
C_TEXT:C284($0)
// Required Parameters: --none--
// Optional Parameters: --none''
//***********************************************************************

$0:=Get 4D folder:C485(Database folder:K5:14; *)+"unit_tester"+Folder separator:K24:12
