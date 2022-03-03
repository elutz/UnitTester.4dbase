//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: server_request_queue_is_empty
// Created by: Mark Schaake
// Date created: 05/17/09, 21:20:40
//
// Description:
//  Returns true if the request queue is empty.
// 
// Returns: 
C_BOOLEAN:C305($0)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

ARRAY TEXT:C222(request_queue_names_at; 0)

GET PROCESS VARIABLE:C371(server_request_queue_process; request_queue_names_at; request_queue_names_at)

$0:=(Size of array:C274(request_queue_names_at)=0)