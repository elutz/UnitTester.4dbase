//%attributes = {"invisible":true,"shared":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: Unit_CustomLogTextSet
// Syntax: Unit_CustomLogTextSet($data_t; $test_case_method_t)
// Created by: Mark Schaake
// Date created: 06/19/09, 22:31:14
//
// Description:
//  Sets a custom text data for a test case method.
//  This data will print out in the log file. Call only once 
//  per test case method.
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $data_t)
C_TEXT:C284($2; $test_case_method_t)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$data_t:=$1
$test_case_method_t:=$2

C_LONGINT:C283($pos)
$pos:=Find in array:C230(<>TestCaseMethods_at; $test_case_method_t)

If ($pos>0)
	<>UserData_at{$pos}:=$data_t
Else 
	//_E_Throw ("Invalid test case method name";$test_case_method_t)
End if 

_callstack_pop