//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _helper_ArrayTextDeleteBlanks
// Method under test: helper_ArrayTextDeleteBlanks
// Date created: 05/16/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	ARRAY TEXT:C222($expected_at; 0)
	ARRAY TEXT:C222($actual_at; 0)
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("blanks deleted"; Current method name:C684))
	helper_ArrayClear(->$expected_at; ->$actual_at)
	helper_ArrayTextAppend(->$expected_at; "sole")
	helper_ArrayTextAppend(->$actual_at; ""; ""; "sole"; ""; ""; "")
	helper_ArrayTextDeleteBlanks(->$actual_at)
	Unit_ArrayEqualAssert(->$expected_at; ->$actual_at)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
