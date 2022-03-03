//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _helper_ArrayToText
// Method under test: helper_ArrayToText
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
	
	//helper_ArrayToText Return: 
	C_TEXT:C284($text_t)
	
	//helper_ArrayToText Parameters: 
	C_POINTER:C301($arText_p)
	C_TEXT:C284($delim_t)
	C_LONGINT:C283($i)
	ARRAY TEXT:C222($array_at; 0)
	For ($i; 1; 4)
		APPEND TO ARRAY:C911($array_at; "elem"+String:C10($i))
	End for 
	$arText_p:=->$array_at
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Tests are fun"; Current method name:C684))
	$expected_t:="elem1;elem2;elem3;elem4"
	$delim_t:=";"
	$text_t:=helper_ArrayToText($arText_p; $delim_t)
	Unit_TextEqualAssert($expected_t; $text_t)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
