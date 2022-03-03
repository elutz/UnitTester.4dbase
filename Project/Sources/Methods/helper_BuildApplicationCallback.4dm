//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/21/08, 12:20:40
// ----------------------------------------------------
// Method: helper_BuildApplicationCallback
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_TEXT:C284($postBuildMethod_t)

prefs_GetById("post_build_method"; ->$postBuildMethod_t)

If ($postBuildMethod_t#"")
	EXECUTE METHOD:C1007($postBuildMethod_t)
End if 

helper_ThermoBarbershopStop
helper_QuitDaemon("build")