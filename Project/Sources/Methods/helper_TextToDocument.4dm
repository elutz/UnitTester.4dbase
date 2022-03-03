//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:15:22
// ----------------------------------------------------
// Method: helper_TextToDocument
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $text_t; $2; $doc_path_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$text_t:=$1
$doc_path_t:=$2

TEXT TO DOCUMENT:C1237($doc_path_t; $text_t; "UTF-8")

//C_BLOB($blob)

//TEXT TO BLOB($text_t;$blob;UTF8 text without length)

//BLOB TO DOCUMENT($doc_path_t;$blob)