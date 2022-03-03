//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/01/08, 12:40:49
// ----------------------------------------------------
// Method: helper_IsValidEmail
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $email_t)
C_BOOLEAN:C305($0; $isValid_boo)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$email_t:=$1

C_TEXT:C284($regEx_t)
$regEx_t:="\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}\\b"

$isValid_boo:=Match regex:C1019($regEx_t; $email_t)

$0:=$isValid_boo