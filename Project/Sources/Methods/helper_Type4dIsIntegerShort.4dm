//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 08:05:41
//--------------------------------------------------------------------------------
// Method: helper_Type4dIsIntegerShort
// 
//
//--------------------------------------------------------------------------------
//
//Return Value
C_BOOLEAN:C305($0)

//Required Parameters
C_LONGINT:C283($1; $type_l)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$type_l:=$1

$0:=($type_l=Is integer:K8:5)
