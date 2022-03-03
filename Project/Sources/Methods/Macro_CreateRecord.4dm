//%attributes = {"invisible":true,"shared":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 16:41:16
//--------------------------------------------------------------------------------
// Method: Macro_CreateRecord
// 
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
// -- NONE --

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------


C_TEXT:C284($table_t; $createBlock_t)

GET MACRO PARAMETER:C997(Highlighted method text:K5:18; $table_t)

C_POINTER:C301($table_p)

$table_p:=helper_TablePointerFromNameGet($table_t)

If (Not:C34(Is nil pointer:C315($table_p)))
	
	$createBlock_t:="CREATE RECORD("+$table_t+")"
	$createBlock_t:=$createBlock_t+"\r"
	
	C_LONGINT:C283($i; $table_l)
	$i:=0
	$table_l:=Table:C252($table_p)
	For ($i; 1; Get last field number:C255($table_p))
		
		If (Is field number valid:C1000($table_l; $i))
			$createBlock_t:=$createBlock_t+$table_t+Field name:C257(Field:C253($table_l; $i))+":=\r"
		End if 
		
	End for 
	
	$createBlock_t:=$createBlock_t+"SAVE RECORD("+$table_t+")"
	
	SET MACRO PARAMETER:C998(Highlighted method text:K5:18; $createBlock_t)
	
End if 