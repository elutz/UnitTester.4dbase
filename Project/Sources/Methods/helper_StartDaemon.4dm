//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:41:09
// ----------------------------------------------------
// Method: helper_StartDaemon
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $guiProcess_l)
C_TEXT:C284($2; vMethod_t)
C_LONGINT:C283($3; vMethodId_l)
C_TEXT:C284($4; vParams_t)

//Other variablse:
C_BOOLEAN:C305($handleErrors_b; $componentMode_b)
C_LONGINT:C283(vCompletedDaemonId_l; vIdleTime_l)
C_LONGINT:C283($i)

// ----------------------------------------------------

_callstack_push(Current method name:C684)

$guiProcess_l:=$1
vMethod_t:=$2
vMethodId_l:=$3
vParams_t:=$4

vCompletedDaemonId_l:=0
vIdleTime_l:=0
$handleErrors_b:=Choose:C955(prefs_GetForCheckbox("error_handler_cancel")=1; False:C215; True:C214)
$componentMode_b:=ComponentMode

While (helper_ProcessExists($guiProcess_l)) & (vIdleTime_l<(60*60))
	
	If (vMethod_t#"")
		
		Case of 
			: (vMethod_t="dmn_quit")
				
				vIdleTime_l:=60*60+1  //force daemon to quit
				
			Else 
				
				ARRAY TEXT:C222($params_at; 0)
				helper_ParameterStringParse(vParams_t; ->$params_at)
				
				$i:=0
				For ($i; 1; Size of array:C274($params_at))
					
					If ($i=1)
						vMethod_t:=vMethod_t+"("+$params_at{$i}
					Else 
						vMethod_t:=vMethod_t+";"+$params_at{$i}
					End if 
					
					If ($i=Size of array:C274($params_at))
						vMethod_t:=vMethod_t+")"
					End if 
					
				End for 
				
				//Need to catch error if method isn't shared
				
				If ($handleErrors_b)
					If ($componentMode_b)
						EXECUTE METHOD:C1007("_unit_error_handler"; *; "setup")
					Else 
						EXECUTE METHOD:C1007("c_unit_error_handler"; *; "setup")
					End if 
				End if 
				
				EXECUTE FORMULA:C63(vMethod_t)
				vIdleTime_l:=0
				
				If ($handleErrors_b)
					If ($componentMode_b)
						EXECUTE METHOD:C1007("_unit_error_handler"; *; "teardown")
					Else 
						EXECUTE METHOD:C1007("c_unit_error_handler"; *; "teardown")
					End if 
				End if 
				
		End case 
		
		SET PROCESS VARIABLE:C370($guiProcess_l; vCompletedDaemonId_l; vMethodId_l)
		POST OUTSIDE CALL:C329($guiProcess_l)
		
		vMethod_t:=""
		
	End if 
	
	DELAY PROCESS:C323(Current process:C322; 1)
	vIdleTime_l:=vIdleTime_l+1
	
End while 

_callstack_pop