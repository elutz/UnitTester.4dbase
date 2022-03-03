//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:38:08
// ----------------------------------------------------
// Method: helper_DaemonIsExecuting
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($daemon_t; $1)
C_BOOLEAN:C305($0)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_TEXT:C284($method_t)

$daemon_t:=$1

If (helper_ProcessExists(0; $daemon_t+"Daemon"+String:C10(Current process:C322)))
	
	$process_l:=Process number:C372($daemon_t+"Daemon"+String:C10(Current process:C322))
	GET PROCESS VARIABLE:C371($process_l; vMethod_t; $method_t)
	
	$0:=($method_t#"")
	
Else 
	
	$0:=False:C215
	
End if 