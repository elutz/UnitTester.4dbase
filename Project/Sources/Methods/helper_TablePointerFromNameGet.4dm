//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 16:44:12
//--------------------------------------------------------------------------------
// Method: helper_TablePointerFromNameGet
// Takes a string and returns a pointer to a table
//
//--------------------------------------------------------------------------------
//
//Return Value
C_POINTER:C301($0; $table_p)

//Required Parameters
C_TEXT:C284($1; $tableName_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------

$tableName_t:=$1

If ($tableName_t="[@]")
	$tableName_t:=Substring:C12($tableName_t; 2; Length:C16($tableName_t)-2)
End if 

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Get last table number:C254)
	
	If (Is table number valid:C999($i))
		
		If (Table name:C256($i)=$tableName_t)
			$table_p:=Table:C252($i)
		End if 
		
	End if 
	
End for 

$0:=$table_p
