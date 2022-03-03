//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/04/09, 15:39:30
//--------------------------------------------------------------------------------
// Method: suite_PositionInList
// Returns: the position of a suite item in the tests list.
// Throws: item name not a suite
//--------------------------------------------------------------------------------
//
//Return Value
C_LONGINT:C283($0; $pos_l)

//Required Parameters
C_LONGINT:C283($1; $list_l)
C_TEXT:C284($2; $suite_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$list_l:=$1
$suite_t:=$2

If (_E_Try)
	
	$pos_l:=helper_ListFindIn($list_l; $suite_t)
	
	If ($pos_l>0)
		//make sure this is a suite
		C_TEXT:C284($type_t)
		$type_t:=suite_GetListItemType($list_l; helper_ListItemRefByPositionGet($list_l; $pos_l))
		
		If ($type_t#"suite")
			_E_Throw("got test when expected suite item"; $suite_t+" is not a suite, but exists in the list")
			$pos_l:=0
		End if 
		
	End if 
	
End if 

$0:=$pos_l

_callstack_pop  //keep this at the end of the method