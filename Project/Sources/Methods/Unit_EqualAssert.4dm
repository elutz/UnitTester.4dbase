//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 12:40:53
// ----------------------------------------------------
// Method: Unit_EqualAssert
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_POINTER:C301($1; $expected_p; $2; $actual_p)
C_TEXT:C284($3; $other_t)
C_TEXT:C284($failure_t)

$expected_p:=$1
$actual_p:=$2

If (Count parameters:C259>=3)
	$other_t:=$3
Else 
	$other_t:=""
End if 

If ($other_t#"")
	$other_t:=".  "+$other_t
End if 

Case of 
	: (helper_IsArray($expected_p))
		
		//Actual pointer must also be to an array
		
		If (helper_IsArray($actual_p))
			
			If (Size of array:C274($expected_p->)=Size of array:C274($actual_p->))
				
				C_LONGINT:C283($i; $type_l)
				$i:=0
				$type_l:=Type:C295($expected_p->)
				
				For ($i; 1; Size of array:C274($expected_p->))
					
					
					Case of 
						: ($type_l=String array:K8:15) | ($type_l=Text array:K8:16)
							$failure_t:="["+String:C10($i)+"] Expected "+Char:C90(Double quote:K15:41)+$expected_p->{$i}+Char:C90(Double quote:K15:41)+", was "+Char:C90(Double quote:K15:41)+$actual_p->{$i}+Char:C90(Double quote:K15:41)+$other_t
							Unit_TrueAssert($expected_p->{$i}=$actual_p->{$i}; $failure_t)
							
						: ($type_l=Picture array:K8:22)
							C_PICTURE:C286($pic1; $pic2)
							$pic1:=$expected_p->{$i}
							$pic2:=$actual_p->{$i}
							$failure_t:="["+String:C10($i)+"] Pictures not equal"+$other_t
							Unit_TrueAssert(helper_PicturesCompare(->$pic1; ->$pic2); $failure_t)
							
						Else 
							$failure_t:="["+String:C10($i)+"] Expected "+String:C10($expected_p->{$i})+", was "+String:C10($actual_p->{$i})+$other_t
							Unit_TrueAssert($expected_p->{$i}=$actual_p->{$i}; $failure_t)
							
					End case 
					
				End for 
				
			Else 
				
				Unit_TrueAssert(False:C215; "Size of arrays are not equal: expected "+String:C10(Size of array:C274($expected_p->))+", was "+String:C10(Size of array:C274($actual_p->))+$other_t)
				
			End if 
			
		Else 
			
			Unit_TrueAssert(False:C215; "Cannot compare an array to a non-array type")
			
		End if 
		
	: (Type:C295($expected_p->)=Is alpha field:K8:1) | (Type:C295($expected_p->)=Is text:K8:3) | (Type:C295($expected_p->)=Is string var:K8:2)
		$failure_t:="Expected "+Char:C90(Double quote:K15:41)+$expected_p->+Char:C90(Double quote:K15:41)+", was "+Char:C90(Double quote:K15:41)+$actual_p->+Char:C90(Double quote:K15:41)+$other_t
		Unit_TrueAssert($expected_p->=$actual_p->; $failure_t)
		
	: (Type:C295($expected_p->)=Is picture:K8:10)
		
		Unit_TrueAssert(helper_PicturesCompare($expected_p; $actual_p); "Pictures were not equal"+$other_t)
		
	: (Type:C295($expected_p->)=Is BLOB:K8:12)
		
		Unit_TrueAssert(helper_BlobsCompare($expected_p; $actual_p); "BLOB's were not equal"+$other_t)
		
	: (Type:C295($expected_p->)=Is pointer:K8:14)
		
		Unit_TrueAssert($expected_p->=$actual_p->; $other_t)
		
	: (Type:C295($expected_p->)=Is object:K8:27)
		
		C_OBJECT:C1216($expectedObj; $actualObj)
		$expectedObj:=$expected_p->
		$actualObj:=$actual_p->
		Unit_TrueAssert(JSON Stringify:C1217($expectedObj)=JSON Stringify:C1217($actualObj); "Objects were not equal"+$other_t)
		
	Else 
		$failure_t:="Expected "+String:C10($expected_p->)+", was "+String:C10($actual_p->)
		Unit_TrueAssert($expected_p->=$actual_p->; $failure_t+$other_t)
		
End case 
