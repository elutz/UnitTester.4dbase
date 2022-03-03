//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 14:33:03
// ----------------------------------------------------
// Method: helper_PrefsParse
// Description
// 
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $ref_t)

//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_BLOB:C604($blob)
$blob:=server_document_to_blob(paths_PrefsGet)

If (BLOB size:C605($blob)=0)
	$ref_t:=DOM Create XML Ref:C861("Preferences")
Else 
	$ref_t:=DOM Parse XML variable:C720($blob)
End if 

$0:=$ref_t