//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/22/09, 08:42:53
// ----------------------------------------------------
// Method: helper_PrefHidePassesGet
// Description
// 
//
// ----------------------------------------------------
//
//RETURN VALUE
C_BOOLEAN:C305($0)

//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------
C_TEXT:C284($hide_t)
prefs_GetById("hide_passes"; ->$hide_t)

$0:=($hide_t="true")