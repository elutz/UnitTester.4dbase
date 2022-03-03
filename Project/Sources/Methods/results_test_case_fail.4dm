//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: results_test_cast_fail
// Syntax: results_test_cast_fail($list_l; $testCase_t; $testsList_l)
// Created by: Mark Schaake
// Date created: 06/18/09, 15:48:13
//
// Description:
//  Adds a failed test case to the results.
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $testCase_t)
C_LONGINT:C283($3; $testsList_l)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$list_l:=$1
$testCase_t:=$2
$testsList_l:=$3

helper_Increment(->unitsum_count_units_l)
helper_Increment(->unitsum_fail_units_l)
helper_ListAppendWithIcon($list_l; $testCase_t; ->vFail_pic; 0; $testsList_l; True:C214)

log_test_case(False:C215)