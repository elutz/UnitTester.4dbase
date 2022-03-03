//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: server_blob_to_document
// Created by: Mark Schaake
// Date created: 05/19/09, 13:30:18
//
// Description:
//  Stores the passed blob as a document in the passed path.
// 
// Returns: --nothing--
// Required Parameters: 
C_BLOB:C604($1; $document_blob)
C_TEXT:C284($2; $path_t)
// Optional Parameters: --none--
// Other Variables:
C_TEXT:C284($parentDir_t)
// 
//***********************************************************************

$document_blob:=$1
$path_t:=$2

$parentDir_t:=helper_ParentDirectory($path_t)
If (Test path name:C476($parentDir_t)#Is a folder:K24:2)
	CREATE FOLDER:C475($parentDir_t)
End if 

BLOB TO DOCUMENT:C526($path_t; $document_blob)