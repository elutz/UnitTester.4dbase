//%attributes = {"invisible":true,"shared":true}
//***********************************************************************
// UnitTester method: _setup_copy_template
// Method under test: setup_copy_template
// Method under test syntax: 
// Date created: 06/27/2010, 21:06:40
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	Unit_CustomLogTextSet(""; Current method name:C684)  //text will print out to the log file
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	//setup_copy_template Parameters: --none--
	
	//copy the existing templates so we can replace when done
	C_BLOB:C604($headerTemplate_blob; $customHeaderTemplate_blob)
	C_BLOB:C604($testCaseTemplate_blob; $customTestCaseTemplate_blob)
	C_BLOB:C604($tempHeader_blob; $tempTest_blob)
	
	$headerTemplate_blob:=server_document_to_blob(paths_MethodHeaderTemplateGet(False:C215; True:C214))
	$testCaseTemplate_blob:=server_document_to_blob(paths_TestCaseTemplateGet(False:C215; True:C214))
	$customHeaderTemplate_blob:=server_document_to_blob(paths_MethodHeaderTemplateGet(True:C214))
	$customTestCaseTemplate_blob:=server_document_to_blob(paths_TestCaseTemplateGet(True:C214))
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Overwrite (replace) with default"; Current method name:C684))
	//Force overwrite
	TEXT TO BLOB:C554("header template"; $tempHeader_blob)
	TEXT TO BLOB:C554("test case template"; $tempTest_blob)
	server_blob_to_document($tempHeader_blob; paths_MethodHeaderTemplateGet(False:C215; True:C214))
	server_blob_to_document($tempTest_blob; paths_TestCaseTemplateGet(False:C215; True:C214))
	setup_copy_template(paths_MethodHeaderTemplateGet; True:C214)
	setup_copy_template(paths_TestCaseTemplateGet; True:C214)
	Unit_TextEqualAssert("header template"; server_document_to_text(paths_MethodHeaderTemplateGet(True:C214)))
	Unit_TextEqualAssert("test case template"; server_document_to_text(paths_TestCaseTemplateGet(True:C214)))
End if 

If (Unit_BeginTest("Don't overwrite if custom exists"; Current method name:C684))
	//Force overwrite
	TEXT TO BLOB:C554("header overwrite template"; $tempHeader_blob)
	TEXT TO BLOB:C554("test case overwrite template"; $tempTest_blob)
	server_blob_to_document($tempHeader_blob; paths_MethodHeaderTemplateGet(False:C215; True:C214))
	server_blob_to_document($tempTest_blob; paths_TestCaseTemplateGet(False:C215; True:C214))
	setup_copy_template(paths_MethodHeaderTemplateGet)
	setup_copy_template(paths_TestCaseTemplateGet)
	Unit_TextNotEqualAssert("header overwrite template"; server_document_to_text(paths_MethodHeaderTemplateGet(True:C214)))
	Unit_TextNotEqualAssert("test case overwrite template"; server_document_to_text(paths_TestCaseTemplateGet(True:C214)))
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	server_blob_to_document($headerTemplate_blob; paths_MethodHeaderTemplateGet(False:C215; True:C214))
	server_blob_to_document($testCaseTemplate_blob; paths_TestCaseTemplateGet(False:C215; True:C214))
	server_blob_to_document($customHeaderTemplate_blob; paths_MethodHeaderTemplateGet(True:C214))
	server_blob_to_document($customTestCaseTemplate_blob; paths_TestCaseTemplateGet(True:C214))
End if 
