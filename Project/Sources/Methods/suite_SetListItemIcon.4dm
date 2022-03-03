//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/01/08, 08:27:52
// ----------------------------------------------------
// Method: suite_SetListItemIcon
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $list_l)

//OPTIONAL PARAMETERS
C_LONGINT:C283($2; $ref_l)

// ----------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1

If (Count parameters:C259>=2)
	$ref_l:=$2
Else 
	$ref_l:=0  //last item added, pass -1 for currently selected item
End if 

C_TEXT:C284($type_t)
C_PICTURE:C286($pic)

$type_t:=suite_GetListItemType($list_l; $ref_l)

Case of 
	: ($type_t="suite")
		$pic:=helper_GetResourceImage("suite_16.png")
		
	: ($type_t="unit")
		
		//logger_info (Current method name+" "+helper_ListItemTextByRefGet ($list_l;$ref_l))
		//logger_info (Current method name+" method_doesNotExist ="+String(method_doesExist (helper_ListItemTextByRefGet ($list_l;$ref_l))))
		
		If (method_doesExist(helper_ListItemTextByRefGet($list_l; $ref_l)))
			$pic:=helper_GetResourceImage("source_16.png")
		Else 
			$pic:=helper_GetResourceImage("unknown_16.png")
		End if 
		
End case 

helper_SetListItemIcon($list_l; $ref_l; ->$pic)

_callstack_pop