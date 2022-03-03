//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 12:54:17
//--------------------------------------------------------------------------------
// Method: helper_Type4dName
// Returns the type name = lowercase version of C_datatype without the C_
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($0; $name_t)

//Required Parameters
C_LONGINT:C283($1; $type_l)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$type_l:=$1

$name_t:=Lowercase:C14(Substring:C12(helper_Type4dCompilerCommand($type_l); 3))

$0:=$name_t