//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _helper_ArrayTextAppend
// Method under test: helper_ArrayTextAppend
// Date created: 05/16/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	//Expected var:  declare variables here
	
	//helper_ArrayTextAppend Return: --none--
	
	//helper_ArrayTextAppend Parameters: 
	
	ARRAY TEXT:C222($array_at; 0)
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Append to array"; Current method name:C684))
	//set up test here
	helper_ArrayTextAppend(->$array_at; "first"; "second"; "third")
	Unit_IntegerEqualAssert(3; Size of array:C274($array_at))
	Unit_TextEqualAssert("first"; $array_at{1})
	Unit_TextEqualAssert("second"; $array_at{2})
	Unit_TextEqualAssert("third"; $array_at{3})
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
