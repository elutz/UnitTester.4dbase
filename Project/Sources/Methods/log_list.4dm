//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: log_list
// Syntax: log_list($logPath_t; $list_l; $level_l)
// Created by: Mark Schaake
// Date created: 06/18/09, 16:55:35
//
// Description:
//  Recursively logs a list to the test log file passed.
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $logPath_t)
C_LONGINT:C283($2; $list_l)
// Optional Parameters:
C_LONGINT:C283($3; $level_l)
// Other Variables:
C_LONGINT:C283($copy_l; $itemRef_l; $sublist_l)
C_TIME:C306($docRef_tm)
// 
//***********************************************************************

$logPath_t:=$1
$list_l:=$2
If (Count parameters:C259>=3)
	$level_l:=$3
Else 
	$level_l:=0
End if 

$copy_l:=Copy list:C626($list_l)
helper_ListExpand($copy_l; False:C215)

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Count list items:C380($copy_l))
	
	$docRef_tm:=Append document:C265($logPath_t)
	$itemRef_l:=helper_ListItemRefByPositionGet($copy_l; $i)
	SEND PACKET:C103($docRef_tm; Char:C90(Carriage return:K15:38)+("  "*($level_l))+helper_ListItemTextByRefGet($copy_l; $itemRef_l))
	CLOSE DOCUMENT:C267($docRef_tm)
	
	$sublist_l:=helper_ListItemSublistGet($copy_l; $itemRef_l)
	If ($sublist_l>0)
		log_list($logPath_t; $sublist_l; $level_l+1)
	End if 
	
End for 

_callstack_pop