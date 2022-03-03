//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: helper_ArrayToText
// Date created: 05/15/09, 12:17:19
// Created by: Mark Schaake
// Returns: 
C_TEXT:C284($0; $text_t)
// Required Parameters: 
C_POINTER:C301($1; $arText_p)
C_TEXT:C284($2; $delim_t)
// Optional Parameters: --none''
//***********************************************************************
_callstack_push(Current method name:C684)

$arText_p:=$1
$delim_t:=$2

For ($i; 1; Size of array:C274($arText_p->))
	$text_t:=$text_t+Choose:C955($i=1; ""; $delim_t)+$arText_p->{$i}
End for 

$0:=$text_t

_callstack_pop