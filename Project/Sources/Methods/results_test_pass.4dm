//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: results_test_pass
// Syntax: results_test_pass($list_l; $test_t)
// Created by: Mark Schaake
// Date created: 06/18/09, 15:22:33
//
// Description:
//  Adds a passed test to the results.
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $test_t)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$list_l:=$1
$test_t:=$2

helper_Increment(->unitsum_count_tests_l)
helper_Increment(->unitsum_pass_tests_l)
helper_ListAppendWithIcon($list_l; $test_t; ->vAssertOk_pic; 0; 0; False:C215)

log_test(True:C214)