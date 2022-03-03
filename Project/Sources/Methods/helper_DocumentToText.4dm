//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:12:27
// ----------------------------------------------------
// Method: helper_DocumentToText
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $text_t)

//REQUIRED PARAMETERS
C_TEXT:C284($1; $document_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$document_t:=$1

If (Test path name:C476($document_t)=Is a document:K24:1)
	
	C_BLOB:C604($blob)
	DOCUMENT TO BLOB:C525($document_t; $blob)
	$text_t:=BLOB to text:C555($blob; UTF8 text without length:K22:17)
	
Else 
	$text_t:=""
End if 

$0:=$text_t