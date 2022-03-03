//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 20:13:22
// ----------------------------------------------------
// Method: suite_DeleteSelected
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_LONGINT:C283($itemPos_l)
ARRAY LONGINT:C221($items_al; 0)

$itemPos_l:=Selected list items:C379(hl_TestSuites; $items_al; *)

If ($itemPos_l>0)
	
	CONFIRM:C162("Delete the selected "+Choose:C955(Size of array:C274($items_al)>1; "items"; "item")+"?"+Char:C90(Carriage return:K15:38)+Char:C90(Carriage return:K15:38)+"Note: Test Case methods will be removed from UnitTester only and will remain in the database structure."; "Yes"; "No")
	
	If (OK=1)
		
		ARRAY LONGINT:C221($refs_al; 0)
		C_LONGINT:C283($sel_l)
		$sel_l:=Selected list items:C379(hl_TestSuites; $refs_al; *)
		
		C_LONGINT:C283($i)
		$i:=0
		For ($i; 1; Size of array:C274($items_al))
			DELETE FROM LIST:C624(hl_TestSuites; $items_al{$i}; *)
		End for 
		
		If (server_is_running)
			$i:=0
			For ($i; 1; Size of array:C274($refs_al))
				client_request_delete(->$refs_al{$i})
			End for 
		Else 
			helper_SuitesListToDocument
		End if 
		
	End if 
	
End if 