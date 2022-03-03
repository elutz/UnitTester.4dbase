//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: method_eh_form_method
// Syntax: method_eh_form_method($event_l)
// Created by: Mark Schaake
// Date created: 07/10/09, 14:14:04
//
// Description:
//  From event handler for the method creator form.
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
		C_TEXT:C284(method_name_t; folder_t; description_t; returnvar_t)
		C_LONGINT:C283(method_length_l; ckbx_create_test)
		ARRAY TEXT:C222(cbTestSuite; 0)
		ARRAY TEXT:C222(cbReturnType; 0)
		ARRAY TEXT:C222(cbHomeFolder; 0)
		
		method_name_t:=""
		method_length_l:=31
		folder_t:=""
		description_t:=""
		returnvar_t:=""
		
		method_HomeFolderArrayLoad(->cbHomeFolder)
		cbHomeFolder{0}:=""
		
		ckbx_create_test:=Choose:C955(prefs_CreateTestDefaultGet; 1; 0)
		helper_SuitesArrayGet(->cbTestSuite)
		helper_Type4dDataTypesGet(->cbReturnType)
		cbReturnType{0}:=""
		cbTestSuite{0}:=""
		
		If (True:C214)  //Parameters listbox arrays
			ARRAY TEXT:C222(params_varnames; 10)
			ARRAY TEXT:C222(params_types; 10)
			ARRAY BOOLEAN:C223(params_isoptional; 10)
			C_LONGINT:C283($i)
			$i:=0
			For ($i; 1; 10)
				params_varnames{$i}:=""
				params_types{$i}:=""
				params_isoptional{$i}:=False:C215
			End for 
		End if 
		
		If (True:C214)  //naming conventions - load process arrays to minimize disk reads
			ARRAY TEXT:C222(conv_types_at; 0)
			ARRAY LONGINT:C221(conv_typeids_al; 0)
			ARRAY TEXT:C222(conv_prefixes_at; 0)
			ARRAY TEXT:C222(conv_suffixes_at; 0)
			conv_ConventionArraysLoad(->conv_types_at; ->conv_typeids_al; ->conv_prefixes_at; ->conv_suffixes_at)
			//Coding conventions strict?
			OBJECT SET ENTERABLE:C238(params_types; Not:C34(prefs_ConventionsStrictGet))
			If (prefs_ConventionsStrictGet)
				OBJECT SET ENABLED:C1123(cbReturnType; False:C215)
			Else 
				OBJECT SET ENABLED:C1123(cbReturnType; True:C214)
			End if 
		End if 
		
		If (True:C214)  //Default method properties
			//Default properties
			ckbx_prop_invisible:=prefs_GetForCheckbox("method_prop_invisible")
			ckbx_prop_4daction:=prefs_GetForCheckbox("method_prop_4daction")
			ckbx_prop_soap:=prefs_GetForCheckbox("method_prop_soap")
			ckbx_prop_wsdl:=prefs_GetForCheckbox("method_prop_wsdl")
			ckbx_prop_shared:=prefs_GetForCheckbox("method_prop_shared")
			ckbx_prop_sql:=prefs_GetForCheckbox("method_prop_sql")
			//ckbx_prop_server:=prefs_GetForCheckbox ("method_prop_server")
			
		End if 
		
		//establish event handlers
		method_eh_prop_soap(Form event code:C388)
		LISTBOX SELECT ROW:C912(*; "params_listbox"; 0; lk remove from selection:K53:3)
		EDIT ITEM:C870(method_name_t)
		
End case 

_callstack_pop