
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/25/08, 12:30:38
// ----------------------------------------------------
// Method: Object Method: CreateMethod.btnOk
// ----------------------------------------------------

If (_E_Try)
	
	If (method_name_t="")
		_E_Throw("Invalid input exception"; "You must enter a method name")
	End if 
	
	If (_E_Try)
		If (cbHomeFolder{0}="")
			_E_Throw("Invalid input exception"; "You must enter a home folder")
		End if 
	End if 
	
	If (_E_Try)
		If (ckbx_create_test=1) & (cbTestSuite{0}="")
			_E_Throw("Invalid input exception"; "You must enter a suite folder")
		End if 
	End if 
	
	If (_E_Catch("Invalid input exception"))
		ALERT:C41(_E_Message)
	Else 
		C_TEXT:C284($code_t)
		
		ARRAY TEXT:C222($reqParams_at; 0)
		ARRAY LONGINT:C221($reqParamTypes_al; 0)
		ARRAY TEXT:C222($optParams_at; 0)
		ARRAY LONGINT:C221($optParamTypes_al; 0)
		ARRAY LONGINT:C221($methodProperties_al; 7)
		
		C_LONGINT:C283($i; $returnType_l)
		$i:=0
		For ($i; 1; Size of array:C274(params_varnames))
			
			If (params_varnames{$i}#"")
				method_ParamNameForceLocal(->params_varnames{$i})
				
				If (params_isoptional{$i})
					APPEND TO ARRAY:C911($optParams_at; params_varnames{$i})
					APPEND TO ARRAY:C911($optParamTypes_al; helper_Type4dCompilerType(params_types{$i}))
				Else 
					APPEND TO ARRAY:C911($reqParams_at; params_varnames{$i})
					APPEND TO ARRAY:C911($reqParamTypes_al; helper_Type4dCompilerType(params_types{$i}))
				End if 
				
			End if 
			
		End for 
		
		method_ParamNameForceLocal(->returnvar_t)
		
		$returnType_l:=helper_Type4dCompilerType(cbReturnType{0})
		
		$code_t:=method_HeaderBuild(method_name_t; description_t; returnvar_t; $returnType_l; ->$reqParams_at; ->$reqParamTypes_al; ->$optParams_at; ->$optParamTypes_al)
		
		//Method properties
		$methodProperties_al{1}:=ckbx_prop_invisible
		$methodProperties_al{2}:=ckbx_prop_4daction
		$methodProperties_al{3}:=ckbx_prop_soap
		$methodProperties_al{4}:=ckbx_prop_wsdl
		$methodProperties_al{5}:=ckbx_prop_shared
		$methodProperties_al{6}:=ckbx_prop_sql
		$methodProperties_al{7}:=ckbx_prop_server
		
		method_CreateMethod(method_name_t; ->$methodProperties_al; $code_t; cbHomeFolder{0})
		
		If (ckbx_create_test=1)
			//Need to build body of the test case method using the known parameters of the production method
			C_TEXT:C284($testMethod_t; $syntax_t; $prefix_t)
			$prefix_t:=conv_TestCaseMethodPrefixGet
			$testMethod_t:=Substring:C12($prefix_t+method_name_t; 1; 31)
			$syntax_t:=method_SyntaxGet(method_name_t; Lowercase:C14(Replace string:C233(helper_Type4dCompilerCommand($returnType_l); "C_"; "")); ->$reqParams_at; ->$optParams_at)
			helper_ArrayAppendArray(->$optParams_at; ->$reqParams_at)
			helper_ArrayAppendArray(->$optParamTypes_al; ->$reqParamTypes_al)
			
			helper_TestMethodCreate(cbTestSuite{0}; $testMethod_t; $returnType_l; returnvar_t; ->$reqParams_at; ->$reqParamTypes_al; $syntax_t)
			helper_TestFileToListLoad
		End if 
		
		method_Edit(method_name_t)
		
		//open the test method second so that it's editor is in front of the production method
		If (ckbx_create_test=1)
			method_Edit($testMethod_t)
		End if 
		
		If (Find in array:C230(cbHomeFolder; cbHomeFolder{0})=-1)
			APPEND TO ARRAY:C911(cbHomeFolder; cbHomeFolder{0})
			method_HomeFolderArraySave(->cbHomeFolder)
		End if 
		
		ACCEPT:C269
		
	End if 
	
End if 