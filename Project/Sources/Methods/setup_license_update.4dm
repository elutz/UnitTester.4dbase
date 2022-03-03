//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_license_update
// Syntax: setup_license_update($newLicense_t) -> boolean
// Created by: Mark Schaake
// Date created: 06/26/10, 11:27:29
//
// Description:
//  Updates the license
// 
// Returns: 
C_BOOLEAN:C305($0; $success_b)
// Required Parameters: 
C_TEXT:C284($1; $newLicense_t)
// Optional Parameters: --none--
// Other Variables:
C_BLOB:C604($blob)
// 
//***********************************************************************

$newLicense_t:=Replace string:C233($1; "-"; "")

$success_b:=setup_validate_key($newLicense_t)

If ($success_b)
	TEXT TO BLOB:C554($newLicense_t; $blob; UTF8 text without length:K22:17)
	server_blob_to_document($blob; paths_UnitLicenseGet)
End if 

$0:=$success_b

_callstack_pop