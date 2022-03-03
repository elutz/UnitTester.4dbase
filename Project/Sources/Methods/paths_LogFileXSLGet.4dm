//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: paths_LogFileXSLGet
// Syntax: paths_LogFileXSLGet -> text
// Created by: Mark Schaake
// Date created: 06/20/09, 07:33:14
//
// Description:
//  Returns the path to the log file xsl document.
//
// Returns:
C_TEXT:C284($0; $path_t)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
//
//***********************************************************************

$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"xml"+Folder separator:K24:12+"log.xsl"

$0:=$path_t