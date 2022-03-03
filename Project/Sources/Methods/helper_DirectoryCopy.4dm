//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 22:56:12
// ----------------------------------------------------
// Method: helper_CopyFolder
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $sourcePath_t; $2; $destPath_t)

//OPTIONAL PARAMETERS
C_BOOLEAN:C305($3; $replaceAll_b)


// ----------------------------------------------------
_callstack_push(Current method name:C684)

$sourcePath_t:=$1
$destPath_t:=$2
If (Count parameters:C259>=3)
	$replaceAll_b:=$3
Else 
	$replaceAll_b:=False:C215
End if 

//Make sure directory sybol is last character
If ($sourcePath_t[[Length:C16($sourcePath_t)]]#Folder separator:K24:12)
	$sourcePath_t:=$sourcePath_t+Folder separator:K24:12
End if 

If ($destPath_t[[Length:C16($destPath_t)]]#Folder separator:K24:12)
	$destPath_t:=$destPath_t+Folder separator:K24:12
End if 

If (Test path name:C476($sourcePath_t)=Is a folder:K24:2)
	
	If (Test path name:C476($destPath_t)#Is a folder:K24:2)
		
		CREATE FOLDER:C475($destPath_t)
		
	Else 
		
		If ($replaceAll_b)
			helper_DirectoryDeleteRecursive($destPath_t)
			CREATE FOLDER:C475($destPath_t)
		End if 
		
	End if 
	
	ARRAY TEXT:C222($documents_at; 0)
	ARRAY TEXT:C222($folders_at; 0)
	
	DOCUMENT LIST:C474($sourcePath_t; $documents_at)
	FOLDER LIST:C473($sourcePath_t; $folders_at)
	
	C_LONGINT:C283($i)
	$i:=0
	For ($i; 1; Size of array:C274($documents_at))
		COPY DOCUMENT:C541($sourcePath_t+$documents_at{$i}; $destPath_t+$documents_at{$i})
	End for 
	
	C_LONGINT:C283($i)
	$i:=0
	For ($i; 1; Size of array:C274($folders_at))
		helper_DirectoryCopy($sourcePath_t+$folders_at{$i}+Folder separator:K24:12; $destPath_t+$folders_at{$i}+Folder separator:K24:12; $replaceAll_b)
	End for 
	
End if 

_callstack_pop