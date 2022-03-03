//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: paths_HostMethods
// Syntax: paths_HostMethods -> text
// Created by: Mark Schaake
// Date created: 06/18/09, 10:16:10
//
// Description:
//  Returns the resource folder containing text files of
//  methods to be created in the host database.
//
// Returns:
C_TEXT:C284($0)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
//
//***********************************************************************


$0:=Get 4D folder:C485(Current resources folder:K5:16)+"Host Methods"+Folder separator:K24:12