//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: server_client_register
// Syntax: server_client_register($machine_owner_t) -> boolean
// Created by: Mark Schaake
// Date created: 07/06/09, 19:38:44
//
// Description:
//  Registers the current client with the server daemon.
//  If the license limits the number of clients, it is enforeced.
//  If all seats are used up, returns false, otherwise returns true.
// 
// Returns: 
C_BOOLEAN:C305($0; $registered_b)
// Required Parameters: 
C_TEXT:C284($1; $machine_owner_t)
// Optional Parameters: --none--
// Other Variables:
C_LONGINT:C283($seats_l)
ARRAY TEXT:C222(registered_clients_at; 0)
// 
//***********************************************************************

$machine_owner_t:=$1
$registered_b:=False:C215

If (Not:C34(Semaphore:C143("processor_reserved"; 300)))
	
	logger_info("Registering a client: machine owner = "+$machine_owner_t)
	
	//Total seats allowed per the license
	$seats_l:=setup_license_seats
	
	logger_info("License seats: "+String:C10($seats_l))
	
	GET PROCESS VARIABLE:C371(server_request_procssor_process; registered_clients_at; registered_clients_at)
	
	Case of 
		: (Find in array:C230(registered_clients_at; $machine_owner_t)>0)
			logger_info("Client already registered")
			$registered_b:=True:C214
			
		: ($seats_l<=Size of array:C274(registered_clients_at))
			logger_info("Client not  registered, no more seats available")
			$registered_b:=False:C215
			
		Else 
			logger_info("Client not already registered, seats available, registering client")
			$registered_b:=True:C214
			APPEND TO ARRAY:C911(registered_clients_at; $machine_owner_t)
			VARIABLE TO VARIABLE:C635(server_request_procssor_process; registered_clients_at; registered_clients_at)
			
	End case 
	
	CLEAR SEMAPHORE:C144("processor_reserved")
	
End if 

$0:=$registered_b

_callstack_pop