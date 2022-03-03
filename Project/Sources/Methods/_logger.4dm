//%attributes = {"invisible":true,"shared":true}
//***********************************************************************
// UnitTester method: _logger
// Method under test: 
// Method under test syntax: 
// Date created: 06/26/2010, 08:01:56
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	Unit_CustomLogTextSet(""; Current method name:C684)  //text will print out to the log file
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	// Parameters: --none--
	
	//Other variables:
	C_BLOB:C604($oldLog_blob)
	$oldLog_blob:=server_document_to_blob(paths_DevLogFile)
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Main test"; Current method name:C684))
	//set up test here
	logger_init
	Unit_TextEqualAssert("UnitTester Log"; server_document_to_text(paths_DevLogFile))
	
	logger_info("hello")
	Unit_TextEqualAssert("UnitTester Log\r\n[INFO]: hello"; server_document_to_text(paths_DevLogFile))
	
	logger_error("goodbye")
	Unit_TextEqualAssert("UnitTester Log\r\n[INFO]: hello\r\n[ERROR]: goodbye"; server_document_to_text(paths_DevLogFile))
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	server_blob_to_document($oldLog_blob; paths_DevLogFile)
End if 
