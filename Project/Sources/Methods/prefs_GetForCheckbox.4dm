//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: prefs_GetForCheckbox
// Syntax: prefs_GetForCheckbox($prefName_t) -> longint
// Created by: Mark Schaake
// Date created: 07/04/09, 14:07:10
//
// Description:
//  Returns 1 for true, 0 for false.
// 
// Returns: 
C_LONGINT:C283($0; $intVal_l)
// Required Parameters: 
C_TEXT:C284($1; $prefName_t)
// Optional Parameters: --none--
// Other Variables:
C_TEXT:C284($textVal_t)
// 
//***********************************************************************

$prefName_t:=$1

prefs_GetById($prefName_t; ->$textVal_t)

$intVal_l:=Choose:C955(Lowercase:C14($textVal_t)="true"; 1; 0)

$0:=$intVal_l

_callstack_pop