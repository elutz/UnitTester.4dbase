//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Lutz.Epperlein
// Date and time: 17.09.21, 18:20:57
// ----------------------------------------------------
// Method: helper_ListItemToObject
// Description
// Exportiert einen Eintrag einer hier. List zu einem Object
//
// Parameters
// ----------------------------------------------------
#DECLARE($listRef : Integer; $itemPos : Integer; $item_props : Object)->$listItem : Object

_callstack_push(Current method name:C684)

GET LIST ITEM:C378($listRef; $itemPos; $ref; $text; $sublistRef; $isExpanded)
$item:=New object:C1471()
$item.text:=$text

$item_props.sublistRef:=$sublistRef
$item_props.ref:=$ref
$item_props.text:=$text
$item_props.expanded:=$isExpanded
//$item.props:=$item_props

ARRAY TEXT:C222($names; 0)
ARRAY TEXT:C222($values; 0)
GET LIST ITEM PARAMETER ARRAYS:C1195($listRef; $ref; $names; $values)
$params:=New object:C1471()
For ($param; 1; Size of array:C274($names))
	$params[$names{$param}]:=$values{$param}
End for 
$item.params:=$params

$listItem:=$item

_callstack_pop