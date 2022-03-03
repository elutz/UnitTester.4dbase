//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: server_document_to_blob
// Created by: Mark Schaake
// Date created: 05/19/09, 13:25:32
//
// Description:
//  Returns a blob from the document at the path specified.
// 
// Returns: 
C_BLOB:C604($0; $document_blob)
// Required Parameters: 
C_TEXT:C284($1; $path_t)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$path_t:=$1

If (Test path name:C476($path_t)=Is a document:K24:1)
	
	DOCUMENT TO BLOB:C525($path_t; $document_blob)
	
End if 

$0:=$document_blob