//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: server_client_unregister
// Syntax: server_client_unregister($machine_owner_t)
// Created by: Mark Schaake
// Date created: 07/06/09, 19:44:16
//
// Description:
//  Unregisters a client.
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $machine_owner_t)
// Optional Parameters: --none--
// Other Variables:
ARRAY TEXT:C222(registered_clients_at; 0)
C_LONGINT:C283($pos)
// 
//***********************************************************************

$machine_owner_t:=$1

If (Not:C34(Semaphore:C143("processor_reserved"; 300)))
	
	GET PROCESS VARIABLE:C371(server_request_procssor_process; registered_clients_at; registered_clients_at)
	$pos:=Find in array:C230(registered_clients_at; $machine_owner_t)
	
	If ($pos>0)
		DELETE FROM ARRAY:C228(registered_clients_at; $pos)
		VARIABLE TO VARIABLE:C635(server_request_procssor_process; registered_clients_at; registered_clients_at)
	End if 
	
	CLEAR SEMAPHORE:C144("processor_reserved")
	
End if 

_callstack_pop