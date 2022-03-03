//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: log_assertion
// Syntax: log_assertion($description_t)
// Created by: Mark Schaake
// Date created: 06/19/09, 18:39:37
//
// Description:
//  Logs an assertion.
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $description_t)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$description_t:=$1

If (log_enabled_b)
	xml_assertion_t:=DOM Create XML element:C865(xml_assertions_t; "assertion")
	DOM SET XML ELEMENT VALUE:C868(xml_assertion_t; $description_t)
End if 