//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: Macro_CreateMethodsOnHost
// Syntax: Macro_CreateMethodsOnHost -> integer
// Created by: Mark Schaake
// Date created: 06/18/09, 10:07:37
//
// Description:
//  Generates methods in host database necessary for 
//  UnitTester to perform.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

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
	$methodProps_al{5}:=1  //shared
	$methodProps_al{6}:=0
	$methodProps_al{7}:=0
	
	$path_t:=paths_HostMethods
	DOCUMENT LIST:C474($path_t; $methods_at)
	
	$i:=0
	For ($i; 1; Size of array:C274($methods_at))
		
		$method_t:=Replace string:C233($methods_at{$i}; ".txt"; "")
		
		If (Not:C34(method_doesExist($method_t)))
			
			method_CreateMethod($method_t; ->$methodProps_al; helper_DocumentToText($path_t+$methods_at{$i}); "Home")
			
		End if 
		
	End for 
	
	//End if 
	
End if 