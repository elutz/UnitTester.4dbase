//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 14:56:40
// ----------------------------------------------------
// Method: helper_GetListItemParameterText
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $key_t)
C_TEXT:C284($0; $value_t)

//OPTIONAL PARAMETERS
C_LONGINT:C283($3; $ref_l)

// ----------------------------------------------------

$list_l:=$1
$key_t:=$2

If (Count parameters:C259>=3)
	$ref_l:=$3
Else 
	$ref_l:=-1
End if 

If ($ref_l>=0)
	GET LIST ITEM PARAMETER:C985($list_l; $ref_l; $key_t; $value_t)
Else 
	GET LIST ITEM PARAMETER:C985($list_l; *; $key_t; $value_t)
End if 

$0:=$value_t