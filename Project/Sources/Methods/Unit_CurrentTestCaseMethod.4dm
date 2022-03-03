//%attributes = {"invisible":true,"shared":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: Unit_CurrentTestCaseMethod
// Syntax: Unit_CurrentTestCaseMethod -> text
// Created by: Mark Schaake
// Date created: 07/24/09, 16:42:56
//
// Description:
//  Returns the name of the current test case method being executed.
//  For error handling purposes.
// 
// Returns: 
C_TEXT:C284($0; $method_t; vMethod_t)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$method_t:=vMethod_t

$0:=$method_t

_callstack_pop