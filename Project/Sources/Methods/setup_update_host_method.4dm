//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_update_host_method
// Syntax: setup_update_host_method($method_t)
// Created by: Mark Schaake
// Date created: 07/24/09, 19:23:11
//
// Description:
//  Updates the host method the most current code.
// 
// Returns:
C_BOOLEAN:C305($0; $ok_b)
// Required Parameters: 
C_TEXT:C284($1; $method_t)
// Optional Parameters: --none--
// Other Variables:
C_TEXT:C284($path_t)
ARRAY TEXT:C222($methods_at; 0)
C_LONGINT:C283($pos; $err_l)
C_BLOB:C604($blob)
// 
//***********************************************************************

$method_t:=$1
$ok_b:=False:C215

If (ComponentMode) & (Not:C34(Is compiled mode:C492(*)))
	
	//If (setup_ensure_4d_pack )
	
	$path_t:=paths_HostMethods
	DOCUMENT LIST:C474($path_t; $methods_at)
	$pos:=Find in array:C230($methods_at; $method_t+".txt")
	
	If (method_doesExist($method_t))
		
		If ($pos>0)
			
			C_TEXT:C284($code)
			$code:=helper_DocumentToText($path_t+$methods_at{$pos})
			METHOD SET CODE:C1194($method_t; $code; *)
			$ok_b:=True:C214
			
			//TEXT TO BLOB(helper_DocumentToText ($path_t+$methods_at{$pos});$blob;Mac C string)
			//$err_l:=@XXAP Modify method($method_t;$blob)
			//$ok_b:=($err_l=0)
		End if 
		
	Else 
		//Don't worry about it, Macro_CreateMethodsOnHost will take care of everything.
	End if 
	
	//End if 
	
End if 

$0:=$ok_b

_callstack_pop