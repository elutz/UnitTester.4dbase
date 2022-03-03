//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: log_test
// Syntax: log_test($name_t; $pass_b)
// Created by: Mark Schaake
// Date created: 06/19/09, 18:41:28
//
// Description:
//  Logs a test.
// 
// Returns: --nothing--
// Required Parameters: 
C_BOOLEAN:C305($1; $pass_b)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$pass_b:=$1

If (log_enabled_b)
	DOM SET XML ATTRIBUTE:C866(xml_test_t; "pass"; Choose:C955($pass_b; "true"; "false"))
End if 