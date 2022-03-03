//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: client_request_send
// Created by: Mark Schaake
// Date created: 05/17/09, 22:48:24
//
// Description:
//  Sends a request to the server_request_queue process.
//  Only one client at a time can send a request.
//  Semaphores are used to enforce this.
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $ref_long_p)
C_TEXT:C284($2; $requestType_t)
// Optional Parameters: 
C_TEXT:C284($3; $addName_t)
C_LONGINT:C283($4; $parentRef_l)
C_LONGINT:C283($5; $newParentRef_l)
// Other Variables:
C_LONGINT:C283($ref_l)
// 
//***********************************************************************

$ref_long_p:=$1
$requestType_t:=$2
If (Count parameters:C259>=3)
	$addName_t:=$3
End if 
If (Count parameters:C259>=4)
	$parentRef_l:=$4
End if 
If (Count parameters:C259>=5)
	$newParentRef_l:=$5
End if 

If (server_is_running)
	
	If (Not:C34(Semaphore:C143("<>queue_reserved")))
		
		//get the queue arrays, append the request, restore the arrays to the queue
		ARRAY LONGINT:C221(request_queue_refs_al; 0)
		ARRAY LONGINT:C221(request_queue_parentrefs_al; 0)
		ARRAY TEXT:C222(request_queue_types_at; 0)
		ARRAY TEXT:C222(request_queue_names_at; 0)
		C_LONGINT:C283(request_queue_next_ref_l)
		
		//GET PROCESS VARIABLE(server_request_queue_process ;)
		GET PROCESS VARIABLE:C371(server_request_queue_process; request_queue_next_ref_l; request_queue_next_ref_l; request_queue_refs_al; request_queue_refs_al; request_queue_parentrefs_al; request_queue_parentrefs_al; request_queue_types_at; request_queue_types_at; request_queue_names_at; request_queue_names_at)
		
		If ($requestType_t="add@")
			$ref_l:=request_queue_next_ref_l
			$ref_long_p->:=$ref_l
			request_queue_next_ref_l:=request_queue_next_ref_l+1
		Else 
			$ref_l:=$ref_long_p->
		End if 
		
		APPEND TO ARRAY:C911(request_queue_refs_al; $ref_l)
		APPEND TO ARRAY:C911(request_queue_parentrefs_al; $parentRef_l)
		APPEND TO ARRAY:C911(request_queue_types_at; $requestType_t)
		APPEND TO ARRAY:C911(request_queue_names_at; $addName_t)
		
		VARIABLE TO VARIABLE:C635(server_request_queue_process; request_queue_refs_al; request_queue_refs_al; request_queue_parentrefs_al; request_queue_parentrefs_al; request_queue_types_at; request_queue_types_at; request_queue_names_at; request_queue_names_at; request_queue_next_ref_l; request_queue_next_ref_l)
		
		CLEAR SEMAPHORE:C144("<>queue_reserved")
		
	End if 
	
End if 