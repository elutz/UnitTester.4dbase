//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: runner_eh_form_method
// Syntax: runner_eh_form_method($event_l)
// Created by: Mark Schaake
// Date created: 07/24/09, 08:57:09
//
// Description:
//  Handles $event_ls for the test runner gui.
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $event_l)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$event_l:=$1

helper_DaemonController($event_l=On Load:K2:1)

Case of 
	: ($event_l=On Load:K2:1)
		
		helper_EditMenuAdd
		
		//What 4D version are we?
		
		C_BOOLEAN:C305(<>UnitTesterIsDemo_boo; <>ReloadList_boo; testing_boo)
		<>UnitTesterIsDemo_boo:=False:C215  //(setup_license_type ="demo")
		<>ReloadList_boo:=False:C215
		testing_boo:=False:C215
		
		hl_TestSuites:=New list:C375
		helper_TestFileToListLoad
		
		If (<>UnitTesterIsDemo_boo)
			ALERT:C41("This version of UnitTester is not yet licensed and therefore in demonstration mode.\rAs such, you are limited to a maximum of: \r10 test case methods and \r20 assertions.")
		End if 
		
		Case of 
			: (server_is_running)
			: (Application type:C494=4D Remote mode:K5:5)
				ALERT:C41("The UnitTester server process is not running. Make sure you have the necessary call to Unit__ServerStartup in the On server startup database method.")
				CANCEL:C270
			Else   // we're in local mode
				version_control
		End case 
		
		//check for updates on (prefs)?
		//If (prefs_GetForCheckbox ("check_for_updates")=1)
		//
		//  `only check if we haven't already checked today:
		//C_DATE($lastUpdateCheck_d)
		//prefs_GetById ("last_update_check";->$lastUpdateCheck_d)
		//
		//If ($lastUpdateCheck_d#Current date)
		//app_check_for_updates ("wa_currentversion")
		//End if 
		//
		//End if 
		
		//Can't change method names if host is compiled
		If (Is compiled mode:C492(*))
			OBJECT SET ENTERABLE:C238(*; "hl_TestSuites"; False:C215)
		End if 
		
	: ($event_l=On Outside Call:K2:11)
		
		If (<>ReloadList_boo)
			hl_TestSuites:=New list:C375
			helper_TestFileToListLoad
			<>ReloadList_boo:=False:C215
		End if 
		
	: ($event_l=On Unload:K2:2)
		server_client_unregister(Current machine:C483)
		
End case 


_callstack_pop