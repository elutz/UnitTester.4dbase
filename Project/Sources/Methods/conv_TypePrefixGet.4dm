//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 12:27:09
//--------------------------------------------------------------------------------
// Method: helper_PrefTypePrefixGet
// Returns the prefix preference for the given data type.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($0; $prefix_t)

//Required Parameters
C_LONGINT:C283($1; $type_l)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$type_l:=$1

prefs_GetById("datatype_prefix_"+String:C10($type_l); ->$prefix_t)

$0:=$prefix_t