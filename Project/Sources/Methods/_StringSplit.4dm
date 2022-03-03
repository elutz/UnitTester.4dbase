//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _StringSplit
// Method under test: StringSplit
// Date created: 05/15/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	//Expected var:  declare variables here
	
	//StringSplit Return: --none--
	
	//StringSplit Parameters: 
	C_TEXT:C284($input_t; $string_t)
	ARRAY TEXT:C222($expected_string_at; 4)
	ARRAY TEXT:C222($actual_string_at; 0)
	C_TEXT:C284($delimiter_t)
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("No delimiter passed, white space is default delimiter"; Current method name:C684))
	$string_t:="every good boy deserves"
	$expected_string_at{1}:="every"
	$expected_string_at{2}:="good"
	$expected_string_at{3}:="boy"
	$expected_string_at{4}:="deserves"
	StringSplit($string_t; ->$actual_string_at)
	Unit_EqualAssert(->$expected_string_at; ->$actual_string_at)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
