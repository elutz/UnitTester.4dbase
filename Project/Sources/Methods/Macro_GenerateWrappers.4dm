//%attributes = {"invisible":true,"shared":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: Macro_GenerateWrappers
// Syntax: Macro_GenerateWrappers
// Created by: Mark Schaake
// Date created: 05/25/10, 14:30:27
//
// Description:
//  Generates wrapper methods on host for all shared UnitTester methods.
//  This allows the component to be removed for deployment.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters:
C_TEXT:C284($1; $prefix_t)
// Other Variables:
// 
//***********************************************************************

If (Count parameters:C259>=1)
	$prefix_t:=$1
Else 
	$prefix_t:=""
End if 

$prefix_t:=helper_Trim($prefix_t)

If (Not:C34(Is compiled mode:C492(*)))
	
	//If (setup_ensure_4d_pack )
	
	C_LONGINT:C283($i)
	C_TEXT:C284($path_t; $method_t)
	ARRAY TEXT:C222($methods_at; 0)
	ARRAY LONGINT:C221($methodProps_al; 7)
	$methodProps_al{1}:=1  //invisible
	$methodProps_al{2}:=0
	$methodProps_al{3}:=0
	$methodProps_al{4}:=0
	$methodProps_al{5}:=0  //(not) shared
	$methodProps_al{6}:=0
	$methodProps_al{7}:=0
	
	$path_t:=paths_WrapperMethods
	DOCUMENT LIST:C474($path_t; $methods_at)
	
	C_BOOLEAN:C305($ok_b; $cancel_b)
	$ok_b:=False:C215
	$cancel_b:=False:C215
	
	If ($prefix_t="") | (Lowercase:C14($prefix_t)="_unit")
		
		Repeat 
			$prefix_t:=Request:C163("Enter the prefix you'd like to use"; "UTW_"; "Generate"; "Cancel")
			$cancel_b:=(OK=0)
			$ok_b:=($prefix_t#"") & (Lowercase:C14($prefix_t)#"unit_")
			If (Not:C34($ok_b)) & (Not:C34($cancel_b))
				ALERT:C41("Invalid prefix: must not be blank and cannot be unit_")
			End if 
		Until ($ok_b) | ($cancel_b)
		
	End if 
	
	If (Not:C34($cancel_b))
		
		$i:=0
		For ($i; 1; Size of array:C274($methods_at))
			
			If ($methods_at{$i}="_Launch@") | ($methods_at{$i}="_MethodCreator@")
				$methodProps_al{1}:=0  //make visible
			Else 
				$methodProps_al{1}:=1  //make invisible
			End if 
			
			$method_t:=$prefix_t+Replace string:C233($methods_at{$i}; ".txt"; "")
			
			If (Not:C34(method_doesExist($method_t)))
				
				method_CreateMethod($method_t; ->$methodProps_al; helper_DocumentToText($path_t+$methods_at{$i}); "Home")
				
			End if 
			
		End for 
		
		ALERT:C41("Wrapper methods have been created. Don't forget to update your TestCaseTemplate.txt file to reference wrapper methods")
		
	End if 
	
	//End if 
	
End if 

_callstack_pop