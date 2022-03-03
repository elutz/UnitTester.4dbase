//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 09:01:14
// ----------------------------------------------------
// Method: Test_AssertFalse
// Description
// 
//
// Parameters
// ----------------------------------------------------



C_BOOLEAN:C305($1; $test_boo)
C_TEXT:C284($2; $failure_t)

$test_boo:=$1

If (Count parameters:C259>=2)
	$failure_t:=$2
Else 
	$failure_t:="Failed"
End if 

Unit_TrueAssert(Not:C34($test_boo); $failure_t)