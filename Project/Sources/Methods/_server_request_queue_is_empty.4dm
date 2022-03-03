//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _server_request_queue_is_empty
// Method under test: server_request_queue_is_empty
// Date created: 05/17/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (False:C215)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	C_BOOLEAN:C305($expected_boo; $result_boo)  //variables to be passed to assertions
	
	//server_request_queue_is_empty Parameters: --none--
	
	//Other variables:
	C_LONGINT:C283($ref_l)
	
	C_BOOLEAN:C305($server_started_boo)
	$server_started_boo:=server_is_running
	If (Not:C34($server_started_boo))
		Unit__ServerStartup
	End if 
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (False:C215)  // (Unit_BeginTest("Empty queue"; Current method name))
	$result_boo:=server_request_queue_is_empty
	Unit_TrueAssert($result_boo)
End if 

If (False:C215)  // (Unit_BeginTest("Not-empty queue"; Current method name))
	client_request_send(->$ref_l; "add suite"; "mock suite")
	$result_boo:=server_request_queue_is_empty
	Unit_FalseAssert($result_boo)
	client_request_send(->$ref_l; "delete")
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
