//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: method_eh_prop_soap
// Syntax: method_eh_prop_soap($event_l)
// Created by: Mark Schaake
// Date created: 07/10/09, 14:16:30
//
// Description:
//  Handles on load and on clicked events for the soap property checkbox.
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $event_l)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$event_l:=$1


Case of 
	: ($event_l=On Load:K2:1)
		
		
	: ($event_l=On Clicked:K2:4)
		
		
End case 

If (ckbx_prop_soap=0)
	ckbx_prop_wsdl:=0
	OBJECT SET ENABLED:C1123(ckbx_prop_wsdl; False:C215)
Else 
	OBJECT SET ENABLED:C1123(ckbx_prop_wsdl; True:C214)
End if 

_callstack_pop