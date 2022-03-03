//%attributes = {"shared":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 21:34:28
// ----------------------------------------------------
// Method: Unit_OpenUnitTester
// Description:
// Open's the UnitTester GUI or brings to front if it
// is already open.
//
// ----------------------------------------------------

C_POINTER:C301($1)  //this is for 4D Pop compatibility. Not actually used. Will point to the button clicked.
C_BOOLEAN:C305($ok_b)

If (False:C215)
	C_POINTER:C301(Unit__LaunchUnitTester; $1)
End if 

$ok_b:=True:C214

//If (setup_ensure_plugin (False;"4D Pack")) & (setup_ensure_plugin (False;"API Pack"))

//If this is client server, need to register with the unittester daemon
If (server_is_running)
	If (setup_license_type="demo")
		$ok_b:=True:C214
		//no need to register with the server, works like unlimited
	Else 
		$ok_b:=server_client_register(Current machine:C483)
		If (Not:C34($ok_b))
			ALERT:C41("All UnitTester client seats are currently in use.")
		End if 
	End if 
End if 

If ($ok_b)
	
	C_LONGINT:C283($proc_l)
	$proc_l:=Process number:C372("UnitTester")
	
	If (helper_ProcessExists($proc_l))
		BRING TO FRONT:C326($proc_l)
	Else 
		$proc_l:=New process:C317("helper_OpenProjectForm"; 0; "UnitTester"; "UnitTester")
	End if 
	
End if 

//End if 