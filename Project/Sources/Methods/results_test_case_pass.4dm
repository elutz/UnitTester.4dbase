//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: results_test_cass_pass
// Syntax: results_test_cass_pass($list_l; $testCase_t; $testsList_l)
// Created by: Mark Schaake
// Date created: 06/18/09, 15:39:27
//
// Description:
//  Adds a passed test case to the results.
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
helper_Increment(->unitsum_pass_units_l)

If (Not:C34(prefs_HidePassesGet))
	helper_ListAppendWithIcon($list_l; $testCase_t; ->vOk_pic; 0; $testsList_l; False:C215)
End if 

log_test_case(True:C214)