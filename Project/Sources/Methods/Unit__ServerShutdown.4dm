//%attributes = {"invisible":true,"shared":true,"executedOnServer":true}
//***********************************************************************
// Method Name: Unit__ServerShutdown
// Created by: Mark Schaake
// Date created: 05/16/09, 03:18:42
//
// Description:
//  Ensures the unittester_request_queue is fully processed
//  then quits both processes spawned by Unit__ServerStartup.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
//***********************************************************************

If (server_is_running)
	
	While (Not:C34(server_request_queue_is_empty))
		DELAY PROCESS:C323(Current process:C322; 1)
	End while 
	
	server_request_queue_kill
	server_request_processor_kill
	
End if 