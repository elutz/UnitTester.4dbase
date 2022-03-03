//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 12/29/08, 12:57:42
// ----------------------------------------------------
// Method: Utl_Type4dIsBLOB
// Description
// 
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_BOOLEAN:C305($0)

//REQUIRED PARAMETERS
C_LONGINT:C283($1; $type_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$type_l:=$1

$0:=($type_l=Is BLOB:K8:12)