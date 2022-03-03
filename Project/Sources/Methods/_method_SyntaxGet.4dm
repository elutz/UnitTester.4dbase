//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _method_SyntaxGet
// Method under test: method_SyntaxGet
// Date created: 06/15/2009, 17:02:02
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	C_TEXT:C284($expected_t; $result_t)  //variables to be passed to assertions
	
	//method_SyntaxGet Parameters: 
	C_TEXT:C284($method_t)
	C_TEXT:C284($returnValue_t)
	C_POINTER:C301($reqiredParams_p)
	C_POINTER:C301($optionalParams_p)
	
	//Other variables:
	ARRAY TEXT:C222($reqParams_at; 0)
	ARRAY TEXT:C222($optParams_at; 0)
	
	$reqiredParams_p:=->$reqParams_at
	$optionalParams_p:=->$optParams_at
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("No parameters, returns value"; Current method name:C684))
	helper_ArrayClear($reqiredParams_p; $optionalParams_p)
	$expected_t:="my_method -> ret"
	$method_t:="my_method"
	$returnValue_t:="ret"
	$result_t:=method_SyntaxGet($method_t; $returnValue_t; $reqiredParams_p; $optionalParams_p)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

If (Unit_BeginTest("Optional, required, and return"; Current method name:C684))
	helper_ArrayClear($reqiredParams_p; $optionalParams_p)
	helper_ArrayTextAppend($reqiredParams_p; "req1"; "req2")
	helper_ArrayTextAppend($optionalParams_p; "opt1"; "opt2")
	$expected_t:="my_method(req1; req2{; opt1{; opt2}}) -> ret"
	$method_t:="my_method"
	$returnValue_t:="ret"
	$result_t:=method_SyntaxGet($method_t; $returnValue_t; $reqiredParams_p; $optionalParams_p)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

If (Unit_BeginTest("Required and return"; Current method name:C684))
	helper_ArrayClear($reqiredParams_p; $optionalParams_p)
	helper_ArrayTextAppend($reqiredParams_p; "req1"; "req2")
	$expected_t:="my_method(req1; req2) -> ret"
	$method_t:="my_method"
	$returnValue_t:="ret"
	$result_t:=method_SyntaxGet($method_t; $returnValue_t; $reqiredParams_p)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
End if 
