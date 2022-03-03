//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: log_test_case
// Syntax: log_test_case($passed_b)
// Created by: Mark Schaake
// Date created: 06/19/09, 18:46:29
//
// Description:
//  Logs a test case.
// 
// Returns: --nothing--
// Required Parameters: 
C_BOOLEAN:C305($1; $passed_b)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$passed_b:=$1

If (log_enabled_b)
	DOM SET XML ATTRIBUTE:C866(xml_test_case_t; "pass"; Choose:C955($passed_b; "true"; "false"))
End if 