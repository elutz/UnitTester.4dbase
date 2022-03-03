//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Lutz.Epperlein
// Date and time: 27.09.21, 15:27:29
// ----------------------------------------------------
// Method: helper_ListGetExpandedStatus
// Description
// Collect the current status of expanded or not expanded items
//
// Parameters
// ----------------------------------------------------
#DECLARE($listRef : Integer)->$expandedStatus : Collection

_callstack_push(Current method name:C684)

$expanded:=New collection:C1472()
$count:=Count list items:C380($listRef)
For ($i; 1; $count)
	GET LIST ITEM:C378($listRef; $i; $ref; $text; $sublistRef; $isExpanded)
	
	$item:=New object:C1471()
	$item.ref:=$ref
	$item.text:=$text
	$item.sublist:=$sublistRef
	$item.expanded:=$isExpanded
	$expanded.push($item)
	
End for 

$expandedStatus:=$expanded

_callstack_pop