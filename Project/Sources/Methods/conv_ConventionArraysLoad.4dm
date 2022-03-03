//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 12:36:12
//--------------------------------------------------------------------------------
// Method: helper_PrefCodingArraysLoad
// Loads the coding preference arrays to contain:
// Data type names
// Data type ids
// Prefixes
// Suffixes
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_POINTER:C301($1; $names_atp)
C_POINTER:C301($2; $ids_alp)
C_POINTER:C301($3; $prefixes_atp)
C_POINTER:C301($4; $suffixes_atp)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$names_atp:=$1
$ids_alp:=$2
$prefixes_atp:=$3
$suffixes_atp:=$4

helper_Type4dDataTypesGet($names_atp; $ids_alp)

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Size of array:C274($names_atp->))
	APPEND TO ARRAY:C911($prefixes_atp->; conv_TypePrefixGet($ids_alp->{$i}))
	APPEND TO ARRAY:C911($suffixes_atp->; conv_TypeSuffixGet($ids_alp->{$i}))
End for 