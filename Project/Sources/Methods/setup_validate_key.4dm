//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: setup_validate_key
// Created by: Mark Schaake
// Date created: 05/30/09, 14:54:36
//
// Description:
//  Validates a key string.
// 
// Returns: 
C_BOOLEAN:C305($0; $isValid_boo)
// Required Parameters: 
C_TEXT:C284($1; $key_t)
// Optional Parameters: --none--
// Other Variables:
C_TEXT:C284($b_t; $encrypted_t; $k_single_t; $k_team_t)
C_LONGINT:C283($i)
// 
//***********************************************************************

$key_t:=$1

$key_t:=Replace string:C233($key_t; "-"; "")

C_BLOB:C604($blob)
TEXT TO BLOB:C554($key_t; $blob; UTF8 text without length:K22:17)

$isValid_boo:=(setup_license_type($blob)#"demo")

$0:=$isValid_boo

_callstack_pop