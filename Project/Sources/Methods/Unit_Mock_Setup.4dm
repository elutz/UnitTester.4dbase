//%attributes = {"invisible":true,"shared":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: Mock_Setup
// Created by: Mark Schaake
// Date created: 06/03/09, 17:07:05
//
// Description:
//  Initializes process arrays for tracking sequence numbers
//  so that after mock records are created, the database
//  tables' sequence numbers can be restored.
//  Note: also keeps track of the number of records created
//  per table via the Mock_RecordCreate command, and
//  detects whether or not other processes have added
//  records in the meantime. If other processes have, no
//  action will be taken for those tables in the
//  Mock_Teardown call. Otherwise, the sequence numbers
//  are restored to the previous values.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

ARRAY POINTER:C280(mock_tables_ap; 0)
ARRAY LONGINT:C221(mock_prev_seq_al; 0)
ARRAY LONGINT:C221(mock_records_added_al; 0)

_callstack_pop