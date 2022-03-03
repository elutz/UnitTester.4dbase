//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: StringSplit
// Date created: 05/15/09, 17:09:13
// Created by: Mark Schaake
// Returns: --none--
// Required Parameters: 
C_TEXT:C284($1; $input_t)
C_POINTER:C301($2; $string_ar_p)
// Optional Parameters: 
C_TEXT:C284($3; $delimiter_t)
//***********************************************************************

$input_t:=$1
$string_ar_p:=$2
If (Count parameters:C259>=3)
	$delimiter_t:=$3
Else 
	$delimiter_t:=" "
End if 

DELETE FROM ARRAY:C228($string_ar_p->; 1; Size of array:C274($string_ar_p->))

C_LONGINT:C283($start; $pos)
$start:=1
$pos:=Position:C15($delimiter_t; $input_t)

While ($pos>0)
	APPEND TO ARRAY:C911($string_ar_p->; Substring:C12($input_t; $start; $pos-$start))
	$start:=$pos+1
	$pos:=Position:C15($delimiter_t; $input_t; $start)
End while 

APPEND TO ARRAY:C911($string_ar_p->; Substring:C12($input_t; $start; Length:C16($input_t)))