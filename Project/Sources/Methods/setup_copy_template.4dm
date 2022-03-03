//%attributes = {"invisible":true}
// Method Name: setup_copy_template
// Syntax: setup_copy_template($templatePath_t{; $overwriteExisting_b})
// Created by: Mark Schaake on: 06/27/10, 21:01:54
// Description:
//  Copies over a single template from the default templates folder.

// Returns: --nothing--

// Required Parameters: 
C_TEXT:C284($1; $templatePath_t)

// Optional Parameters: 
C_BOOLEAN:C305($2; $overwriteExisting_b)

// Other Variables:


$templatePath_t:=$1
If (Count parameters:C259>=2)
	$overwriteExisting_b:=$2
End if 

_callstack_push(Current method name:C684)


Case of 
	: ($templatePath_t=paths_MethodHeaderTemplateGet)
		
		If (Test path name:C476(paths_MethodHeaderTemplateGet(True:C214))#Is a document:K24:1) | ($overwriteExisting_b)
			COPY DOCUMENT:C541(paths_MethodHeaderTemplateGet(False:C215; True:C214); paths_MethodHeaderTemplateGet(True:C214); *)
		End if 
		
	: ($templatePath_t=paths_TestCaseTemplateGet)
		
		If (Test path name:C476(paths_TestCaseTemplateGet(True:C214))#Is a document:K24:1) | ($overwriteExisting_b)
			COPY DOCUMENT:C541(paths_TestCaseTemplateGet(False:C215; True:C214); paths_TestCaseTemplateGet(True:C214); *)
		End if 
		
End case 


_callstack_pop