//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _server_client_register
// Method under test: server_client_register
// Method under test syntax: 
// Date created: 06/26/2010, 11:08:35
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (False:C215)
	Unit_CustomLogTextSet(""; Current method name:C684)  //text will print out to the log file
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	//server_client_register Parameters: --none--
	
	//Other variables:
	C_TEXT:C284($singleUserLicense_t; $team2License_t; $team3License_t; $team4License_t; $team5License_t; $team6License_t; $teamUnlimitedLicense_t)
	C_LONGINT:C283($i)
	$singleUserLicense_t:="N1VW4AB1OGBVKAX1"
	$team2License_t:="N1D34SNUIMNWVXI0"
	$team3License_t:="GC4JBFOKIST3D4I0"
	$team4License_t:="PBLVNR1O1ANKD4UB"
	$team5License_t:="BUFPNFIDCABKDRIN"
	$team6License_t:="F2R2NXIPOA03JL10"
	$teamUnlimitedLicense_t:="DUDJNPCPUGNQPLUN"
	
	C_BLOB:C604($previousLicense_blob; $licenseBlob_blob)
	$previousLicense_blob:=server_document_to_blob(paths_UnitLicenseGet)
	
	Unit__ServerStartup
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (False:C215)  // (Unit_BeginTest("No license"; Current method name))
	DELETE DOCUMENT:C159(paths_UnitLicenseGet)
	
	//Should run in demo mode, which is the same as unlimited
	
	//Try 10 clients
	For ($i; 1; 10)
		Unit_TrueAssert(server_client_register("client"+String:C10($i)); "client "+String:C10($i))
	End for 
	
	For ($i; 1; 10)
		server_client_unregister("client"+String:C10($i))
	End for 
	
End if 

If (False:C215)  // (Unit_BeginTest("Single user license"; Current method name))
	setup_license_update($singleUserLicense_t)
	
	Unit_TrueAssert(server_client_register("client1"))
	Unit_FalseAssert(server_client_register("client2"))
	Unit_TrueAssert(server_client_register("client1"); "Client that is already registered")
	
	server_client_unregister("client1")
End if 

If (False:C215)  // (Unit_BeginTest("Team 2 license"; Current method name))
	setup_license_update($team2License_t)
	
	Unit_TrueAssert(server_client_register("client1"); "first client")
	Unit_TrueAssert(server_client_register("client2"); "second client")
	Unit_FalseAssert(server_client_register("client3"); "third client")
	Unit_TrueAssert(server_client_register("client1"); "Client that is already registered")
	
	server_client_unregister("client1")
	server_client_unregister("client2")
End if 

If (False:C215)  // (Unit_BeginTest("Team 3 license"; Current method name))
	setup_license_update($team3License_t)
	
	//Try 10 clients
	For ($i; 1; 3)
		Unit_TrueAssert(server_client_register("client"+String:C10($i)); "client "+String:C10($i))
	End for 
	
	Unit_FalseAssert(server_client_register("client4"))
	
	For ($i; 1; 3)
		server_client_unregister("client"+String:C10($i))
	End for 
	
End if 

If (False:C215)  // (Unit_BeginTest("Team 4 license"; Current method name))
	setup_license_update($team4License_t)
	
	//Try 10 clients
	For ($i; 1; 4)
		Unit_TrueAssert(server_client_register("client"+String:C10($i)); "client "+String:C10($i))
	End for 
	
	Unit_FalseAssert(server_client_register("client5"))
	
	For ($i; 1; 4)
		server_client_unregister("client"+String:C10($i))
	End for 
	
End if 

If (False:C215)  // (Unit_BeginTest("Team 5 license"; Current method name))
	setup_license_update($team5License_t)
	
	//Try 10 clients
	For ($i; 1; 5)
		Unit_TrueAssert(server_client_register("client"+String:C10($i)); "client "+String:C10($i))
	End for 
	
	Unit_FalseAssert(server_client_register("client6"))
	
	For ($i; 1; 5)
		server_client_unregister("client"+String:C10($i))
	End for 
	
End if 

If (False:C215)  // (Unit_BeginTest("Team 6 license"; Current method name))
	setup_license_update($team6License_t)
	
	//Try 10 clients
	For ($i; 1; 6)
		Unit_TrueAssert(server_client_register("client"+String:C10($i)); "client "+String:C10($i))
	End for 
	
	Unit_FalseAssert(server_client_register("client7"))
	
	For ($i; 1; 6)
		server_client_unregister("client"+String:C10($i))
	End for 
	
End if 

If (False:C215)  // (Unit_BeginTest("Team Unlimited license"; Current method name))
	setup_license_update($teamUnlimitedLicense_t)
	
	//Try 10 clients
	For ($i; 1; 10)
		Unit_TrueAssert(server_client_register("client"+String:C10($i)); "client "+String:C10($i))
	End for 
	
	For ($i; 1; 10)
		server_client_unregister("client"+String:C10($i))
	End for 
	
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (False:C215)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	Unit__ServerShutdown
	//Restore the license
	server_blob_to_document($previousLicense_blob; paths_UnitLicenseGet)
End if 
