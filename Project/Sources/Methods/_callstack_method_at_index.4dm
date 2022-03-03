//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 07:27:53
//--------------------------------------------------------------------------------
// Method: callstack_method_at_index
// Returns the method on the callstack at the position passed.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($0; $methodName_t)

//Required Parameters
C_LONGINT:C283($1; $index_l)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$index_l:=$1

If (Size of array:C274(callstack_methods)<=$index_l)
	$methodName_t:=callstack_methods{$index_l}
Else 
	$methodName_t:="-no method stack found-"
End if 

$0:=$methodName_t