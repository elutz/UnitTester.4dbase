//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_license_type
// Created by: Mark Schaake
// Date created: 05/30/09, 21:37:17
//
// Description:
//  Returns the current installed license type. Could be
//  demo, sinlge, or team.
// 
// Returns: 
C_TEXT:C284($0; $type_t)
// Required Parameters: --none--
// Optional Parameters:
C_BLOB:C604($1; $blob)
// Other Variables:
C_TEXT:C284($k_single_t; $k_team_t; $decoded_t; $a_t; $b_t)
ARRAY TEXT:C222($addSeatsCodes_at; 0)
C_LONGINT:C283($i)

// 
//***********************************************************************

$k_single_t:="26134652"
$k_team_t:="26143521"
$k_unlimited_t:="32331323"

helper_ArrayTextAppend(->$addSeatsCodes_at; "62031524"; "31031522"; "12031523"; "53031523"; "16031525"; "33031522")

//The key should contain exactly 16 characters matching the pattern [A-Z0-9]
//The key consits of two halves: 
//  A - the first 8 chars - only used if key is for team development, in which case it represents the number of seets
//  B - the last 8 chars - represents the type of license => team or single-user

If (Count parameters:C259>=1)
	$blob:=$1
Else 
	$blob:=server_document_to_blob(paths_UnitLicenseGet)
End if 

If (BLOB size:C605($blob)=0)
	$type_t:="demo"
Else 
	
	$decoded_t:=setup_license_decode($blob; ->$a_t; ->$b_t)
	
	Case of 
		: ($b_t=$k_single_t)
			$type_t:="single"
			
		: ($b_t=$k_team_t)
			
			$i:=Find in array:C230($addSeatsCodes_at; $a_t)
			
			If ($i>0)
				$type_t:="team"+String:C10($i+2)
			Else 
				If ($a_t=$k_unlimited_t)
					$type_t:="teamunlimited"
				Else 
					$type_t:="team"
				End if 
			End if 
			
		Else 
			$type_t:="demo"
	End case 
	
End if 

$0:=$type_t

_callstack_pop