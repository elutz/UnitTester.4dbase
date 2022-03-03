//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: method_CreateMethod
// Syntax: method_CreateMethod($method_name_t; $properties_al_p; $code_t; $home_folder_t)
// Created by: Mark Schaake
// Date created: 02/01/10, 12:36:41
//
// Description:
//  Wraps the plugin call to create a method. Prefers to 
//  use AP Pack if it is installed, otherwise uses the 
//  UnitTester plugin method.
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $method_name_t)
C_POINTER:C301($2; $properties_al_p)
C_TEXT:C284($3; $code_t)
C_TEXT:C284($4; $home_folder_t)
// Optional Parameters: --none--
// Other Variables:
ARRAY LONGINT:C221($numbers_al; 0)
ARRAY TEXT:C222($names_at; 0)
ARRAY LONGINT:C221($props_al; 0)
C_LONGINT:C283($err_l)
// 
//***********************************************************************

$method_name_t:=$1
$properties_al_p:=$2
$code_t:=$3
$home_folder_t:=$4

COPY ARRAY:C226($properties_al_p->; $props_al)

C_TEXT:C284($methodPath)
$methodPath:=$method_name_t
METHOD SET CODE:C1194($methodPath; $code_t; *)

C_OBJECT:C1216($attributes)
$attributes:=New object:C1471
$attributes.invisible:=$props_al{1}=1
$attributes.shared:=$props_al{5}=1

METHOD SET ATTRIBUTES:C1335($methodPath; $attributes; *)

If ($err_l>0)
	//_E_Throw ("Method creation exception";"Method not created due to some error")
End if 

_callstack_pop