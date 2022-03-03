//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/24/09, 11:09:09
// ----------------------------------------------------
// Method: helper_DirectoryDeleteRecursive
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $folderPath_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------
$folderPath_t:=$1

//Make sure directory sybol is last character
If ($folderPath_t[[Length:C16($folderPath_t)]]#Folder separator:K24:12)
	$folderPath_t:=$folderPath_t+Folder separator:K24:12
End if 

If (Test path name:C476($folderPath_t)=Is a folder:K24:2)
	
	ARRAY TEXT:C222($folders_at; 0)
	ARRAY TEXT:C222($documents_at; 0)
	
	FOLDER LIST:C473($folderPath_t; $folders_at)
	DOCUMENT LIST:C474($folderPath_t; $documents_at)
	
	C_LONGINT:C283($i)
	$i:=0
	For ($i; 1; Size of array:C274($documents_at))
		DELETE DOCUMENT:C159($folderPath_t+$documents_at{$i})
	End for 
	
	$i:=0
	For ($i; 1; Size of array:C274($folders_at))
		helper_DirectoryDeleteRecursive($folderPath_t+$folders_at{$i})
	End for 
	
	DELETE FOLDER:C693($folderPath_t)
	
End if 