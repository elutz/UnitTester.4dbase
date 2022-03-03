//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: results_test_fail
// Syntax: results_test_fail($list_l; $test_t; $assertList_l)
// Created by: Mark Schaake
// Date created: 06/18/09, 15:25:52
//
// Description:
//  Adds a failed test to the results
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $test_t)
C_LONGINT:C283($3; $assertList_l)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$list_l:=$1
$test_t:=$2
$assertList_l:=$3

helper_Increment(->unitsum_count_tests_l)
helper_Increment(->unitsum_fail_tests_l)
helper_ListAppendWithIcon($list_l; $test_t; ->vAssertFail_pic; 0; $assertList_l; True:C214)

log_test(False:C215)