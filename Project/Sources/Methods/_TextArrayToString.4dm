//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _TestMethod
// Method under test: TextArrayToString
// Date created: 05/15/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	//Expected var: 
	C_TEXT:C284($expected_t)
	
	//TestMethod Return: 
	C_TEXT:C284($string_t)
	
	//TestMethod Parameters: 
	C_POINTER:C301($textArray_p)
	C_TEXT:C284($delim_t)
	
	ARRAY TEXT:C222($text_at; 0)
	ARRAY LONGINT:C221($long_al; 0)
	C_POINTER:C301($invalidPointer_p)
	
	$textArray_p:=->$text_at
	$invalidPointer_p:=->$long_al
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("String created with default delimiter"; Current method name:C684))
	$expected_t:="elem1;elem2;elem3;elem4"
	helper_ArrayClear($textArray_p)
	helper_ArrayTextAppend($textArray_p; "elem1"; "elem2"; "elem3"; "elem4")
	$string_t:=TextArrayToString($textArray_p)
	Unit_TextEqualAssert($expected_t; $string_t)
	Unit_FalseAssert(_E_Catch)
End if 

If (Unit_BeginTest("String created with passed delimiter"; Current method name:C684))
	$expected_t:="elem1,elem2,elem3,elem4"
	helper_ArrayClear($textArray_p)
	helper_ArrayTextAppend($textArray_p; "elem1"; "elem2"; "elem3"; "elem4")
	$delim_t:=","
	$string_t:=TextArrayToString($textArray_p; $delim_t)
	Unit_TextEqualAssert($expected_t; $string_t)
	Unit_FalseAssert(_E_Catch)
End if 

If (Unit_BeginTest("String created with passed delimiter that is an empty string"; Current method name:C684))
	$expected_t:="elem1;elem2;elem3;elem4"
	helper_ArrayClear($textArray_p)
	helper_ArrayTextAppend($textArray_p; "elem1"; "elem2"; "elem3"; "elem4")
	$delim_t:=""
	$string_t:=TextArrayToString($textArray_p; $delim_t)
	Unit_TextEqualAssert($expected_t; $string_t; "empty delimiter")
	Unit_FalseAssert(_E_Catch)
End if 

If (Unit_BeginTest("Wrong pointer type throws exception"; Current method name:C684))
	$expected_t:=""
	helper_ArrayClear($textArray_p)
	helper_ArrayTextAppend($textArray_p; "elem1"; "elem2"; "elem3"; "elem4")
	$delim_t:=""
	$string_t:=TextArrayToString($invalidPointer_p; $delim_t)
	Unit_TextEqualAssert($expected_t; $string_t)
	Unit_TrueAssert(_E_Catch)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
