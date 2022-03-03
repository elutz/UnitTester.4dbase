//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 19:07:32
//--------------------------------------------------------------------------------
// Method: helper_ErrorCallReset
// Resets the on error call method to previous value.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
// -- NONE --

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
C_TEXT:C284(_error_reset_t)
ON ERR CALL:C155(_error_reset_t)
_error_reset_t:=""