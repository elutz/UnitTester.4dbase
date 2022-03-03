//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 11:20:35
// ----------------------------------------------------
// Method: helper_DirectoryOfDocument
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $path_t; $0; $directoryPath_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------
_callstack_push(Current method name:C684)

$path_t:=$1

C_TEXT:C284($fileName_t)

If ($path_t[[Length:C16($path_t)]]=Folder separator:K24:12)
	
	$directoryPath_t:=$path_t
	
	Repeat 
		$directoryPath_t:=Delete string:C232($directoryPath_t; Length:C16($directoryPath_t); 1)
	Until (Substring:C12($directoryPath_t; Length:C16($directoryPath_t); 1)=Folder separator:K24:12) | (Length:C16($directoryPath_t)=0)
	
Else 
	
	C_LONGINT:C283($docPathLength_l; $nameLength_l)
	$docPathLength_l:=Length:C16($path_t)
	
	$fileName_t:=helper_DocumentName($path_t)
	$nameLength_l:=Length:C16($fileName_t)
	
	$directoryPath_t:=Delete string:C232($path_t; ($docPathLength_l-$nameLength_l)+1; $nameLength_l)
	
End if 

$0:=$directoryPath_t

_callstack_pop