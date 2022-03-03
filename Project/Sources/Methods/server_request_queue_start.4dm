//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: server_request_queue_start
// Created by: Mark Schaake
// Date created: 05/17/09, 21:26:01
//
// Description:
//  Starts the server_request_queue process on the server.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

C_BOOLEAN:C305(queue_initialized_boo)

queue_initialized_boo:=False:C215

If (helper_SelfStart(Current method name:C684; "unittester_request_queue"))
	
	C_BOOLEAN:C305(request_queue_run_boo)
	
	ARRAY LONGINT:C221(request_queue_refs_al; 0)
	ARRAY TEXT:C222(request_queue_types_at; 0)
	ARRAY TEXT:C222(request_queue_names_at; 0)
	ARRAY LONGINT:C221(request_queue_parentrefs_al; 0)
	ARRAY LONGINT:C221(request_queue_newparentrefs_al; 0)
	C_LONGINT:C283(request_queue_next_ref_l)
	
	request_queue_run_boo:=True:C214
	GET PROCESS VARIABLE:C371(server_request_procssor_process; request_queue_next_ref_l; request_queue_next_ref_l)
	
	queue_initialized_boo:=True:C214
	
	While (request_queue_run_boo)
		DELAY PROCESS:C323(Current process:C322; 10)
	End while 
	
Else 
	
	GET PROCESS VARIABLE:C371(server_request_queue_process; queue_initialized_boo; queue_initialized_boo)
	While (Not:C34(queue_initialized_boo))
		DELAY PROCESS:C323(Current process:C322; 1)
		GET PROCESS VARIABLE:C371(server_request_queue_process; queue_initialized_boo; queue_initialized_boo)
	End while 
	
End if 