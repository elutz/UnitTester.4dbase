//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 07:46:34
//--------------------------------------------------------------------------------
// Method: E_Try_on_error
// Initializes exception variables when a call to E_Try causes a 4D error.
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

C_BOOLEAN:C305(_e_initialized_in_error)
_e_initialized_in_error:=True:C214

_E_Initialize
