//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: results_assertion_fail
// Syntax: results_assertion_fail($assertionList_l; $description_t)
// Created by: Mark Schaake
// Date created: 06/18/09, 15:10:48
//
// Description:
//  Adds a failed assertion the results.
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $assertionList_l)
C_TEXT:C284($2; $description_t)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$assertionList_l:=$1
$description_t:=$2

test_passed_boo:=False:C215
test_case_passed_boo:=False:C215
helper_Increment(->unitsum_count_assertions_l)
helper_Increment(->unitsum_fail_assertions_l)
helper_ListAppendWithIcon($assertionList_l; $description_t; ->vFailureLead_pic)

log_assertion($description_t)