//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: conv_TestCaseMethodPrefixGet
// Syntax: conv_TestCaseMethodPrefixGet -> text
// Created by: Mark Schaake
// Date created: 07/07/09, 20:12:06
//
// Description:
//  Returns either the preference set for prefix, or underscore if blank.
// 
// Returns: 
C_TEXT:C284($0; $prefix_t)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

prefs_GetById("test_method_prefix"; ->$prefix_t)

If ($prefix_t="")
	$prefix_t:="_"
End if 

$0:=$prefix_t

_callstack_pop