//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: server_request_queue_kill
// Created by: Mark Schaake
// Date created: 05/17/09, 21:26:41
//
// Description:
//  Kills the server_request_queue process on the server.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************


C_BOOLEAN:C305(request_queue_run_boo)
request_queue_run_boo:=False:C215

SET PROCESS VARIABLE:C370(server_request_queue_process; request_queue_run_boo; request_queue_run_boo)

While (helper_ProcessExists(server_request_queue_process))
	DELAY PROCESS:C323(Current process:C322; 10)
End while 