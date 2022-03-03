//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 07:37:44
//--------------------------------------------------------------------------------
// Method: callstack_size
// Returns the current number of methods on the callstack.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_LONGINT:C283($0; $size_l)

//Required Parameters
// -- NONE --

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$size_l:=Size of array:C274(callstack_methods)

$0:=$size_l