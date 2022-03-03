//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _helper_TimestampToISO
// Method under test: helper_TimestampToISO
// Method under test syntax: helper_TimestampToISO($timestamp_t) -> text
// Date created: 06/20/2009, 09:03:58
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	Unit_CustomLogTextSet(""; Current method name:C684)  //text will print out to the log file
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	C_TEXT:C284($expected_t; $result_t)  //variables to be passed to assertions
	
	//helper_TimestampToISO Parameters: 
	C_TEXT:C284($timestamp_t)
	
	//Other variables:
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Default failing test"; Current method name:C684))
	$expected_t:="2009-01-01 12:00:15"
	$timestamp_t:=helper_TimestampGet(!2009-01-01!; ?12:00:15?)
	$result_t:=helper_TimestampToISO($timestamp_t)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
End if 
