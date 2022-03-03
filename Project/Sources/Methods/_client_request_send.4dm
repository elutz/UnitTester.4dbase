//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _client_request_send
// Method under test: client_request_send
// Date created: 05/17/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (False:C215)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	//client_request_send Parameters: 
	C_LONGINT:C283($ref_l; $parentRef_l)
	C_TEXT:C284($requestType_t)
	C_TEXT:C284($addName_t)
	
	//Other variables:
	C_LONGINT:C283($list_l)
	C_BOOLEAN:C305($server_started_boo)
	$server_started_boo:=server_is_running
	Unit__ServerStartup
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (False:C215)  //(Unit_BeginTest("Add request assigns new ref"; Current method name))
	$ref_l:=0
	$requestType_t:="add suite"
	$addName_t:="mock suite"
	client_request_send(->$ref_l; $requestType_t; $addName_t)
	Unit_IntegerNotEqualAssert(0; $ref_l)
	client_request_delete(->$ref_l)
End if 

If (False:C215)  // (Unit_BeginTest("Add suite and subitem, then delete"; Current method name))
	$ref_l:=0
	$parentRef_l:=0
	client_request_suite_add(->$parentRef_l; "mock suite2")
	
	client_request_test_case_add(->$ref_l; "mock test"; $parentRef_l)
	
	Unit_IntegerNotEqualAssert(0; $ref_l)
	Unit_IntegerNotEqualAssert(0; $parentRef_l)
	Unit_IntegerNotEqualAssert($ref_l; $parentRef_l)
	client_request_delete(->$parentRef_l)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (False:C215)
	If (Not:C34($server_started_boo))
		Unit__ServerShutdown
	End if 
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
