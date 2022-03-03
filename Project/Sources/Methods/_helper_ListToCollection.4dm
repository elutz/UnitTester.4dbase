//%attributes = {"invisible":true,"shared":true}
//***********************************************************************
// UnitTester method: _helper_ListToCollection
// Method under test: helper_ListToCollection
// Method under test syntax: 
// Date created: 28.09.2021, 11:53:46
// Created by: Lutz.Epperlein
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	Unit_CustomLogTextSet(""; Current method name:C684)  //text will print out to the log file
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	//helper_ListToCollection Parameters: --none--
	
	//Other variables:
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Default failing test"; Current method name:C684))
	//set up test here
	helper_ListToCollection
	Unit_Fail("Not yet implemented")  //forces failure of the test
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
End if 
