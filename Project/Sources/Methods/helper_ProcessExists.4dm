//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:34:52
// ----------------------------------------------------
// Method: helper_ProcessExists
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $process_l)

//OPTIONAL PARAMETERS
C_TEXT:C284($2; $processName_t)

// ----------------------------------------------------

C_LONGINT:C283($time_l)

$process_l:=$1

If (Count parameters:C259>=2)
	$processName_t:=$2
Else 
	$processName_t:=""
End if 

//Process name always takes priority over number

If ($processName_t#"")
	PROCESS PROPERTIES:C336(Process number:C372($processName_t); $processName_t; $state_l; $time_l)
Else 
	PROCESS PROPERTIES:C336($process_l; $processName_t; $state_l; $time_l)
End if 

$0:=($state_l>=0)