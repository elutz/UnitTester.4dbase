//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 07:22:24
//--------------------------------------------------------------------------------
// Method: helper_AssignParameters
// Creates assign block in method text based on the
// header of the method.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($1; $header_t)

//Required Parameters
C_TEXT:C284($0; $method_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
$header_t:=$1

C_TEXT:C284($assignBlock_t; $return_t; $regExpression_t; $varName_t; $paramName_t)
C_LONGINT:C283($start_l)
C_LONGINT:C283($optStart_l; $optLength_l)

ARRAY LONGINT:C221($posFound_al; 0)
ARRAY LONGINT:C221($lengthFound_al; 0)

$regExpression_t:="(\\$[0-9]{1,2});([\\$◊//<//>]*[a-zA-Z0-9_]+)[//);]"

$start_l:=1
$optStart_l:=Position:C15("Optional Parameters"; $header_t; 1; $optLength_l)

While (Match regex:C1019($regExpression_t; $header_t; $start_l; $posFound_al; $lengthFound_al))
	
	$paramName_t:=Substring:C12($header_t; $posFound_al{1}; $lengthFound_al{1})
	$varName_t:=Substring:C12($header_t; $posFound_al{2}; $lengthFound_al{2})
	
	If ($paramName_t="$0")
		$return_t:=$paramName_t+":="+$varName_t
	Else 
		
		If ($optStart_l>0) & ($optStart_l<$posFound_al{1})  //These are optional parameters
			
			$assignBlock_t:=$assignBlock_t+Char:C90(Carriage return:K15:38)+"If (Count parameters>="+String:C10(Num:C11($paramName_t))+")"+Char:C90(Carriage return:K15:38)
			$assignBlock_t:=$assignBlock_t+$varName_t+":="+$paramName_t
			$assignBlock_t:=$assignBlock_t+Char:C90(Carriage return:K15:38)+"End If"
			
		Else 
			$assignBlock_t:=$assignBlock_t+Char:C90(Carriage return:K15:38)+$varName_t+":="+$paramName_t
		End if 
		
	End if 
	
	$start_l:=$posFound_al{0}+$lengthFound_al{0}
	
End while 

$assignBlock_t:=$assignBlock_t+Char:C90(13)+Char:C90(13)+$return_t

$0:=$assignBlock_t