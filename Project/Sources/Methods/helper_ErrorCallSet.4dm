//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 19:06:45
//--------------------------------------------------------------------------------
// Method: helper_ErrorCallSet
// Sets the on error call and stores previous on error method to be restored later.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_TEXT:C284($1; $method_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$method_t:=$1

C_TEXT:C284(_error_reset_t)
_error_reset_t:=Method called on error:C704

ON ERR CALL:C155($method_t)