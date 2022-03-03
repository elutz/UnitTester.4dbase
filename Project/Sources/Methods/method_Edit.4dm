//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: method_Edit
// Syntax: method_Edit($method_t)
// Created by: Mark Schaake
// Date created: 05/14/10, 10:59:10
//
// Description:
//  Opens a method in the method editor.
// 
// Returns: --nothing--
// Required Parameters: 
C_TEXT:C284($1; $method_t)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$method_t:=$1


C_TEXT:C284($methodPath)
If (method_doesExist($method_t))
	$methodPath:=METHOD Get path:C1164(Path project method:K72:1; $method_t)
	METHOD OPEN PATH:C1213($methodPath; *)
Else 
	ALERT:C41("The method "+$method_t+" doesn't exist. Could not open the method.")
End if 

//  //make a call to a plugin here
//ARRAY TEXT($plugins_at;0)
//ARRAY LONGINT($plugins_al;0)
//PLUGIN LIST($plugins_al;$plugins_at)

//Case of 
//: (Find in array($plugins_at;"API Pack")>0)

//If (API Open Method Editor($method_t;0)=0)
//ALERT("The method "+$method_t+" doesn't exist. Could not open the method.")
//End if 

//Else 
//ALERT("To allow UnitTester to open methods in the method editor, Rob Laveaux's free API Pack plugin is required.\rIt can be downloaded at http://www.pluggers.nl/api_pack.html")
//End case 

_callstack_pop