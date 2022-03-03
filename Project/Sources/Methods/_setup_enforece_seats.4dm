//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _setup_enforece_seats
// Method under test: 
// Method under test syntax: 
// Date created: 07/06/2009, 20:21:10
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	// Parameters: --none--
	
	//Other variables:
	C_BOOLEAN:C305($server_started_boo)
	C_LONGINT:C283($seats_l; $i)
	
	$server_started_boo:=server_is_running
	If ($server_started_boo)
		Unit__ServerShutdown
	End if 
	$seats_l:=setup_license_seats
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Register and unregester"; Current method name:C684))
	Unit__ServerStartup
	Unit_TrueAssert($seats_l>0; "need seats to test")
	For ($i; 1; $seats_l)
		Unit_TrueAssert(server_client_register("client"+String:C10($i)))
	End for 
	Unit_FalseAssert(server_client_register("client"+String:C10($i)))
	
	server_client_unregister("client"+String:C10($i-1))
	Unit_TrueAssert(server_client_register("client"+String:C10($i)); "register after unregister")
	
	Unit__ServerShutdown
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	If ($server_started_boo)
		Unit__ServerStartup
	End if 
End if 
