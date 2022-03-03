//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/26/08, 23:04:34
// ----------------------------------------------------
// Method: Unit_BeginTest
// Description:
// Must be called in a test method prior to any assertions
// The $testName parameter should be a unique name among
// tests within the test method - i.e. you should never
// write a test method having multiple tests with the same
// name. It IS ok to have the same test name in different
// test methods.
//
// ----------------------------------------------------
//
// Returns True to allow a test to have it's on If(Unit_BeginTest())...End if block
C_BOOLEAN:C305($0)

//REQUIRED PARAMETERS
C_TEXT:C284($1; $testName_t; $2; $testMethod_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$testName_t:=$1
$testMethod_t:=$2

APPEND TO ARRAY:C911(<>TestNames_at; $testName_t)

$0:=True:C214