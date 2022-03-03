//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:15:22
// ----------------------------------------------------
// Method: helper_ProcessName
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $procNumber_l)
C_TEXT:C284($name_t; $0)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_LONGINT:C283($procState; $procTime)

$procNumber_l:=$1

PROCESS PROPERTIES:C336($procNumber_l; $name_t; $procState; $procTime)

$0:=$name_t