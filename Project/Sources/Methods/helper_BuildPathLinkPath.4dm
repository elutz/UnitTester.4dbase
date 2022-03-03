//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:24:01
// ----------------------------------------------------
// Method: helper_BuildPathLinkPath
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $linkPath_t)

//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

$linkPath_t:=Get 4D folder:C485(Current resources folder:K5:16; *)+"tests"+Folder separator:K24:12+"buildpath"

$0:=$linkPath_t