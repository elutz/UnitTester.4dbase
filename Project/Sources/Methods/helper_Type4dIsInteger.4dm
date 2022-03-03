//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/27/08, 02:37:27
// ----------------------------------------------------
// Method: Utl_Type4dIsInteger
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_BOOLEAN:C305($0)

//REQUIRED PARAMETERS
C_LONGINT:C283($1; $type_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$type_l:=$1

$0:=(($type_l=Is integer:K8:5) | ($type_l=Is integer 64 bits:K8:25) | ($type_l=Is longint:K8:6))
