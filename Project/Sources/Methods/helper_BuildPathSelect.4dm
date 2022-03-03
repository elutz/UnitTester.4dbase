//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:40:06
// ----------------------------------------------------
// Method: helper_BuildPathSelect
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $buildPath_t)

//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_TEXT:C284($doc_t; $startPath_t)
ARRAY TEXT:C222($selected_at; 0)

$startPath_t:=Get 4D folder:C485(Database folder:K5:14; *)+"Preferences"+Folder separator:K24:12+"BuildApp"+Folder separator:K24:12

If (Test path name:C476($startPath_t)#Is a folder:K24:2)
	$startPath_t:=Get 4D folder:C485(Database folder:K5:14; *)
End if 

$doc_t:=Select document:C905($startPath_t; ".xml"; "Select build project"; Package open:K24:8; $selected_at)

If (OK=1)
	$buildPath_t:=$selected_at{1}
	helper_BuildPathSet($selected_at{1})
Else 
	$buildPath_t:=""
End if 

$0:=$buildPath_t

