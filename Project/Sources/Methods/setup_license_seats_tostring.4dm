//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_license_seats_tostring
// Syntax: setup_license_seats_tostring($key_blob) -> text
// Created by: Mark Schaake
// Date created: 07/05/09, 21:57:59
//
// Description:
//  Returns the string representation of the license seats:
//  i.e. "2" or "3" or ... or "Unlimited"
// 
// Returns: 
C_TEXT:C284($0; $seats_t)
// Required Parameters: 
C_BLOB:C604($1; $key_blob)
// Optional Parameters: --none--
// Other Variables:
C_LONGINT:C283($seats_l)
// 
//***********************************************************************

$key_blob:=$1

$seats_l:=setup_license_seats($key_blob)


Case of 
	: ($seats_l=1)
		$seats_t:="Unlimited"
	: ($seats_l>1)
		$seats_t:=String:C10($seats_l)+" Seats"
	Else 
		$seats_t:=""  //not a team license
End case 


$0:=$seats_t

_callstack_pop