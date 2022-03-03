//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: helper_TimestampDifferenceGet
// Syntax: helper_TimestampDifferenceGet($timestamp1_t; $timestamp2_t) -> time
// Created by: Mark Schaake
// Date created: 06/20/09, 08:41:48
//
// Description:
//  Returns the difference between two timestamps as
//  a time value. Difference is calculated by subtracting
//  the first timestamp from the second
// 
// Returns: 
C_TIME:C306($0; $difference_time)
// Required Parameters: 
C_TEXT:C284($1; $timestamp1_t)
C_TEXT:C284($2; $timestamp2_t)
// Optional Parameters: --none--
// Other Variables:
C_LONGINT:C283($days_l; $hours_l; $minutes_l; $seconds_l)
// 
//***********************************************************************

$timestamp1_t:=$1
$timestamp2_t:=$2

$days_l:=Num:C11(Substring:C12($timestamp2_t; 1; 8))-Num:C11(Substring:C12($timestamp1_t; 1; 8))
$hours_l:=Num:C11(Substring:C12($timestamp2_t; 10; 2))-Num:C11(Substring:C12($timestamp1_t; 10; 2))
$minutes_l:=Num:C11(Substring:C12($timestamp2_t; 12; 2))-Num:C11(Substring:C12($timestamp1_t; 12; 2))
$seconds_l:=Num:C11(Substring:C12($timestamp2_t; 14; 2))-Num:C11(Substring:C12($timestamp1_t; 14; 2))

If ($days_l#0)
	$hours_l:=$hours_l+(24*$days_l)
End if 

$difference_time:=Time:C179(String:C10($hours_l)+":"+String:C10($minutes_l)+":"+String:C10($seconds_l))

$0:=$difference_time

_callstack_pop