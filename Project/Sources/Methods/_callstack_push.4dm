//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/31/09, 15:33:44
// ----------------------------------------------------
// Method: _callstack_push
// Pushes the passed method name onto the call stack for retrieval by a thrown exception.
// 
//
// ----------------------------------------------------
//
//Return Value
// -- NONE --


//Required Parameters
C_TEXT:C284($1; $methodName_t)

//Optional Parameters

// ----------------------------------------------------

$methodName_t:=$1

helper_ErrorCallSet("_callstack_push_on_error")

APPEND TO ARRAY:C911(callstack_methods; $methodName_t)

helper_ErrorCallReset