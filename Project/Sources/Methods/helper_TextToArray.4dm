//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 09:00:04
// ----------------------------------------------------
// Method: helper_TextToArray
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $text_t)
C_POINTER:C301($2; $arrPtr)

//OPTIONAL PARAMETERS
C_TEXT:C284($3; $delimiter_t)

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$text_t:=$1
$arrPtr:=$2

If (Count parameters:C259>=3)
	$delimiter_t:=$3
Else 
	$delimiter_t:=Char:C90(Carriage return:K15:38)
End if 

helper_ArrayClear($arrPtr)

If (Length:C16($text_t)#0)
	
	While ($text_t[[Length:C16($text_t)]]=$delimiter_t)
		$text_t:=Delete string:C232($text_t; Length:C16($text_t); 1)
	End while 
	
	C_LONGINT:C283($pos; $prevPos; $lengthFound_l)
	
	$prevPos:=1
	$pos:=Position:C15($delimiter_t; $text_t; $prevPos; $lengthFound_l)
	
	While ($pos>0)
		APPEND TO ARRAY:C911($arrPtr->; Substring:C12($text_t; $prevPos; $pos-$prevPos))
		$prevPos:=$pos+$lengthFound_l
		$pos:=Position:C15($delimiter_t; $text_t; $prevPos; $lengthFound_l)
	End while 
	
	If (Length:C16($text_t)>0)
		APPEND TO ARRAY:C911($arrPtr->; Substring:C12($text_t; $prevPos; Length:C16($text_t)))
	End if 
	
Else 
	_E_Throw("Empty text parameter passed to TextToArray")
End if 

_callstack_pop