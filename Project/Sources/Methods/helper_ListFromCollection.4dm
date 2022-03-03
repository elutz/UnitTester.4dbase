//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Lutz.Epperlein
// Date and time: 27.09.21, 16:13:30
// ----------------------------------------------------
// Method: helper_ListFromCollection
// Description
// Converts a collection to a her. list
//
// Parameters
// ----------------------------------------------------
#DECLARE($listRef : Integer; $list : Collection; $itemRef : Object)

_callstack_push(Current method name:C684)

If ($itemRef.ref=Null:C1517)
	$itemRef.ref:=1
End if 

For each ($item; $list)
	
	$sublist:=New list:C375
	
	helper_ListAppend($listRef; $item.text; $itemRef.ref; $sublist)
	For each ($param; $item.params)
		SET LIST ITEM PARAMETER:C986($listRef; $itemRef.ref; $param; $item.params[$param])
	End for each 
	$itemRef.ref:=$itemRef.ref+1
	
	If ($item.list#Null:C1517)
		helper_ListFromCollection($sublist; $item.list; $itemRef)
	End if 
	
End for each 

_callstack_pop