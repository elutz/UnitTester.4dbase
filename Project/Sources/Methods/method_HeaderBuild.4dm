//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/13/09, 06:14:35
//--------------------------------------------------------------------------------
// Method: helper_MethodHeaderBuild
// Builds the method header for a method created with
// Unit__TestCaseMethodCreate
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
// -- NONE --

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)


// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 12/04/08, 16:42:38
// ----------------------------------------------------
// Method: BuildHeader
// Description
//
//
// ----------------------------------------------------
//
//Return Value
C_TEXT:C284($0; $header_t)

//Required Paramenters
C_TEXT:C284($1; $method_t)

//Optional Parameters
C_TEXT:C284($2; $description_t)
C_TEXT:C284($3; $returnVarName_t)
C_LONGINT:C283($4; $returnVarType_l)
C_POINTER:C301($5; $requiredParams_atp)
C_POINTER:C301($6; $requiredTypes_alp)
C_POINTER:C301($7; $optionalParams_atp)
C_POINTER:C301($8; $optionalTypes_alp)

// ----------------------------------------------------

$method_t:=$1

If (Count parameters:C259>=2)
	$description_t:=$2
End if 

If (Count parameters:C259>=4)
	$returnVarName_t:=$3
	$returnVarType_l:=$4
End if 

If (Count parameters:C259>=6)
	$requiredParams_atp:=$5
	$requiredTypes_alp:=$6
End if 

If (Count parameters:C259>=8)
	$optionalParams_atp:=$7
	$optionalTypes_alp:=$8
End if 

C_TEXT:C284($return_t; $required_t; $optional_t; $syntax_t; $retVal_t)
C_LONGINT:C283($paramCount_l; $i)
$paramCount_l:=Size of array:C274($requiredParams_atp->)
$retVal_t:=Choose:C955($returnVarName_t=""; ""; Lowercase:C14(Replace string:C233(helper_Type4dCompilerCommand($returnVarType_l); "C_"; "")))
$syntax_t:=method_SyntaxGet($method_t; $retVal_t; $requiredParams_atp; $optionalParams_atp)

If ($returnVarName_t#"")
	$return_t:=Char:C90(Carriage return:K15:38)+helper_Type4dCompilerCommand($returnVarType_l)+"($0;"+$returnVarName_t+")"
Else 
	$return_t:="--nothing--"
End if 

If (Not:C34(Is nil pointer:C315($requiredParams_atp)))
	If ($paramCount_l>0)
		$i:=0
		For ($i; 1; Size of array:C274($requiredParams_atp->))
			$required_t:=$required_t+Char:C90(Carriage return:K15:38)+helper_Type4dCompilerCommand($requiredTypes_alp->{$i})+"($"+String:C10($i)+";"+$requiredParams_atp->{$i}+")"
		End for 
	Else 
		$required_t:="--none--"
	End if 
Else 
	$required_t:="--none--"
End if 

If (Not:C34(Is nil pointer:C315($optionalParams_atp)))
	If (Size of array:C274($optionalParams_atp->)>0)
		$i:=0
		For ($i; 1; Size of array:C274($optionalParams_atp->))
			$optional_t:=$optional_t+Char:C90(Carriage return:K15:38)+helper_Type4dCompilerCommand($optionalTypes_alp->{$i})+"($"+String:C10($paramCount_l+$i)+";"+$optionalParams_atp->{$i}+")"
		End for 
	Else 
		$optional_t:="--none--"
	End if 
Else 
	$optional_t:="--none''"
End if 

C_BLOB:C604($blob)
$blob:=server_document_to_blob(paths_MethodHeaderTemplateGet)
$header_t:=BLOB to text:C555($blob; UTF8 text without length:K22:17)
$header_t:=Replace string:C233($header_t; "[m_name]"; $method_t)
$header_t:=Replace string:C233($header_t; "[m_syntax]"; $syntax_t)
$header_t:=Replace string:C233($header_t; "[d_created]"; String:C10(Current date:C33; Internal date short special:K1:4)+", "+String:C10(Current time:C178; HH MM SS:K7:1))
$header_t:=Replace string:C233($header_t; "[user]"; Current system user:C484)
$header_t:=Replace string:C233($header_t; "[return]"; $return_t)
$header_t:=Replace string:C233($header_t; "[required]"; $required_t)
$header_t:=Replace string:C233($header_t; "[optional]"; $optional_t)
$header_t:=Replace string:C233($header_t; "[description]"; Replace string:C233("`  "+$description_t; Char:C90(Carriage return:K15:38); Char:C90(Carriage return:K15:38)+"`  "))
$header_t:=Replace string:C233($header_t; "[assignment]"; helper_AssignParameters($header_t))

$0:=$header_t

_callstack_pop  //keep this at the end of the method
