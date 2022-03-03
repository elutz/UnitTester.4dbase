//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: runner_eh_build_btn
// Syntax: runner_eh_build_btn($event_l)
// Created by: Mark Schaake
// Date created: 07/24/09, 09:35:47
//
// Description:
//  Handles events for the build button.
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
	: ($event_l=On Clicked:K2:4)
		C_TEXT:C284($build_path_t)
		$build_path_t:=helper_BuildPathGet
		
		If (Test path name:C476($build_path_t)=Is a document:K24:1)
			OBJECT SET VISIBLE:C603(*; "complete_@"; False:C215)  //completion graphic - Pass or Fail?
			helper_ThermoBarbershopStart("Building...")
			helper_OffloadToDaemon("build"; "helper_BuildApplication"; "helper_BuildApplicationCallback"; ->$build_path_t)
		Else 
			
			$build_path_t:=helper_BuildPathSelect
			
			If ($build_path_t#"")
				OBJECT SET VISIBLE:C603(*; "complete_@"; False:C215)  //completion graphic - Pass or Fail?
				helper_ThermoBarbershopStart("Building...")
				helper_OffloadToDaemon("build"; "helper_BuildApplication"; "helper_BuildApplicationCallback"; ->$build_path_t)
			End if 
			
		End if 
End case 

_callstack_pop