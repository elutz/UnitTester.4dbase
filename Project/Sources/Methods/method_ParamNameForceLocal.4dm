//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: method_ParamNameForceLocal
// Created by: Mark Schaake
// Date created: 05/16/09, 09:50:14
//
// Description:
//  Adds a '$' to the front of a variable name if it doesn't already have one.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $varName_p)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$varName_p:=$1
$varName_p->:=helper_Trim($varName_p->)

If ($varName_p->#"")
	If (Not:C34(Match regex:C1019("\\$.*"; $varName_p->)))
		$varName_p->:="$"+$varName_p->
	End if 
End if 