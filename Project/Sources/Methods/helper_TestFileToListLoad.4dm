//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 11:37:35
// ----------------------------------------------------
// Method: helper_LoadTestFile
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS
C_TEXT:C284($1; $filePath_t)
C_POINTER:C301($2; $list_p)

// ----------------------------------------------------
_callstack_push(Current method name:C684)

C_LONGINT:C283($ref_l)
C_TEXT:C284($type_t)

If (Count parameters:C259>=1)
	$filePath_t:=$1
Else 
	//Path to the tests file, if it exists, should be /Resources/unit_tester/unittester
	$filePath_t:=paths_TestFileGet
End if 

If (Count parameters:C259>=2)
	$list_p:=$2
Else 
	$list_p:=->hl_TestSuites
End if 

// voresrt keine Server-Unterstützung
If (server_is_running) & (Current process:C322#server_request_procssor_process)
	C_BLOB:C604($blob)
	$blob:=client_server_blob_get
	$list_p->:=BLOB to list:C557($blob)
Else 
	
	// temporary
	// ALtes binäres File lesen
	// file extension entfernen
	var $pathparts : Collection
	$pathparts:=Split string:C1554($filePath_t; ".")
	$pathparts.pop()
	$filePathbin_t:=$pathparts.join(".")
	If (Test path name:C476($filePathbin_t)=Is a document:K24:1)
		DOCUMENT TO BLOB:C525($filePathbin_t; $blob)
		$list_p->:=BLOB to list:C557($blob)
		
	Else 
		// Neu: JSON lesen
		
		If (Test path name:C476($filePath_t)#Is a document:K24:1)
			helper_SuitesListToDocument($filePath_t; $list_p)
		End if 
		
		var $list : Collection
		$json:=Document to text:C1236($filePath_t)
		$list:=JSON Parse:C1218($json)
		
		$list_p->:=New list:C375
		
		var $itemRef : Object
		$itemRef:=New object:C1471()
		helper_ListFromCollection($list_p->; $list; $itemRef)
		
/* If (False)
$itemRef:=1
For each ($item; $list)
		
If ($item.list#Null)
		
$sublist:=New list
		
helper_ListAppend($list_p->; $item.text; $itemRef; $sublist)
For each ($param; $item.params)
SET LIST ITEM PARAMETER($list_p->; $itemRef; $param; $item.params[$param])
End for each 
$itemRef:=$itemRef+1
		
For each ($subitem; $item.list)
		
$itemRefSub:=helper_ListAppend($sublist; $subitem.text; $itemRef)
For each ($param; $subitem.params)
SET LIST ITEM PARAMETER($sublist; $itemRefSub; $param; $subitem.params[$param])
End for each 
		
$itemRef:=$itemRef+1
		
End for each 
		
Else 
// TODO sollte es nicht geben
$itemRef:=helper_ListAppend($list_p->; $item.text)
		
End if 
		
End for each 
		
End if */
	End if 
	
End if 

SORT LIST:C391($list_p->; >)

helper_ListExpand($list_p->; True:C214)

C_LONGINT:C283($i; $ref_l)
For ($i; 1; Count list items:C380($list_p->; *))
	
	$ref_l:=helper_ListItemRefByPositionGet($list_p->; $i)
	$type_t:=suite_GetListItemType($list_p->; $ref_l)
	suite_SetListItemType($list_p->; $type_t; $ref_l)
	
End for 

helper_ListExpand($list_p->; False:C215)

_callstack_pop