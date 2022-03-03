//%attributes = {}

// ----------------------------------------------------
// User name (OS): Lutz.Epperlein
// Date and time: 14.09.18, 14:30:42
// ----------------------------------------------------
// Method: method_doesNotExist
// Description
// Returns true if the method does exist
//
// Returns: --nothing--
C_BOOLEAN:C305($0)
// Required Parameters: 
C_TEXT:C284($1; $method_t)

// ----------------------------------------------------

$method_t:=$1

ARRAY TEXT:C222($methods; 0)
METHOD GET NAMES:C1166($methods; $method_t; *)

$0:=Size of array:C274($methods)>0