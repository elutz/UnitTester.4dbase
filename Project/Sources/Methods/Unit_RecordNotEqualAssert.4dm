//%attributes = {"invisible":true,"shared":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 20:41:43
//--------------------------------------------------------------------------------
// Method: Unit_RecordNotEqualAssert
// Asserts two records do not have equal values for all fields.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_POINTER:C301($1; $table_p)
C_LONGINT:C283($2; $rec1_l)
C_LONGINT:C283($3; $rec2_l)

//Optional Parameters
C_POINTER:C301($4; $ignoreFields_app)  //pointer to fields to ignore in comparison - e.g. you may want to ignore id fields
C_TEXT:C284($5; $other_t)

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$table_p:=$1
$rec1_l:=$2
$rec2_l:=$3

If (Count parameters:C259>=4)
	$ignoreFields_app:=$4
Else 
	ARRAY POINTER:C280($ignoreFields_ap; 0)
	$ignoreFields_app:=->$ignoreFields_ap
End if 

If (Count parameters:C259>=5)
	$other_t:=$5
Else 
	$other_t:=""
End if 

C_BLOB:C604($val1_blob; $val2_blob)

$val1_blob:=helper_RecordToBLOB($table_p; $rec1_l; $ignoreFields_app)
$val2_blob:=helper_RecordToBLOB($table_p; $rec1_2; $ignoreFields_app)

Unit_NotEqualAssert(->$val1_blob; ->$val2_blob; $other_t)

_callstack_pop  //keep this at the end of the method