//%attributes = {"invisible":true,"executedOnServer":true}
// Method Name: setup_copy_templates
// Syntax: setup_copy_templates
// Created by: Mark Schaake
// Date created: 05/25/10, 21:15:56
//
// Description:
//  Copies over the production and unit test method templates into unit_tester/ directory. 
//  This allows the preservation of templates through upgrades.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:

_callstack_push(Current method name:C684)

setup_copy_template(paths_MethodHeaderTemplateGet)
setup_copy_template(paths_TestCaseTemplateGet)

_callstack_pop