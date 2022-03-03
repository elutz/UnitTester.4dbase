//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: prefs_eh_form_method
// Syntax: prefs_eh_form_method($event_l)
// Created by: Mark Schaake
// Date created: 08/04/09, 15:20:27
//
// Description:
//  Handles $event_ls for the preferences form
// 
// Returns: --nothing--
// Required Parameters: 
C_LONGINT:C283($1; $event_l)
// Optional Parameters: --none--
// Other Variables:
C_LONGINT:C283(kACCEPT_l; kCANCEL_l)
// 
//***********************************************************************

$event_l:=$1

//custom events
kACCEPT_l:=-10
kCANCEL_l:=-11

Case of 
	: ($event_l=On Load:K2:1)
		C_TEXT:C284(build_app_path_t; post_build_method_t)
		C_TEXT:C284(test_method_prefix_t)
		C_TEXT:C284(sc_feedback_by; sc_feedback_email)
		C_TEXT:C284(log_directory_path_t)
		C_TEXT:C284(wrapper_prefix; wrapper_prefix_old)
		C_LONGINT:C283(log_keep_last_l)
		
		If (True:C214)  //General prefs
			prefs_GetById("feedback_by"; ->sc_feedback_by)
			prefs_GetById("feedback_email"; ->sc_feedback_email)
			ckbx_hide_passes:=prefs_GetForCheckbox("hide_passes")
			ckbx_check_updates:=prefs_GetForCheckbox("check_for_updates")
			ckbx_error_handler_cancel:=prefs_GetForCheckbox("error_handler_cancel")
		End if 
		
		If (True:C214)  //Method Creator prefs
			ARRAY TEXT:C222(code_style_datatype; 0)
			ARRAY TEXT:C222(code_style_prefix; 0)
			ARRAY TEXT:C222(code_style_suffix; 0)
			ARRAY LONGINT:C221(code_style_datatype_id; 0)
			ARRAY TEXT:C222(home_folders_at; 0)
			
			prefs_GetById("test_method_prefix"; ->test_method_prefix_t)
			ckbx_default_createtest:=prefs_GetForCheckbox("create_test_default")
			ckbx_default_strictconventions:=prefs_GetForCheckbox("conventions_strict")
			helper_Type4dDataTypesGet(->code_style_datatype; ->code_style_datatype_id)
			
			C_LONGINT:C283($i)
			$i:=0
			For ($i; 1; Size of array:C274(code_style_datatype))
				APPEND TO ARRAY:C911(code_style_prefix; conv_TypePrefixGet(code_style_datatype_id{$i}))
				APPEND TO ARRAY:C911(code_style_suffix; conv_TypeSuffixGet(code_style_datatype_id{$i}))
			End for 
			
			method_HomeFolderArrayLoad(->home_folders_at)
			
			//Default properties
			ckbx_def_prop_invisible:=prefs_GetForCheckbox("method_prop_invisible")
			ckbx_def_prop_4daction:=prefs_GetForCheckbox("method_prop_4daction")
			ckbx_def_prop_soap:=prefs_GetForCheckbox("method_prop_soap")
			ckbx_def_prop_wsdl:=prefs_GetForCheckbox("method_prop_wsdl")
			ckbx_def_prop_shared:=prefs_GetForCheckbox("method_prop_shared")
			ckbx_def_prop_sql:=prefs_GetForCheckbox("method_prop_sql")
			ckbx_def_prop_server:=prefs_GetForCheckbox("method_prop_server")
			
		End if 
		
		If (True:C214)  //Build prefs
			build_app_path_t:=helper_BuildPathGet
			prefs_GetById("post_build_method"; ->post_build_method_t)
			ckbx_build_auto:=prefs_GetForCheckbox("post_build_auto")
		End if 
		
		If (True:C214)  //Log Files prefs
			prefs_GetById("log_directory"; ->log_directory_path_t)
			prefs_GetById("log_keep_last"; ->log_keep_last_l)
			ckbx_log_generate:=prefs_GetForCheckbox("logs_generate")
		End if 
		
		If (True:C214)  //Wrapper prefs
			prefs_GetById("wrapper_prefix"; ->wrapper_prefix)
			prefs_GetById("wrapper_prefix_old"; ->wrapper_prefix_old)
		End if 
		
	: ($event_l=kACCEPT_l)
		
		If (True:C214)  //General prefs
			prefs_SetById("feedback_by"; sc_feedback_by; "feedback_email"; sc_feedback_email)
			prefs_SetById("hide_passes"; prefs_CheckboxToString(ckbx_hide_passes); "check_for_updates"; prefs_CheckboxToString(ckbx_check_updates); "error_handler_cancel"; prefs_CheckboxToString(ckbx_error_handler_cancel))
		End if 
		
		If (True:C214)  //Method Creator prefs
			prefs_SetById("test_method_prefix"; test_method_prefix_t; "create_test_default"; prefs_CheckboxToString(ckbx_default_createtest); "conventions_strict"; prefs_CheckboxToString(ckbx_default_strictconventions))
			prefs_SetById("method_prop_invisible"; prefs_CheckboxToString(ckbx_def_prop_invisible); "method_prop_4daction"; prefs_CheckboxToString(ckbx_def_prop_4daction); "method_prop_soap"; prefs_CheckboxToString(ckbx_def_prop_soap); "method_prop_wsdl"; prefs_CheckboxToString(ckbx_def_prop_wsdl); "method_prop_shared"; prefs_CheckboxToString(ckbx_def_prop_shared); "method_prop_sql"; prefs_CheckboxToString(ckbx_def_prop_sql))
			prefs_SetById("method_prop_server"; prefs_CheckboxToString(ckbx_def_prop_server))
			
			//coding preferences
			C_LONGINT:C283($i)
			$i:=0
			For ($i; 1; Size of array:C274(code_style_datatype_id))
				conv_TypePrefixSet(code_style_datatype_id{$i}; code_style_prefix{$i})
				conv_TypeSuffixSet(code_style_datatype_id{$i}; code_style_suffix{$i})
			End for 
			
			method_HomeFolderArraySave(->home_folders_at)
		End if 
		
		
		If (True:C214)  //Build prefs
			prefs_SetById("build_path"; build_app_path_t; "post_build_method"; post_build_method_t; "post_build_auto"; prefs_CheckboxToString(ckbx_build_auto))
		End if 
		
		If (True:C214)  //Log prefs
			prefs_SetById("log_directory"; log_directory_path_t; "log_keep_last"; String:C10(log_keep_last_l))
			prefs_LogGenerateSet(ckbx_log_generate=1)
		End if 
		
		If (True:C214)  //Wrapper prefs
			C_TEXT:C284($prefix_t)
			prefs_GetById("wrapper_prefix"; ->$prefix_t)
			If (wrapper_prefix#$prefix_t)
				prefs_SetById("wrapper_prefix"; wrapper_prefix)
				prefs_SetById("wrapper_prefix_old"; $prefix_t)
			End if 
		End if 
		
		ACCEPT:C269
		
	: ($event_l=kCANCEL_l)
		CANCEL:C270
		
End case 

_callstack_pop