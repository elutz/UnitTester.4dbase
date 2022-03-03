//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 17:37:09
// ----------------------------------------------------
// Method: helper_PathToUnix
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $unix_t)

//REQUIRED PARAMETERS
C_TEXT:C284($1; $path_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------


$path_t:=$1

$unix_t:=Replace string:C233($path_t; Folder separator:K24:12; "/")+"\""

While ($unix_t[[1]]#"/")
	$unix_t:=Delete string:C232($unix_t; 1; 1)
End while 

$0:="\""+$unix_t