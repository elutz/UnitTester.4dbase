//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 03/31/09, 16:21:10
//--------------------------------------------------------------------------------
// Method: _callstack_pop
// Pops the top-most method off the call stack.
// Call this method at the end of a method's body.
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

If (Size of array:C274(callstack_methods)>0)
	
	DELETE FROM ARRAY:C228(callstack_methods; Size of array:C274(callstack_methods))
	
End if 