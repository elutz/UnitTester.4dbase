//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _method_HomeFolderArraySave
// Method under test: method_HomeFolderArraySave
// Date created: 05/16/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	//Expected var:  declare variables here
	ARRAY TEXT:C222($expected_folders_at; 0)
	ARRAY TEXT:C222($actual_folders_at; 0)
	//method_HomeFolderArraySave Return: --none--
	
	
	ARRAY TEXT:C222($orig_at; 0)
	C_TEXT:C284($tempPath_t)
	
	$tempPath_t:=Get 4D folder:C485+String:C10(Tickcount:C458)
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Load and save"; Current method name:C684))
	helper_ArrayClear(->$expected_folders_at)
	helper_ArrayTextAppend(->$expected_folders_at; "First"; "Second"; "Third")
	method_HomeFolderArraySave(->$expected_folders_at; $tempPath_t)
	method_HomeFolderArrayLoad(->$actual_folders_at; $tempPath_t)
	Unit_ArrayEqualAssert(->$expected_folders_at; ->$actual_folders_at)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	DELETE DOCUMENT:C159($tempPath_t)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
