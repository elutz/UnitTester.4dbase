//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/10/09, 19:04:29
//--------------------------------------------------------------------------------
// Method: helper_Increment
// Increments the integer passed.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_POINTER:C301($1; $int_p)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$int_p:=$1
$int_p->:=$int_p->+1

_callstack_pop  //keep this at the end of the method