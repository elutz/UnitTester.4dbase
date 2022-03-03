//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:06:34
// ----------------------------------------------------
// Method: helper_BuildPathSet
// Description
// Depreciated, should use helper_PrefsSet("build_path";->$path) instead
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $build_path_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$build_path_t:=$1

If (Test path name:C476($build_path_t)=Is a document:K24:1)
	
	prefs_SetById("build_path"; $build_path_t)
	
	//helper_TextToDocument ($build_path_t;helper_BuildPathLinkPath )
	
End if 