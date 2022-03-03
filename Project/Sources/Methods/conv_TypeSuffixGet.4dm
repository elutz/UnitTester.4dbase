//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 12:29:22
//--------------------------------------------------------------------------------
// Method: helper_PrefTypeSuffixGet
// Returns the suffix preference for the given data type.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($0; $suffix_t)

//Required Parameters
C_LONGINT:C283($1; $type_l)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$type_l:=$1

prefs_GetById("datatype_suffix_"+String:C10($type_l); ->$suffix_t)

$0:=$suffix_t