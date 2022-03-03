//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/01/08, 08:54:15
// ----------------------------------------------------
// Method: suite_CreateTestCase
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS
C_TEXT:C284($1; $methodName_t)
C_LONGINT:C283($2; $suiteRef_l)
C_BOOLEAN:C305($3; $openMethod_boo)
C_LONGINT:C283($4; $hList_l)
C_LONGINT:C283($5; $returnType_l)
C_TEXT:C284($6; $resultVarName_t)
C_POINTER:C301($7; $paramNames_atp; $8; $paramTypes_alp)
C_TEXT:C284($9; $syntax_t)
// ----------------------------------------------------

If (Count parameters:C259>=4)
	$hList_l:=$4
Else 
	$hList_l:=hl_TestSuites
End if 

If (Count parameters:C259>=1)
	$methodName_t:=$1
Else 
	$methodName_t:=helper_ListItemTextByPosGet($hList_l; -1)
End if 

If (Count parameters:C259>=2)
	$suiteRef_l:=$2
Else 
	$suiteRef_l:=List item parent:C633($hList_l; *)
End if 

If (Count parameters:C259>=3)
	$openMethod_boo:=$3
Else 
	$openMethod_boo:=True:C214
End if 

If (Count parameters:C259>=6)
	$returnType_l:=$5
	$resultVarName_t:=$6
End if 

If (Count parameters:C259>=8)
	$paramNames_atp:=$7
	$paramTypes_alp:=$8
End if 

If (Count parameters:C259>=9)
	$syntax_t:=$9
Else 
	$syntax_t:=""
End if 

C_TEXT:C284($code_t; $methodTested_t)
C_TEXT:C284($prefix_t)
$prefix_t:=conv_TestCaseMethodPrefixGet
$methodTested_t:=Replace string:C233($methodName_t; $prefix_t; ""; 1)

If (Not:C34(method_doesExist($methodName_t)))
	
	C_LONGINT:C283($suiteRef_l; $i)
	C_TEXT:C284($folder_t; $result_t; $params_t; $expectedVarName_t; $expectedReturn_t; $testBody_t; $methodCall_t; $paramString_t; $paramAssignBlock_t)
	
	//Get the test case method template
	//Will contain the following placeholders:
	//[m_name] - test case method
	//[m_syntax] - method syntax
	//[m_tested] - method under test
	//[d_created] - created date / time
	//[user] - user
	//[return] - return variable name for method under test
	//[params] - parameters the method under test takes
	//[test_body] - auto-gernerated test body
	//[expected_return] - variable name to hold the expected values for tests on return values
	
	C_BLOB:C604($blob)
	$blob:=server_document_to_blob(paths_TestCaseTemplateGet)
	$code_t:=BLOB to text:C555($blob; UTF8 text without length:K22:17)
	
	If (Not:C34(method_doesExist($methodTested_t)))
		$methodTested_t:=""
	End if 
	
	If (Not:C34(Is nil pointer:C315($paramNames_atp)))
		If (Size of array:C274($paramNames_atp->)>0)
			$paramString_t:="("+helper_ArrayToText($paramNames_atp; ";")+")"
			For ($i; 1; Size of array:C274($paramNames_atp->))
				$params_t:=$params_t+Char:C90(Carriage return:K15:38)+helper_Type4dCompilerCommand($paramTypes_alp->{$i})+"("+$paramNames_atp->{$i}+")"
				If (helper_DefaultValueString($paramTypes_alp->{$i})#"")
					$paramAssignBlock_t:=$paramAssignBlock_t+$paramNames_atp->{$i}+":="+helper_DefaultValueString($paramTypes_alp->{$i})+Char:C90(Carriage return:K15:38)
				End if 
			End for 
		Else 
			$params_t:="--none--"
		End if 
	Else 
		$params_t:="--none--"
	End if 
	
	If ($resultVarName_t#"")
		C_TEXT:C284($pref; $suf)
		$pref:=conv_TypePrefixGet($returnType_l)
		$suf:=conv_TypeSuffixGet($returnType_l)
		$resultVarName_t:="$"+$pref+"result"+$suf
		
		If (Not:C34(helper_Type4dIsBoolean($returnType_l)))
			$expectedVarName_t:="$"+$pref+"expected"+$suf
			$expectedReturn_t:=helper_Type4dCompilerCommand($returnType_l)+"("+$expectedVarName_t+";"+$resultVarName_t+")`variables to be passed to assertions\r\r"
			If (helper_DefaultValueString($returnType_l)#"")
				$testBody_t:=$expectedVarName_t+":="+helper_DefaultValueString($returnType_l)+Char:C90(Carriage return:K15:38)
			End if 
		Else 
			$expectedVarName_t:=""
			$expectedReturn_t:=helper_Type4dCompilerCommand($returnType_l)+"("+$resultVarName_t+")`variables to be passed to assertions\r\r"
		End if 
		
		$testBody_t:=$testBody_t+$paramAssignBlock_t
		
		If ($methodTested_t#"")
			$testBody_t:=$testBody_t+$resultVarName_t+":="+$methodTested_t+$paramString_t
			$testBody_t:=$testBody_t+Char:C90(Carriage return:K15:38)+helper_EqualAssertMethodForType($returnType_l)+"("
			If ($returnType_l#Is boolean:K8:9)
				$testBody_t:=$testBody_t+$expectedVarName_t+";"
			End if 
			$testBody_t:=$testBody_t+$resultVarName_t+")"
		End if 
		$testBody_t:=$testBody_t+Char:C90(Carriage return:K15:38)
	Else 
		$result_t:="--none--"
		$expectedVarName_t:=""
		$expectedReturn_t:=""
		$testBody_t:="`set up test here\r"+$methodTested_t+$paramString_t+Char:C90(Carriage return:K15:38)
	End if 
	
	$code_t:=Replace string:C233($code_t; "[m_name]"; $methodName_t)
	$code_t:=Replace string:C233($code_t; "[m_syntax]"; $syntax_t)
	$code_t:=Replace string:C233($code_t; "[m_tested]"; $methodTested_t)
	$code_t:=Replace string:C233($code_t; "[d_created]"; String:C10(Current date:C33; Internal date short:K1:7)+", "+String:C10(Current time:C178; HH MM SS:K7:1))
	$code_t:=Replace string:C233($code_t; "[user]"; Current system user:C484)
	$code_t:=Replace string:C233($code_t; "[params]"; $params_t)
	$code_t:=Replace string:C233($code_t; "[test_body]"; $testBody_t)
	$code_t:=Replace string:C233($code_t; "[expected_return]"; $expectedReturn_t)
	
	$folder_t:=helper_ListItemTextByPosGet($hList_l; List item position:C629($hList_l; $suiteRef_l))
	
	If ($methodName_t#"") & ($methodName_t#$prefix_t)
		ARRAY LONGINT:C221($methodProps_al; 7)
		$methodProps_al{1}:=1  //invisible
		$methodProps_al{2}:=0
		$methodProps_al{3}:=0
		$methodProps_al{4}:=0
		$methodProps_al{5}:=1  //shared
		$methodProps_al{6}:=0
		$methodProps_al{7}:=0
		
		method_CreateMethod($methodName_t; ->$methodProps_al; $code_t; $folder_t)
		
		If ($openMethod_boo)
			method_Edit($methodName_t)
		End if 
		
	End if 
	
	suite_SetListItemIcon($hList_l; -1)
	
End if 