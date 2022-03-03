//%attributes = {"invisible":true,"shared":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: Unit_Mock_RecordCreate
// Created by: Mark Schaake
// Date created: 06/03/09, 17:19:57
//
// Description:
//  Creates a record for the passed table pointer, assumes
//  field 1 in the table is a longint id field and sets it to the
//  sequence number.
//  Updates the arrays initiated in Mock_Setup.
// 
// Returns: 
C_LONGINT:C283($0; $id_l)
// Required Parameters: 
C_POINTER:C301($1; $table_p)
// Optional Parameters: --none--
C_POINTER:C301(${2})  // field / value pointer pairs for assigning field values.
// Other Variables:
C_LONGINT:C283($i; $pos; $table_l)
C_POINTER:C301($idField_p)
// 
//***********************************************************************

$table_p:=$1

//TODO throw an exception if $table_p is not a valid table pointer?

$i:=0
$table_l:=Table:C252($table_p)

// ORDA Anpassung
// PK Feld ist nicht immer Feld Nr. 1
// TODO komplett umarbeiten damit es komplett ORDA-kompatibel wird
var $dataclass : 4D:C1709.DataClass
var $fieldNUmber : Integer
$dataclass:=ds:C1482[Table name:C256($table_p)]
$fieldNUmber:=$dataclass[$dataclass.getInfo().primaryKey].fieldNumber

$idField_p:=Field:C253($table_l; $fieldNUmber)

$pos:=Find in array:C230(mock_tables_ap; $table_p)
If ($pos=-1)
	APPEND TO ARRAY:C911(mock_tables_ap; $table_p)
	APPEND TO ARRAY:C911(mock_prev_seq_al; Get database parameter:C643($table_p->; Table sequence number:K37:31))
	APPEND TO ARRAY:C911(mock_records_added_al; 1)
Else 
	mock_records_added_al{$pos}:=mock_records_added_al{$pos}+1
End if 

CREATE RECORD:C68($table_p->)
//$idField_p->:=Sequence number($table_p->)
For ($i; 2; Count parameters:C259; 2)
	${$i}->:=${$i+1}->
End for 
SAVE RECORD:C53($table_p->)
LOAD RECORD:C52($table_p->)

$id_l:=$idField_p->

$0:=$id_l

_callstack_pop