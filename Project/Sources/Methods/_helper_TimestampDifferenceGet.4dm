//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _helper_TimestampDifferenceGet
// Method under test: helper_TimestampDifferenceGet
// Method under test syntax: helper_TimestampDifferenceGet($timestamp1_t; $timestamp2_t) -> time
// Date created: 06/20/2009, 08:41:48
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	Unit_CustomLogTextSet(""; Current method name:C684)  //text will print out to the log file
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	C_TIME:C306($expected_time; $result_time)  //variables to be passed to assertions
	
	//helper_TimestampDifferenceGet Parameters: 
	C_TEXT:C284($timestamp1_t)
	C_TEXT:C284($timestamp2_t)
	
	//Other variables:
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Timestamps are the same, returns blank time"; Current method name:C684))
	$expected_time:=?00:00:00?
	$timestamp1_t:=helper_TimestampGet(!2009-01-01!; ?12:00:00?)
	$timestamp2_t:=$timestamp1_t
	$result_time:=helper_TimestampDifferenceGet($timestamp1_t; $timestamp2_t)
	Unit_TimeEqualAssert($expected_time; $result_time)
End if 

If (Unit_BeginTest("First timestamp is before second, returns positive time"; Current method name:C684))
	$expected_time:=?01:00:00?
	$timestamp1_t:=helper_TimestampGet(!2009-01-01!; ?12:00:00?)
	$timestamp2_t:=helper_TimestampGet(!2009-01-01!; ?13:00:00?)
	$result_time:=helper_TimestampDifferenceGet($timestamp1_t; $timestamp2_t)
	Unit_TimeEqualAssert($expected_time; $result_time)
End if 

If (Unit_BeginTest("First timestamp is after second, returns positive time"; Current method name:C684))
	$expected_time:=?01:00:00?
	$timestamp1_t:=helper_TimestampGet(!2009-01-01!; ?13:00:00?)
	$timestamp2_t:=helper_TimestampGet(!2009-01-01!; ?12:00:00?)
	$result_time:=helper_TimestampDifferenceGet($timestamp1_t; $timestamp2_t)
	Unit_TimeEqualAssert($expected_time; $result_time)
End if 

If (Unit_BeginTest("Timestamps are different days"; Current method name:C684))
	$expected_time:=?23:00:00?
	$timestamp1_t:=helper_TimestampGet(!2009-01-01!; ?12:00:00?)
	$timestamp2_t:=helper_TimestampGet(!2009-01-02!; ?11:00:00?)
	$result_time:=helper_TimestampDifferenceGet($timestamp1_t; $timestamp2_t)
	Unit_TimeEqualAssert($expected_time; $result_time)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
End if 
