//%attributes = {"invisible":true,"executedOnServer":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 14:30:18
// ----------------------------------------------------
// Method: helper_PrefsPathGet
// Description
// 
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $path_t)

//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------
$path_t:=paths_TestsResourceFolderGet+"preferences.xml"

$0:=$path_t