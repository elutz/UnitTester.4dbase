//%attributes = {"invisible":true}
// User name (OS): Mark Schaake
// Date and time: 04/01/09, 13:11:02
//--------------------------------------------------------------------------------
// Method: helper_RegExMatchReplace
// Replaces the occurance of the pattern. You can specify the number to replace, default is all.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($0)

//Required Parameters
C_TEXT:C284($1; $pattern_t)
C_TEXT:C284($2; $string_t)
C_TEXT:C284($3; $replace_t)

//Optional Parameters
C_LONGINT:C283($4; $number_l)

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$pattern_t:=$1
$string_t:=$2
$replace_t:=$3

ARRAY LONGINT:C221($pos_al; 0)
ARRAY LONGINT:C221($length_al; 0)

If (helper_RegExMatchAllOccurances($pattern_t; $string_t; ->$pos_al; ->$length_al))
	
	If (Count parameters:C259>=4)
		$number_l:=$4
	Else 
		$number_l:=Size of array:C274($pos_al)
	End if 
	
	C_LONGINT:C283($i)
	$i:=0
	For ($i; $number_l; 1; -1)
		$string_t:=Delete string:C232($string_t; $pos_al{$i}; $length_al{$i})
		$string_t:=Insert string:C231($string_t; $replace_t; $pos_al{$i})
	End for 
	
End if 

_callstack_pop

$0:=$string_t