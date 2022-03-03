//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:38:49
// ----------------------------------------------------
// Method: helper_OffloadToDaemon
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $daemon_t; $2; vMethod_t; $3; $callback_t)
C_POINTER:C301(${4})  //parameters

//OPTIONAL PARAMETERS

// ----------------------------------------------------
_callstack_push(Current method name:C684)

C_LONGINT:C283(vMethodId_l)
C_TEXT:C284(vParams_t)

$daemon_t:=$1

If ($daemon_t="")
	$daemon_t:=helper_ProcessName(Current process:C322)
End if 

vMethod_t:=$2
vMethodId_l:=Tickcount:C458

If (Count parameters:C259>=3)
	$callback_t:=$3
Else 
	$callback_t:=""
End if 

ARRAY TEXT:C222(atParams; 0)
vParams_t:=""

C_LONGINT:C283($i)
$i:=0
For ($i; 4; Count parameters:C259)
	
	If ($i>4)
		vParams_t:=vParams_t+";"
	End if 
	
	vParams_t:=vParams_t+helper_PointerToStringForExecut(${$i})
	
End for 

APPEND TO ARRAY:C911(atDaemonNameStack; $daemon_t)
APPEND TO ARRAY:C911(atDaemonCallbackStack; $callback_t)
APPEND TO ARRAY:C911(alDaemonIdStack; vMethodId_l)

//check to see if daemon dispatcher is already running

If (Not:C34(helper_ProcessExists(0; $daemon_t+"Dispatcher"+String:C10(Current process:C322))))
	$process_l:=New process:C317("helper_StartDispatcher"; 0; $daemon_t+"Dispatcher"+String:C10(Current process:C322); $daemon_t; Current process:C322; vMethod_t; vParams_t; vMethodId_l)
Else 
	$process_l:=Process number:C372($daemon_t+"Dispatcher"+String:C10(Current process:C322))
	
	While (helper_DispatcherIsExecuting($daemon_t))
		DELAY PROCESS:C323(Current process:C322; 5)
	End while 
	
	VARIABLE TO VARIABLE:C635($process_l; vAddParam_t; vParams_t; vAddMethodId_l; vMethodId_l; vAddMethod_t; vMethod_t)
	
End if 

OBJECT SET VISIBLE:C603(*; "prog_@"; True:C214)

_callstack_pop