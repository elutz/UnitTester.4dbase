//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/18/08, 14:30:10
// ----------------------------------------------------
// Method: XML_ElementNameGet
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $name_t)

//REQUIRED PARAMETERS
C_TEXT:C284($1; $elemRef_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$elemRef_t:=$1

DOM GET XML ELEMENT NAME:C730($elemRef_t; $name_t)

$0:=$name_t