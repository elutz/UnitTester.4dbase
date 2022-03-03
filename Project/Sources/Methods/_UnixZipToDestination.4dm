//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/09/09, 22:16:12
// ----------------------------------------------------
// Method: _UnixZipToDestination
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $destinationDir_t)  //Where the zip file will be saved
C_TEXT:C284(${2})  //Path(s) to the files / folder to be zipped. If more than one, all must be in same directory

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$destinationDir_t:=helper_UnixPathGet($1)

C_TEXT:C284($script_t)
C_BLOB:C604($blob)
C_TEXT:C284($path_t; $source_t)

$path_t:=Get 4D folder:C485(Current resources folder:K5:16; *)+"_temp.sh"\


If (Test path name:C476($path_t)=Is a document:K24:1)
	DELETE DOCUMENT:C159($path_t)
End if 

$script_t:="#!/bin/sh"\
+Char:C90(Line feed:K15:40)
$script_t:=$script_t+"cd "\
+helper_UnixPathGet(helper_ParentDirectory($2))+Char:C90(Line feed:K15:40)
$script_t:=$script_t+"zip -r "\
+helper_DocumentName($1)

C_LONGINT:C283($i)
C_TEXT:C284($param_t)
$i:=0
For ($i; 2; Count parameters:C259)
	//If this is a folder, need to take off the directory symbol if it exists
	$param_t:=${$i}
	If ($param_t[[Length:C16($param_t)]]=Folder separator:K24:12)
		$param_t:=Delete string:C232($param_t; Length:C16($param_t); 1)
	End if 
	$script_t:=$script_t+" "\
		+helper_DocumentName($param_t)
	
End for 

$script_t:=$script_t+Char:C90(Line feed:K15:40)

$script_t:=$script_t+"mv -f "\
+helper_DocumentName($1)+" "\
+$destinationDir_t

C_BLOB:C604($blob)
TEXT TO BLOB:C554($script_t; $blob)
BLOB TO DOCUMENT:C526($path_t; $blob)

LAUNCH EXTERNAL PROCESS:C811("chmod 755 "\
+helper_UnixPathGet($path_t))
LAUNCH EXTERNAL PROCESS:C811(helper_UnixPathGet($path_t))
DELETE DOCUMENT:C159($path_t)