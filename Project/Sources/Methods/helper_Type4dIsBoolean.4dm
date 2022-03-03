//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 12/01/08, 15:20:00
// ----------------------------------------------------
// Method: Utl_Type4dIsBoolean
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

$0:=($type_l=Is boolean:K8:9)
