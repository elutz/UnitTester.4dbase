//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/27/08, 02:39:02
// ----------------------------------------------------
// Method: Utl_Type4dIsReal
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

$0:=(($type_l=Is real:K8:4) | ($type_l=_o_Is float:K8:26))