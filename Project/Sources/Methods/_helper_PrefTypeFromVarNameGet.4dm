//%attributes = {"invisible":true}
//***********************************************************************
//* UnitTester method: _helper_PrefTypeFromVarNameGet                   *
//* Method under test: conv_TypeFromVarNameGet                          *
//* Date created: 05/14/2009                                            *
//* Created by: Mark Schaake                                            *
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	
	C_TEXT:C284($varName_t)
	C_TEXT:C284($expected_t)
	
	//need to store current preferences so we can restore them below
	ARRAY TEXT:C222($names_at; 0)
	ARRAY LONGINT:C221($ids_al; 0)
	ARRAY TEXT:C222($prefixes_at; 0)
	ARRAY TEXT:C222($suffixes_at; 0)
	
	APPEND TO ARRAY:C911($names_at; "text")
	APPEND TO ARRAY:C911($ids_al; Is text:K8:3)
	APPEND TO ARRAY:C911($prefixes_at; "t_")
	APPEND TO ARRAY:C911($suffixes_at; "")
	
	APPEND TO ARRAY:C911($names_at; "boolean")
	APPEND TO ARRAY:C911($ids_al; Is boolean:K8:9)
	APPEND TO ARRAY:C911($prefixes_at; "")
	APPEND TO ARRAY:C911($suffixes_at; "_boo")
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("No suffix or prefix returns blank data type"; Current method name:C684))
	$expected_t:=""
	Unit_TextEqualAssert($expected_t; conv_TypeFromVarNameGet($varName_t; ->$names_at; ->$ids_al; ->$prefixes_at; ->$suffixes_at))
End if 

If (Unit_BeginTest("Prefix matches text"; Current method name:C684))
	$expected_t:=$names_at{Find in array:C230($ids_al; Is text:K8:3)}
	//conv_TypePrefixSet (Is Text ;"t_")
	$varName_t:="t_var"
	Unit_TextEqualAssert($expected_t; conv_TypeFromVarNameGet($varName_t; ->$names_at; ->$ids_al; ->$prefixes_at; ->$suffixes_at))
End if 

If (Unit_BeginTest("Suffix matches text"; Current method name:C684))
	$expected_t:=$names_at{Find in array:C230($ids_al; Is boolean:K8:9)}
	//conv_TypeSuffixSet (Is Boolean ;"_boo")
	$varName_t:="var_boo"
	Unit_TextEqualAssert($expected_t; conv_TypeFromVarNameGet($varName_t; ->$names_at; ->$ids_al; ->$prefixes_at; ->$suffixes_at))
End if 

If (Unit_BeginTest("Prefix matches text, local"; Current method name:C684))
	$expected_t:=$names_at{Find in array:C230($ids_al; Is text:K8:3)}
	//conv_TypePrefixSet (Is Text ;"t_")
	$varName_t:="$t_var"
	Unit_TextEqualAssert($expected_t; conv_TypeFromVarNameGet($varName_t; ->$names_at; ->$ids_al; ->$prefixes_at; ->$suffixes_at))
End if 

If (Unit_BeginTest("Suffix matches text, local"; Current method name:C684))
	$expected_t:=$names_at{Find in array:C230($ids_al; Is boolean:K8:9)}
	//conv_TypeSuffixSet (Is Boolean ;"_boo")
	$varName_t:="$var_boo"
	Unit_TextEqualAssert($expected_t; conv_TypeFromVarNameGet($varName_t; ->$names_at; ->$ids_al; ->$prefixes_at; ->$suffixes_at))
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
