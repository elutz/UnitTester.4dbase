//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 03/31/09, 16:59:56
//--------------------------------------------------------------------------------
// Method: _Try
// Use in an If(_Try) block. Will return True (and therefore enter the block)
// if there is no exception to be caught.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_BOOLEAN:C305($0; $noExceptions_boo)

//Required Parameters
// -- NONE --

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

C_BOOLEAN:C305(_e_initialized_in_error)
_e_initialized_in_error:=False:C215

helper_ErrorCallSet("_E_Try_on_error")

$noExceptions_boo:=(exception_t="")

helper_ErrorCallReset

$0:=($noExceptions_boo) | (_e_initialized_in_error)