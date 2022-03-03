//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_ensure_plugin
// Created by: Mark Schaake
// Date created: 05/29/09, 18:08:42
//
// Description:
//  Ensures the UnitTester plugin is installed. If not, prompts
//  the user to install. Note that if client-server, requires server restart.
// 
// Returns:
C_BOOLEAN:C305($0; $isInstalled_b)
// Required Parameters:
C_BOOLEAN:C305($1; $upgrade_b)
C_TEXT:C284($2; $plugin_t)
// Optional Parameters:
// Other Variables:
// 
//***********************************************************************

$upgrade_b:=$1
$plugin_t:=$2

ARRAY TEXT:C222($plugins_at; 0)
ARRAY LONGINT:C221($plugins_al; 0)
PLUGIN LIST:C847($plugins_al; $plugins_at)
C_TEXT:C284($mssg_t)
C_LONGINT:C283($proc)

If ($upgrade_b)
	$mssg_t:="The "+$plugin_t+" support plugin requires upgrading.\rThe plugin has been copied into the Plugins folder."
Else 
	$mssg_t:="The UnitTester component requires the "+$plugin_t+" plugin.\rThe plugin has been copied into the Plugins folder."
End if 

If (Find in array:C230($plugins_at; $plugin_t)=-1) | ($upgrade_b)  // plugin not installed or upgrade required
	
	$isInstalled_b:=False:C215
	helper_InstallPlugin($plugin_t)
	
	Case of 
		: (Application type:C494=4D Remote mode:K5:5)
			ALERT:C41($mssg_t+"\rPlease restart the database to use UnitTester.")
			
			
		: (Application type:C494=4D Local mode:K5:1)
			CONFIRM:C162($mssg_t+"\rClick OK to restart the database.")
			If (OK=1)
				OPEN DATA FILE:C312(Data file:C490)
			End if 
			
	End case 
	
Else 
	$isInstalled_b:=True:C214
End if 

$0:=$isInstalled_b

_callstack_pop