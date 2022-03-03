//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: helper_TimestampGet
// Syntax: helper_TimestampGet({$date_d{; $time}}) -> text
// Created by: Mark Schaake
// Date created: 06/18/09, 18:14:53
//
// Description:
//  Returns the timestamp that works in a filename.
// 
// Returns: 
C_TEXT:C284($0; $timestamp_t)
// Required Parameters: --none--
// Optional Parameters: 
C_DATE:C307($1; $date_d)
C_TIME:C306($2; $time)
// Other Variables:
C_TEXT:C284($date_t; $time_t)
ARRAY LONGINT:C221($pos_al; 0)
ARRAY LONGINT:C221($len_al; 0)
// 
//***********************************************************************

If (Count parameters:C259>=1)
	$date_d:=$1
Else 
	$date_d:=Current date:C33
End if 
If (Count parameters:C259>=2)
	$time:=$2
Else 
	$time:=Current time:C178
End if 

$date_t:=String:C10($date_d; ISO date:K1:8)
$date_t:=Replace string:C233(Substring:C12($date_t; 1; 10); "-"; "")

$time_t:=String:C10($time; ISO time:K7:8)
$time_t:=Replace string:C233(Substring:C12($time_t; 12; 8); ":"; "")

$timestamp_t:=$date_t+"-"+$time_t

$0:=$timestamp_t