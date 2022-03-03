//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: method_HomeFolderArrayLoad
// Created by: Mark Schaake
// Date created: 05/16/09, 10:41:12
//
// Description:
//  Loads the passed array with the home folder names
//  previously enterred by the user.
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

C_BLOB:C604($blob)
$blob:=server_document_to_blob($path_t)

If (BLOB size:C605($blob)>0)
	BLOB TO VARIABLE:C533($blob; $folders_array_text_p->)
Else 
	//Do nothing, array should be cleared.
	helper_ArrayClear($folders_array_text_p)
End if 