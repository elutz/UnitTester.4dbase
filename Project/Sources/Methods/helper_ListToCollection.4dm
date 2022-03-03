//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Lutz.Epperlein
// Date and time: 27.09.21, 15:39:16
// ----------------------------------------------------
// Method: help_ListToCollection
// Description
// Converts Her. list to a collection
//
// Parameters
// ----------------------------------------------------
#DECLARE($listRef : Integer; $itemPos : Object)->$listReturn : Collection

_callstack_push(Current method name:C684)

If ($itemPos.pos=Null:C1517)
	$itemPos.pos:=1
End if 

var $item : Object
var $list : Collection
$list:=New collection:C1472()

$count:=Count list items:C380($listRef; *)
For ($i; 1; $count)
	
	$props:=New object:C1471()
	$item:=helper_ListItemToObject($listRef; $i; $props)
	
	If (Is a list:C621($props.sublistRef))
		
		$item.list:=helper_ListToCollection($props.sublistRef; $itemPos)
		$i:=$i+$itemPos.pos
		
	End if 
	
	$list.push($item)
	
End for 

$itemPos.pos:=$i-1

$listReturn:=$list

_callstack_pop