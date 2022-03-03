//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 14:27:06
// ----------------------------------------------------
// Method: helper_PrefsSave
// Description
// 
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $ref_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$ref_t:=$1

C_BLOB:C604($blob)
DOM EXPORT TO VAR:C863($ref_t; $blob)
server_blob_to_document($blob; paths_PrefsGet)

DOM CLOSE XML:C722($ref_t)