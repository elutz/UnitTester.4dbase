//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_license_decode
// Syntax: setup_license_decode($key_blob{; $a_t{; $b_t}}) -> text
// Created by: Mark Schaake
// Date created: 07/05/09, 21:39:02
//
// Description:
//  Decodes a license key blob into the A and B code strings.
// 
// Returns: 
C_TEXT:C284($0; $decodedStr_t)
// Required Parameters: 
C_BLOB:C604($1; $key_blob)
// Optional Parameters: 
C_POINTER:C301($2; $a_t_p)
C_POINTER:C301($3; $b_t_p)
// Other Variables:
C_TEXT:C284($keyStr_t)
C_LONGINT:C283($i)
// 
//***********************************************************************

$key_blob:=$1
If (Count parameters:C259>=2)
	$a_t_p:=$2
End if 
If (Count parameters:C259>=3)
	$b_t_p:=$3
End if 

$keyStr_t:=BLOB to text:C555($key_blob; UTF8 text without length:K22:17)

$i:=0
For ($i; 1; Length:C16($keyStr_t))
	$decodedStr_t:=$decodedStr_t+String:C10(Character code:C91($keyStr_t[[$i]])%6+1)
End for 

If (Not:C34(Is nil pointer:C315($a_t_p)))
	$a_t_p->:=Substring:C12($decodedStr_t; 1; 8)
End if 

If (Not:C34(Is nil pointer:C315($b_t_p)))
	$b_t_p->:=Substring:C12($decodedStr_t; 9; 8)
End if 

$0:=$decodedStr_t

_callstack_pop