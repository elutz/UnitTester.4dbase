//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: paths_SupportPluginCopyGet
// Syntax: paths_SupportPluginCopyGet -> text
// Created by: Mark Schaake
// Date created: 07/04/09, 15:01:19
//
// Description:
//  Returns the path to the plugin stored in the component's resources folder.
//
// Returns:
C_TEXT:C284($0)
// Required Parameters: --none--
// Optional Parameters:
C_TEXT:C284($1; $plugin_t)
// Other Variables:
//
//***********************************************************************

If (Count parameters:C259>=1)
	$plugin_t:=$1
Else 
	$plugin_t:="UnitTester"
End if 

//4D pack for some reason doesn't use underscore consistently
If ($plugin_t="4D_Pack")
	$plugin_t:="4D Pack"
End if 

$0:=Get 4D folder:C485(Current resources folder:K5:16)+"Plugins"+Folder separator:K24:12+$plugin_t+".bundle"