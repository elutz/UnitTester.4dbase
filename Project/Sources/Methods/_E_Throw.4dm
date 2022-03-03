//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 03/31/09, 16:54:37
//--------------------------------------------------------------------------------
// Method: _Throw
// Throws an exception to be caught be a call to _Catch.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_TEXT:C284($1; exception_t; execption_message_t)

//Optional Parameters
C_TEXT:C284($2; execption_message_t)

//--------------------------------------------------------------------------------

exception_t:=$1

If (Count parameters:C259>=2)
	execption_message_t:=$2
Else 
	execption_message_t:=""
End if 

execption_message_t:=execption_message_t+"\rException thrown in method "+callstack_methods{Size of array:C274(callstack_methods)}+"\r"+exception_t