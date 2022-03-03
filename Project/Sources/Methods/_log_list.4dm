//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _log_list
// Method under test: log_list
// Method under test syntax: log_list($logPath_t; $list_l; $level_l) -> integer
// Date created: 06/18/2009, 16:55:35
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	//log_list Parameters: 
	C_TEXT:C284($logPath_t; $expected_t)
	C_LONGINT:C283($list_l; $sublist_l; $sublist2_l)
	C_LONGINT:C283($level_l)
	$logPath_t:=Get 4D folder:C485(Database folder:K5:14)+"test_log.txt"
	
	//Other variables:
	C_TIME:C306($docRef_tm)
	
	$docRef_tm:=Create document:C266($logPath_t)
	CLOSE DOCUMENT:C267($docRef_tm)
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Single item"; Current method name:C684))
	helper_TextToDocument(""; $logPath_t)  //clear the document
	$expected_t:="\ritem1"
	$list_l:=New list:C375
	helper_ListAppend($list_l; "item1")
	log_list($logPath_t; $list_l)
	Unit_TextEqualAssert($expected_t; helper_DocumentToText($logPath_t))
	CLEAR LIST:C377($list_l)
End if 

If (Unit_BeginTest("Two items, with children"; Current method name:C684))
	helper_TextToDocument(""; $logPath_t)  //clear the document
	$expected_t:="\ritem1\r  child1\r  child2\ritem2\r  child3\r  child4"
	$list_l:=New list:C375
	$sublist_l:=New list:C375
	$sublist2_l:=New list:C375
	helper_ListAppend($sublist_l; "child1")
	helper_ListAppend($sublist_l; "child2")
	helper_ListAppend($list_l; "item1"; 0; $sublist_l)
	
	helper_ListAppend($sublist2_l; "child3")
	helper_ListAppend($sublist2_l; "child4")
	helper_ListAppend($list_l; "item2"; 0; $sublist2_l)
	
	log_list($logPath_t; $list_l)
	Unit_TextEqualAssert($expected_t; helper_DocumentToText($logPath_t))
	CLEAR LIST:C377($list_l)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	DELETE DOCUMENT:C159($logPath_t)
End if 
