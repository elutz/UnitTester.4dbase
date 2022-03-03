//%attributes = {"invisible":true,"shared":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/13/08, 22:26:26
// ----------------------------------------------------
// Method: Unit_NotEqualAssert
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_POINTER:C301($1; $expected_p; $2; $actual_p)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $other_t)

// ----------------------------------------------------

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

C_TEXT:C284($failure_t)

Case of 
	: (helper_IsArray($expected_p))
		
		//Actual pointer must also be to an array
		C_BOOLEAN:C305($same_boo)
		$same_boo:=True:C214
		
		If (helper_IsArray($actual_p))
			
			If (Size of array:C274($expected_p->)=Size of array:C274($actual_p->))
				
				C_LONGINT:C283($i; $type_l)
				$i:=0
				$type_l:=Type:C295($expected_p->)
				
				For ($i; 1; Size of array:C274($expected_p->))
					
					If ($type_l=Picture array:K8:22)
						
						If ($same_boo)  //only compare if we haven't already found them not equal
							
							C_PICTURE:C286($pic1; $pic2)
							$pic1:=$expected_p->{$i}
							$pic2:=$actual_p->{$i}
							$same_boo:=helper_PicturesCompare(->$pic1; ->$pic2)
							
						End if 
						
					Else 
						
						If ($same_boo) & ($expected_p->{$i}#$actual_p->{$i})
							$same_boo:=False:C215
						End if 
						
					End if 
					
				End for 
				
			Else 
				$same_boo:=False:C215
			End if 
			
			Unit_FalseAssert($same_boo; "Expected different values, were equal"+$other_t)
			
		Else 
			Unit_FalseAssert(False:C215; "Array sizes were the same. "+$other_t)
		End if 
		
	: (Type:C295($expected_p->)=Is alpha field:K8:1) | (Type:C295($expected_p->)=Is text:K8:3) | (Type:C295($expected_p->)=Is string var:K8:2)
		$failure_t:="Expected different from '"+$expected_p->+"', was equal. "+$other_t
		Unit_FalseAssert($expected_p->=$actual_p->; $failure_t+$other_t)
		
	: (Type:C295($expected_p->)=Is picture:K8:10)
		
		Unit_FalseAssert(helper_PicturesCompare($expected_p; $actual_p); "Pictures were equal, expected different"+$other_t)
		
	: (Type:C295($expected_p->)=Is BLOB:K8:12)
		
		Unit_FalseAssert(helper_BlobsCompare($expected_p; $actual_p); "BLOB's were equal, expected different"+$other_t)
		
	: (Type:C295($expected_p->)=Is object:K8:27)
		
		C_OBJECT:C1216($expectedObj; $actualObj)
		$expectedObj:=$expected_p->
		$actualObj:=$actual_p->
		Unit_FalseAssert(JSON Stringify:C1217($expectedObj)=JSON Stringify:C1217($actualObj); "Objects were equal, expected different"+$other_t)
		
	Else 
		$failure_t:="Expected different from "+String:C10($expected_p->)+", was equal"
		Unit_FalseAssert($expected_p->=$actual_p->; $failure_t+$other_t)
		
End case 