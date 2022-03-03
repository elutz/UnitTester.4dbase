//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: TestMethod
// Date created: 05/15/09, 16:31:50
// Created by: Mark Schaake
// Returns: 
C_TEXT:C284($0; $string_t)
// Required Parameters: 
C_POINTER:C301($1; $textArray_p)
// Optional Parameters: 
C_TEXT:C284($2; $delim_t)
//***********************************************************************

$textArray_p:=$1
If (Count parameters:C259>=2)
	$delim_t:=$2
Else 
	$delim_t:=""
End if 
$string_t:=""

If ($delim_t="")
	$delim_t:=";"  // default delimiter
End if 

If (Type:C295($textArray_p->)#Text array:K8:16)
	_E_Throw("Wrong pointer type"; "expected pointer to text array")
End if 

If (_E_Try)
	
	C_LONGINT:C283($i)
	For ($i; 1; Size of array:C274($textArray_p->))
		$string_t:=$string_t+$textArray_p->{$i}+Choose:C955($i<Size of array:C274($textArray_p->); $delim_t; "")
	End for 
	
End if 

$0:=$string_t