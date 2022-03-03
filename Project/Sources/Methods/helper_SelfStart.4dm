//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 21:34:42
// ----------------------------------------------------
// Method: helper_SelfStart
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_TEXT:C284($1; $2; $methodName; $newProcName; $currentProcName)
C_BOOLEAN:C305($0; $go)
C_LONGINT:C283($procState; $procTime)

$methodName:=$1
$newProcName:=$2

PROCESS PROPERTIES:C336(Current process:C322; $currentProcName; $procState; $procTime)

If ($newProcName#$currentProcName)  // This is not in its own process
	$processID:=New process:C317($methodName; 0; $newProcName)
	$go:=False:C215
	
Else 
	$go:=True:C214
	
End if 

$0:=$go