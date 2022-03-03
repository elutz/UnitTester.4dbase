//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:43:00
// ----------------------------------------------------
// Method: helper_StartDispatcher
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $daemon_t)
C_LONGINT:C283($2; $guiProcess_l)
C_TEXT:C284($3; vAddMethod_t; $4; vAddParam_t)
C_LONGINT:C283($5; vAddMethodId_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

_callstack_push(Current method name:C684)

$daemon_t:=$1
$guiProcess_l:=$2
vAddMethod_t:=$3
vAddParam_t:=$4
vAddMethodId_l:=$5

C_LONGINT:C283($daemonProcess_l; $idleTime_l)

$idleTime_l:=0

ARRAY TEXT:C222(atDispatchMethodStack; 0)
ARRAY TEXT:C222(atDispatchParamsStack; 0)
ARRAY LONGINT:C221(alDispatchMethodIdStack; 0)

While (helper_ProcessExists($guiProcess_l)) & ($idleTime_l<(60*60))
	
	If (vAddMethod_t#"") & (vAddMethodId_l#0)
		
		If (Not:C34(helper_ProcessExists(0; $daemon_t+"Daemon"+String:C10($guiProcess_l))))
			
			$daemonProcess_l:=New process:C317("helper_StartDaemon"; 0; $daemon_t+"Daemon"+String:C10($guiProcess_l); $guiProcess_l; vAddMethod_t; vAddMethodId_l; vAddParam_t)
			
		Else 
			
			$daemonProcess_l:=Process number:C372($daemon_t+"Daemon"+String:C10($guiProcess_l))
			
			APPEND TO ARRAY:C911(atDispatchMethodStack; vAddMethod_t)
			APPEND TO ARRAY:C911(atDispatchParamsStack; vAddParam_t)
			APPEND TO ARRAY:C911(alDispatchMethodIdStack; vAddMethodId_l)
			
		End if 
		
		If (vAddMethod_t="dmn_quit")
			$idleTime_l:=60*60+1
		End if 
		
		vAddMethod_t:=""
		vAddParam_t:=""
		vAddMethodId_l:=0
		
	End if 
	
	If (helper_DaemonIsExecuting($daemon_t))
		//Skip and try again on next pass
	Else 
		
		//remove from stack according to FIFO
		
		If (Size of array:C274(atDispatchMethodStack)>0)
			
			VARIABLE TO VARIABLE:C635($daemonProcess_l; vParams_t; atDispatchParamsStack{1}; vMethodId_l; alDispatchMethodIdStack{1}; vMethod_t; atDispatchMethodStack{1})
			
			DELETE FROM ARRAY:C228(atDispatchParamsStack; 1)
			DELETE FROM ARRAY:C228(atDispatchMethodStack; 1)
			DELETE FROM ARRAY:C228(alDispatchMethodIdStack; 1)
			
		End if 
		
	End if 
	
	DELAY PROCESS:C323(Current process:C322; 1)
	$idleTime_l:=$idleTime_l+1
	
End while 

_callstack_pop