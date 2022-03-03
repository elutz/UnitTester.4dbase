//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/27/08, 10:45:43
// ----------------------------------------------------
// Method: Unit_TrueAssert
// Description
// Lowest level assertion upon which all other assertions depend.
// Must be called only within the context of a call to Unit_RunTestSuite to ensure global variables are initialized
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_BOOLEAN:C305($1; $test_boo)

//OPTIONAL PARAMETERS
C_TEXT:C284($2; $failure_t)

// ----------------------------------------------------

$test_boo:=$1

If (Count parameters:C259>=2)
	$failure_t:=$2
Else 
	$failure_t:="Failed"
End if 

APPEND TO ARRAY:C911(<>TestAssertionTestNames_at; <>TestNames_at{Size of array:C274(<>TestNames_at)})
APPEND TO ARRAY:C911(<>TestAssertionsPassed_boo; $test_boo)
APPEND TO ARRAY:C911(<>TestAssertionsFailures_at; Choose:C955($test_boo; ""; $failure_t))