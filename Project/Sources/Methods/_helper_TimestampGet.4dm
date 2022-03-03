//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _helper_TimestampGet
// Method under test: helper_TimestampGet
// Method under test syntax: helper_TimestampGet({$date_d{; $time_time}}) -> text
// Date created: 06/18/2009, 18:14:53
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	C_TEXT:C284($expected_t; $result_t)  //variables to be passed to assertions
	
	//helper_TimestampGet Parameters: 
	C_DATE:C307($date_d)
	C_TIME:C306($time_time)
	
	//Other variables:
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Default test"; Current method name:C684))
	$expected_t:="00000000-000000"
	$date_d:=!00-00-00!
	$time_time:=?00:00:00?
	$result_t:=helper_TimestampGet($date_d; $time_time)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

If (Unit_BeginTest("Another test"; Current method name:C684))
	$expected_t:="20081212-221144"
	$date_d:=!2008-12-12!
	$time_time:=?22:11:44?
	$result_t:=helper_TimestampGet($date_d; $time_time)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
End if 
