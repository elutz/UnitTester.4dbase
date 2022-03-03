//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 10:56:01
// ----------------------------------------------------
// Method: helper_SaveSuitesToDocument
// Description
// Optional parameters should only be passed for unit testing this method
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS
C_TEXT:C284($1; $path_t; $directory_t)
C_POINTER:C301($2; $list_p)

// ----------------------------------------------------
_callstack_push(Current method name:C684)

If (Count parameters:C259>=1)
	$path_t:=$1
Else 
	$path_t:=paths_TestFileGet
End if 

If (Count parameters:C259>=2)
	$list_p:=$2
Else 
	$list_p:=->hl_TestSuites
End if 

C_BLOB:C604($blob)

If (Is a list:C621($list_p->))
	
	
	// Merken was expanded ist
	$expanded:=helper_ListGetExpandedStatus($list_p->)
	
	// Alles expanden
	helper_ListExpand($list_p->; True:C214)
	
	var $itemPos : Object
	$itemPos:=New object:C1471()
	$list:=helper_ListToCollection($list_p->; $itemPos)
	
	// Expanded-Status wiederherstellen
	helper_ListSetExpandedStatus($list_p->; $expanded)
	
	$parentDir_t:=helper_ParentDirectory($path_t)
	If (Test path name:C476($parentDir_t)#Is a folder:K24:2)
		CREATE FOLDER:C475($parentDir_t)
	End if 
	
	// Neu, als JSON
	TEXT TO DOCUMENT:C1237($path_t; JSON Stringify:C1217($list; *))
	
	// ALt, binär
	//LIST TO BLOB($list_p->; $blob)
	//server_blob_to_document($blob; $path_t)
End if 

_callstack_pop