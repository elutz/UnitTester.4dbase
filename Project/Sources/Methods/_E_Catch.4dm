//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 03/31/09, 17:01:53
//--------------------------------------------------------------------------------
// Method: _Catch
// Compares the passed exception to the currently thrown exception (if any).
// Returns true if it matches. If no parameter is passed, it will catch any exception.
// Use in a Case... :(_Catch("...")) block.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_BOOLEAN:C305($0; $caught_boo)

//Required Parameters

//Optional Parameters
C_TEXT:C284($1; $exception_t)  //this is a regular expression, default is ".+"

//--------------------------------------------------------------------------------

If (Count parameters:C259>=1)
	$exception_t:=$1
Else 
	$exception_t:=".+"
End if 

$caught_boo:=Match regex:C1019($exception_t; exception_t)

If ($caught_boo)
	exception_caught_message_t:=execption_message_t
	exception_t:=""
	execption_message_t:=""
End if 

$0:=$caught_boo