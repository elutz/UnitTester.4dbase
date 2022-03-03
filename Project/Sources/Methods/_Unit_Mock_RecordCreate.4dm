//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _Unit_Mock_RecordCreate
// Method under test: 
// Date created: 06/03/2009, 17:19:57
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down 
	C_LONGINT:C283($expected_l; $result_l)  //variables to be passed to assertions
	
	// Parameters: 
	C_POINTER:C301($table_p)
	C_POINTER:C301($fiedlVal_p)
	
	//Other variables:
	ARRAY POINTER:C280($tables_ap; 0)
	ARRAY LONGINT:C221($prev_seq_al; 0)
	ARRAY LONGINT:C221($records_added_al; 0)
	C_LONGINT:C283($prevSeq_l)
	C_TEXT:C284($text_t)
	C_DATE:C307($date_d)
	$prevSeq_l:=Get database parameter:C643([test_table:1]; Table sequence number:K37:31)
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Setup arrays initialized"; Current method name:C684))
	helper_ArrayClear(->$tables_ap; ->$prev_seq_al; ->$records_added_al)
	Unit_Mock_Setup
	Unit_ArrayEqualAssert(->$tables_ap; ->mock_tables_ap)
	Unit_ArrayEqualAssert(->$prev_seq_al; ->mock_prev_seq_al)
	Unit_ArrayEqualAssert(->$records_added_al; ->mock_records_added_al)
End if 

If (Unit_BeginTest("Record created, no field values set"; Current method name:C684))
	$expected_l:=0
	$result_l:=Unit_Mock_RecordCreate(->[test_table:1])
	Unit_IntegerNotEqualAssert($expected_l; $result_l)
End if 

If (Unit_BeginTest("Record created, with field values set"; Current method name:C684))
	$expected_l:=0
	$text_t:="mock text"
	$date_d:=!2000-01-01!
	$result_l:=Unit_Mock_RecordCreate(->[test_table:1]; ->[test_table:1]Field_2:2; ->$text_t; ->[test_table:1]Field_4:4; ->$date_d)
	Unit_IntegerNotEqualAssert($expected_l; $result_l)
	QUERY:C277([test_table:1]; [test_table:1]id:1=$result_l)
	Unit_TextEqualAssert($text_t; [test_table:1]Field_2:2; "text field")
	Unit_DateEqualAssert($date_d; [test_table:1]Field_4:4; "date field")
End if 

If (Unit_BeginTest("Sequence numbers restored"; Current method name:C684))
	helper_ArrayClear(->$tables_ap; ->$prev_seq_al; ->$records_added_al)
	
	Unit_ArrayNotEqualAssert(->$tables_ap; ->mock_tables_ap)
	Unit_ArrayNotEqualAssert(->$prev_seq_al; ->mock_prev_seq_al)
	Unit_ArrayNotEqualAssert(->$records_added_al; ->mock_records_added_al)
	
	Unit_IntegerNotEqualAssert($prevSeq_l; Get database parameter:C643([test_table:1]; Table sequence number:K37:31))
	
	Unit_Mock_TearDown
	Unit_IntegerEqualAssert($prevSeq_l; Get database parameter:C643([test_table:1]; Table sequence number:K37:31))
	Unit_ArrayEqualAssert(->$tables_ap; ->mock_tables_ap)
	Unit_ArrayEqualAssert(->$prev_seq_al; ->mock_prev_seq_al)
	Unit_ArrayEqualAssert(->$records_added_al; ->mock_records_added_al)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
