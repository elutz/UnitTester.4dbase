//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: client_request_delete
// Created by: Mark Schaake
// Date created: 05/19/09, 07:56:43
//
// Description:
//  Sends a request to the server queue to delete a
//  list item by reference.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $ref_long_p)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$ref_long_p:=$1

client_request_send($ref_long_p; "delete")