//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: method_HomeFolderArraySave
// Created by: Mark Schaake
// Date created: 05/16/09, 10:51:01
//
// Description:
//  Saves the passed array to disk.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $folders_array_text_p)
// Optional Parameters:
C_TEXT:C284($2; $path_t)
// Other Variables:
// 
//***********************************************************************

$folders_array_text_p:=$1

If (Count parameters:C259>=2)
	$path_t:=$2
Else 
	$path_t:=paths_HomeFolderArrayGet
End if 

helper_ArrayTextDeleteBlanks($folders_array_text_p)

SORT ARRAY:C229($folders_array_text_p->)

C_BLOB:C604($blob)
VARIABLE TO BLOB:C532($folders_array_text_p->; $blob)
server_blob_to_document($blob; $path_t)