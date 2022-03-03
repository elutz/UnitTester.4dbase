//%attributes = {"invisible":true}

//***********************************************************************
// Method Name: method_SyntaxGet
// Created by: Mark Schaake
// Date created: 06/15/09, 17:02:02
//
// Description:
//  Generates a syntax for the method's use:
//  MyMethod(reqParam {; optPara}) -> returnval
// 
// Returns: 
C_TEXT:C284($0; $syntax_t)
// Required Parameters: 
C_TEXT:C284($1; $method_t)
C_TEXT:C284($2; $returnValue_t)
// Optional Parameters:
C_POINTER:C301($3; $reqParams_atp; $4; $optParams_atp)
// Other Variables:
C_BOOLEAN:C305($hasReqParams_boo; $hasOptParams_boo)
// 
//***********************************************************************

$method_t:=$1
$returnValue_t:=$2

If (Count parameters:C259>=3)
	$reqParams_atp:=$3
End if 

If (Count parameters:C259>=4)
	$optParams_atp:=$4
End if 

$syntax_t:=$method_t

If (Not:C34(Is nil pointer:C315($reqParams_atp)))
	If (Type:C295($reqParams_atp->)=Text array:K8:16)
		If (Size of array:C274($reqParams_atp->)>0)
			$hasReqParams_boo:=True:C214
		End if 
	End if 
End if 

If (Not:C34(Is nil pointer:C315($optParams_atp)))
	If (Type:C295($optParams_atp->)=Text array:K8:16)
		If (Size of array:C274($optParams_atp->)>0)
			$hasOptParams_boo:=True:C214
		End if 
	End if 
End if 

If ($hasReqParams_boo | $hasOptParams_boo)
	C_LONGINT:C283($i)
	C_BOOLEAN:C305($hasRequired_b)
	$syntax_t:=$syntax_t+"("
	
	If ($hasReqParams_boo)
		$i:=0
		$hasRequired_b:=(Size of array:C274($reqParams_atp->)>0)
		For ($i; 1; Size of array:C274($reqParams_atp->))
			$syntax_t:=$syntax_t+Choose:C955($i>1; "; "; "")+$reqParams_atp->{$i}
		End for 
	End if 
	
	If ($hasOptParams_boo)
		$i:=0
		For ($i; 1; Size of array:C274($optParams_atp->))
			$syntax_t:=$syntax_t+Choose:C955(Not:C34($hasRequired_b) & ($i=1); "{"; "{; ")+$optParams_atp->{$i}
		End for 
		$syntax_t:=$syntax_t+("}"*Size of array:C274($optParams_atp->))
	End if 
	
	$syntax_t:=$syntax_t+")"
	
End if 

If ($returnValue_t#"")
	$syntax_t:=$syntax_t+" -> "+$returnValue_t
End if 

$0:=$syntax_t
