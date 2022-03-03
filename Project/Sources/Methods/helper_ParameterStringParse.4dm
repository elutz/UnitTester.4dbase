//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:42:03
// ----------------------------------------------------
// Method: helper_ParseParameterString
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $params_t)
C_POINTER:C301($2; $params_apt)

//OPTIONAL PARAMETERS


// ----------------------------------------------------
_callstack_push(Current method name:C684)

$params_t:=$1
$params_apt:=$2

//Make sure $params_apt conains 0 elements
helper_ArrayClear($params_apt)

C_LONGINT:C283($posStart_l; $posFound_l; $length_l)
$posStart_l:=1

C_TEXT:C284($regExp_t)
$regExp_t:="[^;]+"

While (Match regex:C1019($regExp_t; $params_t; $posStart_l; $posFound_l; $length_l))
	
	APPEND TO ARRAY:C911($params_apt->; Substring:C12($params_t; $posFound_l; $length_l))
	$posStart_l:=$posFound_l+$length_l
	
End while 

_callstack_pop