//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/31/09, 15:38:41
// ----------------------------------------------------
// Method: callstack_initialize
// Initializes call stack variables for use in each new process.
//
// ----------------------------------------------------
//
//Return Value
// -- NONE --


//Required Parameters
// -- NONE --


//Optional Parameters
//These are here for testing support only. Will not use the parameters in production.
C_DATE:C307($1; $date_d)
C_REAL:C285($2; $real_r)

// ----------------------------------------------------

If (Count parameters:C259=2)
	$date_d:=$1
	$real_r:=$2
Else 
	_E_Initialize
End if 

ARRAY TEXT:C222(callstack_methods; 0)