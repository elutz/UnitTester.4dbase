//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:13:15
// ----------------------------------------------------
// Method: helper_DaemonController
// Description:
// This method should be placed in a form method from which
// worker processes will be launched. Basically, this method
// manages a queuee of methods to be processed in the worker
// process and executes any callbacks. Turn on the form's
// On load and On outside call events. Then, put this method in 
// form method like so:
//
// helper_DaemonController(Form event=On load)
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS
C_BOOLEAN:C305($1; $init_boo)  //Pass this parameter to initialize variables.

// ----------------------------------------------------
_callstack_push(Current method name:C684)

If (Count parameters:C259>=1)
	$init_boo:=$1
Else 
	$init_boo:=False:C215
End if 

If ($init_boo)
	
	C_LONGINT:C283(vCompletedDaemonId_l)
	
	ARRAY TEXT:C222(atDaemonNameStack; 0)
	ARRAY TEXT:C222(atDaemonCallbackStack; 0)
	ARRAY LONGINT:C221(alDaemonIdStack; 0)
	
	ARRAY LONGINT:C221(alCompletedDaemonIds; 0)
	
	vCompletedDaemonId_l:=0
	
End if 

If (vCompletedDaemonId_l#0)
	
	APPEND TO ARRAY:C911(alCompletedDaemonIds; vCompletedDaemonId_l)
	
	C_LONGINT:C283($i)
	C_LONGINT:C283($pos)
	
	$i:=0
	For ($i; 1; Size of array:C274(alCompletedDaemonIds))
		
		$pos:=Find in array:C230(alDaemonIdStack; vCompletedDaemonId_l)
		
		If ($pos>0)
			
			//Execute the callback method (if there is one)
			If (atDaemonCallbackStack{$pos}#"")
				EXECUTE FORMULA:C63(atDaemonCallbackStack{$pos})
			End if 
			
			DELETE FROM ARRAY:C228(atDaemonNameStack; $pos)
			DELETE FROM ARRAY:C228(atDaemonCallbackStack; $pos)
			DELETE FROM ARRAY:C228(alDaemonIdStack; $pos)
			
		End if 
		
	End for 
	
	//Clear the completed daemon ids
	ARRAY LONGINT:C221(alCompletedDaemonIds; 0)
	
	OBJECT SET VISIBLE:C603(*; "prog_@"; False:C215)
	
End if 

_callstack_pop