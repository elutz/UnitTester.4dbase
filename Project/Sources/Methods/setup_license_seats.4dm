//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_license_seats
// Syntax: setup_license_seats($key_blob) -> longint
// Created by: Mark Schaake
// Date created: 07/05/09, 21:31:32
//
// Description:
//  Returns the number of seats from the license key.
// 
// Returns: 
//  0 = not a team license
//  1 = unlimited
//  2+ = number of seats
C_LONGINT:C283($0; $seats_l)
// Required Parameters: --none--
// Optional Parameters:
C_BLOB:C604($1; $key_blob)
// Other Variables:
ARRAY TEXT:C222($addSeatsCodes_at; 0)
C_TEXT:C284($k_unlimited_t)
C_TEXT:C284($decoded_t; $a_t; $b_t)
C_LONGINT:C283($pos)
// 
//***********************************************************************

If (Count parameters:C259>=1)
	$key_blob:=$1
Else 
	$key_blob:=server_document_to_blob(paths_UnitLicenseGet)
End if 

$k_unlimited_t:="32331323"
$decoded_t:=setup_license_decode($key_blob; ->$a_t; ->$b_t)

helper_ArrayTextAppend(->$addSeatsCodes_at; $k_unlimited_t; "62531524"; "31531522"; "12531523"; "53531523"; "16531525"; "33531522")
$pos:=Find in array:C230($addSeatsCodes_at; $a_t)

Case of 
	: (setup_license_type($key_blob)="demo")
		$seats_l:=999  //unlimited
	: (setup_license_type($key_blob)#"team@")
		$seats_l:=1  //Allow a single user license to connect to the server, but only one
	: ($pos=-1)
		$seats_l:=2
	: ($pos=1)
		$seats_l:=999  //unlimited
	Else 
		$seats_l:=$pos+1
End case 

$0:=$seats_l

_callstack_pop