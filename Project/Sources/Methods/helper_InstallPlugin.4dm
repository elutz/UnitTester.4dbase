//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: helper_InstallPlugin
// Syntax: helper_InstallPlugin
// Created by: Mark Schaake
// Date created: 07/04/09, 15:02:57
//
// Description:
//  Installs the UnitTester plugin.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters:
C_TEXT:C284($1; $plugin_t)
// Other Variables:
C_TEXT:C284($source_t; $destFolder_t; $dest_t)
// 
//***********************************************************************

If (Count parameters:C259>=1)
	$plugin_t:=$1
Else 
	$plugin_t:="UnitTester"
End if 

$source_t:=paths_SupportPluginCopyGet($plugin_t)
$destFolder_t:=paths_HostPluginsFolderGet
$dest_t:=$destFolder_t+$plugin_t+".bundle"

//Do we need to create the Plugins folder?
If (Test path name:C476($destFolder_t)#Is a folder:K24:2)
	CREATE FOLDER:C475($destFolder_t)
	DELAY PROCESS:C323(Current process:C322; 30)
End if 

If (Test path name:C476($dest_t)=Is a folder:K24:2)
	helper_DirectoryDeleteRecursive($dest_t)
End if 

helper_DirectoryCopy($source_t; $dest_t)