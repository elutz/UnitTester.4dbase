//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/25/08, 15:05:53
// ----------------------------------------------------
// Method: Utl_Type4dIsTime
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

$0:=($type_l=Is time:K8:8)