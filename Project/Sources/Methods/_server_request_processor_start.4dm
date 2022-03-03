//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _server_request_processor_start
// Method under test: server_request_processor_start
// Date created: 05/17/2009
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (False:C215)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	C_LONGINT:C283($expected_l; $result_l)  //variables to be passed to assertions
	
	//server_request_processor_start Parameters: --none--
	
	//Other variables:
	C_BOOLEAN:C305($server_started_boo)
	$server_started_boo:=server_is_running
	If ($server_started_boo)
		Unit__ServerShutdown
	End if 
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (False:C215)  // (Unit_BeginTest("Start and stop process"; Current method name))
	Unit__ServerStartup
	$expected_l:=0
	$result_l:=server_request_procssor_process
	Unit_IntegerNotEqualAssert($expected_l; $result_l)
	Unit__ServerShutdown
	$result_l:=server_request_procssor_process
	Unit_IntegerEqualAssert($expected_l; $result_l)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (False:C215)
	If ($server_started_boo)
		Unit__ServerStartup
	End if 
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
