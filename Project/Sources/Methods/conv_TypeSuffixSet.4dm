//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 12:45:13
//--------------------------------------------------------------------------------
// Method: helper_PrefTypeSuffixSet
// Sets the suffix for a data type.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_LONGINT:C283($1; $typeId_l)
C_TEXT:C284($2; $suffix_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$typeId_l:=$1
$suffix_t:=$2

prefs_SetById("datatype_suffix_"+String:C10($typeId_l); $suffix_t)
