//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: paths_UnitLicenseGet
// Created by: Mark Schaake
// Date created: 05/30/09, 17:25:57
//
// Description:
//  Returns the path to the license file.
//
// Returns:
C_TEXT:C284($0; $path_t)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
//
//***********************************************************************

$path_t:=System folder:C487(User preferences_all:K41:3)+"UnitTester"+Folder separator:K24:12+"license"

$0:=$path_t

_callstack_pop