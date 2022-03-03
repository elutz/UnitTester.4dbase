//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: server_document_to_text
// Created by: Mark Schaake
// Date created: 05/30/09, 22:28:08
//
// Description:
//  Returns the text value of a document.
// 
// Returns: 
C_TEXT:C284($0; $text_t)
// Required Parameters: 
C_TEXT:C284($1; $path_t)
// Optional Parameters: --none--
// Other Variables:
C_BLOB:C604($blob)
// 
//***********************************************************************

$path_t:=$1

$blob:=server_document_to_blob($path_t)
$text_t:=Convert to text:C1012($blob; "UTF-8")

$0:=$text_t

_callstack_pop