//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: client_request_update_name
// Created by: Mark Schaake
// Date created: 05/19/09, 14:04:34
//
// Description:
//  Sends a request to change the name of the list item.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $ref_long_p)
C_TEXT:C284($2; $newName_t)
// Optional Parameters:
C_LONGINT:C283($3; $newParent_l)
// Other Variables:
// 
//***********************************************************************

$ref_long_p:=$1
$newName_t:=$2
If (Count parameters:C259>=3)
	$newParent_l:=$3
End if 

client_request_send($ref_long_p; "update"; $newName_t; $newParent_l)