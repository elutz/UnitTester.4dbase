//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:37:38
// ----------------------------------------------------
// Method: helper_GetDaemonProcess
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $daemon_t)
C_LONGINT:C283($0)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$daemon_t:=$1+"Daemon"+String:C10(Current process:C322)

$0:=Process number:C372($daemon_t)