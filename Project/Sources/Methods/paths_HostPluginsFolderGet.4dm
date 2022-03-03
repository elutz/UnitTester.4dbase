//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: paths_HostPluginsFolderGet
// Syntax: paths_HostPluginsFolderGet -> text
// Created by: Mark Schaake
// Date created: 07/24/09, 18:56:09
//
// Description:
//  Returns the path to the server plugins folder
//
// Returns:
C_TEXT:C284($0; $path_t)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
//
//***********************************************************************


$0:=helper_ParentDirectory(Structure file:C489(*))+"Plugins"+Folder separator:K24:12