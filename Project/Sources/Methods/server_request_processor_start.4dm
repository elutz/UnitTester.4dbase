//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: server_request_processor_start
// Created by: Mark Schaake
// Date created: 05/17/09, 21:02:59
//
// Description:
//  Starts the server_request_processor process on the
//  server. This process should poll the server_request_queue
//  process periodically for new requests - e.g. add suite,
//  add test, delete, etc. When new requests are found,
//  the processor process consumes the requests off the
//  queue and updates the master UnitTester hierarchical
//  list stored on the server.
// 
// Returns: 
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

C_BOOLEAN:C305(server_initialized_boo)
server_initialized_boo:=False:C215

If (helper_SelfStart(Current method name:C684; "unittester_request_processor"))
	
	C_BLOB:C604(<>test_blob)
	C_BOOLEAN:C305(request_processor_run_boo)
	ARRAY LONGINT:C221(request_queue_refs_al; 0)
	ARRAY LONGINT:C221(request_queue_parentrefs_al; 0)
	ARRAY LONGINT:C221(request_queue_newparentrefs_al; 0)
	ARRAY TEXT:C222(request_queue_types_at; 0)
	ARRAY TEXT:C222(request_queue_names_at; 0)
	C_LONGINT:C283(request_queue_next_ref_l)
	
	//seat enforcement
	ARRAY TEXT:C222(registered_clients_at; 0)
	
	C_LONGINT:C283($list_l; $sublist_l; $itemRef_l)
	C_TEXT:C284($item_t)
	ARRAY LONGINT:C221($emptyLong_al; 0)
	ARRAY TEXT:C222($emptyText_at; 0)
	
	$list_l:=New list:C375
	request_processor_run_boo:=True:C214
	helper_TestFileToListLoad(paths_TestFileGet; ->$list_l)
	helper_ListExpand($list_l)
	LIST TO BLOB:C556($list_l; <>test_blob)
	request_queue_next_ref_l:=helper_ListItemRefGreatestGet($list_l)+1
	server_initialized_boo:=True:C214
	
	server_request_queue_start
	
	While (request_processor_run_boo)
		
		If (server_is_running)
			
			If (Not:C34(server_request_queue_is_empty))
				
				If (Not:C34(Semaphore:C143("queue_reserved")))
					
					//run through the entire queue
					//get the queue arrays
					//get the hlist on server
					GET PROCESS VARIABLE:C371(server_request_queue_process; request_queue_refs_al; request_queue_refs_al; request_queue_parentrefs_al; request_queue_parentrefs_al; request_queue_newparentrefs_al; request_queue_newparentrefs_al; request_queue_types_at; request_queue_types_at; request_queue_names_at; request_queue_names_at)
					//clear the arrays in the queue
					VARIABLE TO VARIABLE:C635(server_request_queue_process; request_queue_refs_al; $emptyLong_al; request_queue_parentrefs_al; $emptyLong_al; request_queue_newparentrefs_al; $emptyLong_al; request_queue_types_at; $emptyText_at; request_queue_names_at; $emptyText_at)
					CLEAR SEMAPHORE:C144("queue_reserved")
					
					//update the hlist
					For ($i; 1; Size of array:C274(request_queue_refs_al))
						
						If (request_queue_parentrefs_al{$i}>0)
							GET LIST ITEM:C378($list_l; List item position:C629($list_l; request_queue_parentrefs_al{$i}); $itemRef_l; $item_t; $sublist_l)
							If (Not:C34(Is a list:C621($sublist_l)))
								$sublist_l:=New list:C375
								SET LIST ITEM:C385($list_l; $itemRef_l; $item_t; $itemRef_l; $sublist_l; True:C214)
							End if 
						Else 
							$sublist_l:=$list_l
						End if 
						
						//what type of request is it?
						Case of 
							: (request_queue_types_at{$i}="add suite") & (request_queue_refs_al{$i}>0)
								$itemRef_l:=helper_ListAppend($sublist_l; request_queue_names_at{$i}; request_queue_refs_al{$i})
								suite_SetListItemType($sublist_l; "suite"; request_queue_refs_al{$i})
								If (request_queue_parentrefs_al{$i}>0)  //is it a sub-suite?
									SET LIST ITEM:C385($list_l; request_queue_parentrefs_al{$i}; $item_t; request_queue_parentrefs_al{$i}; $sublist_l; True:C214)
								End if 
								
							: (request_queue_types_at{$i}="add test") & (request_queue_refs_al{$i}>0)
								$itemRef_l:=helper_ListAppend($sublist_l; request_queue_names_at{$i}; request_queue_refs_al{$i})
								suite_SetListItemType($sublist_l; "unit"; request_queue_refs_al{$i})
								SET LIST ITEM:C385($list_l; request_queue_parentrefs_al{$i}; $item_t; request_queue_parentrefs_al{$i}; $sublist_l; True:C214)
								
							: (request_queue_types_at{$i}="update")  // this is for name changes
								
								If (request_queue_parentrefs_al{$i}>0)  //we have a move
									suite_MoveListItem(request_queue_refs_al{$i}; request_queue_parentrefs_al{$i}; $list_l)
								End if 
								
								SET LIST ITEM:C385($list_l; request_queue_refs_al{$i}; request_queue_names_at{$i}; request_queue_refs_al{$i})
								
							: (request_queue_types_at{$i}="delete")
								If (List item position:C629($list_l; request_queue_refs_al{$i})>0)
									DELETE FROM LIST:C624($list_l; request_queue_refs_al{$i}; *)
								End if 
								
						End case 
						
					End for 
					
					//Save blob so clients can retreive
					LIST TO BLOB:C556($list_l; <>test_blob)
					
					//Save to disk the updated hlist
					helper_SuitesListToDocument(paths_TestFileGet; ->$list_l)
					
					//clean up
					helper_ArrayClear(->request_queue_refs_al)
					helper_ArrayClear(->request_queue_parentrefs_al)
					helper_ArrayClear(->request_queue_types_at)
					helper_ArrayClear(->request_queue_names_at)
					
				End if 
				
			End if 
			
			DELAY PROCESS:C323(Current process:C322; 10)
			
		End if 
		
	End while 
	
	CLEAR LIST:C377($list_l)
	
Else 
	
	GET PROCESS VARIABLE:C371(server_request_procssor_process; server_initialized_boo; server_initialized_boo)
	While (Not:C34(server_initialized_boo))
		DELAY PROCESS:C323(Current process:C322; 1)
		GET PROCESS VARIABLE:C371(server_request_procssor_process; server_initialized_boo; server_initialized_boo)
	End while 
	
End if 