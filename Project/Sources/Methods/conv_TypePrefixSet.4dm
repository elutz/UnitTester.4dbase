//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 12:43:29
//--------------------------------------------------------------------------------
// Method: helper_PrefTypePrefixSet
// Sets a type prefix.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_LONGINT:C283($1; $typeId_l)
C_TEXT:C284($2; $prefix_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$typeId_l:=$1
$prefix_t:=$2

prefs_SetById("datatype_prefix_"+String:C10($typeId_l); $prefix_t)
