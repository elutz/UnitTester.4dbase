//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: server_request_processor_kill
// Created by: Mark Schaake
// Date created: 05/17/09, 21:04:44
//
// Description:
//  Kills the server_request_processor process.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

C_BOOLEAN:C305(request_processor_run_boo)
request_processor_run_boo:=False:C215

SET PROCESS VARIABLE:C370(server_request_procssor_process; request_processor_run_boo; request_processor_run_boo)

While (server_is_running)
	DELAY PROCESS:C323(Current process:C322; 10)
End while 