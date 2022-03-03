//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 10:47:38
// ----------------------------------------------------
// Method: helper_GetResourceImage
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $picFileName_t)
C_PICTURE:C286($0; $pic)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$picFileName_t:=$1

READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+$picFileName_t; $pic)

$0:=$pic