//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:06:18
// ----------------------------------------------------
// Method: helper_BuildPathGet
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $build_path_t)

//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_TEXT:C284($unit_link_path_t)
prefs_GetById("build_path"; ->$build_path_t)

If ($build_path_t="")  //legacy
	$unit_link_path_t:=helper_BuildPathLinkPath
	
	If (Test path name:C476($unit_link_path_t)=Is a document:K24:1)
		$build_path_t:=helper_DocumentToText($unit_link_path_t)
		prefs_SetById("build_path"; $build_path_t)
	Else 
		$build_path_t:=""
	End if 
	
End if 

$0:=$build_path_t