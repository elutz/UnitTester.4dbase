//%attributes = {"invisible":true,"shared":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: Unit_Mock_TearDown
// Created by: Mark Schaake
// Date created: 06/03/09, 17:12:12
//
// Description:
//  Restores table sequence numbers to values prior to the
//  call to Mock_Setup, assuming no other processes have
//  also added records. If other records have been added
//  for a table in another process, that table will have its
//  sequence number reset.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

C_LONGINT:C283($i; $seq_l)
$i:=0
For ($i; 1; Size of array:C274(mock_tables_ap))
	$seq_l:=Get database parameter:C643(mock_tables_ap{$i}->; Table sequence number:K37:31)
	If ($seq_l=(mock_prev_seq_al{$i}+mock_records_added_al{$i}))
		SET DATABASE PARAMETER:C642(mock_tables_ap{$i}->; Table sequence number:K37:31; mock_prev_seq_al{$i})
	End if 
End for 

helper_ArrayClear(->mock_tables_ap; ->mock_prev_seq_al; ->mock_records_added_al)

_callstack_pop