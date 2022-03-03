//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 16:44:15
// ----------------------------------------------------
// Method: suite_AddUnitTestCase
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS
C_TEXT:C284($1; $methodName_t)
C_LONGINT:C283($2; $selectedItemPos_l)
C_LONGINT:C283($3; $list_l; hl_TestSuites)
C_LONGINT:C283($4; $returnType_l)
C_TEXT:C284($5; $resultVarName_t)
C_POINTER:C301($6; $paramNames_atp; $7; $paramTypes_alp)
C_TEXT:C284($8; $syntax_t)
// ----------------------------------------------------
_callstack_push(Current method name:C684)

C_TEXT:C284($prefix_t)
$prefix_t:=conv_TestCaseMethodPrefixGet

If (Count parameters:C259>=1)
	$methodName_t:=$1
Else 
	$methodName_t:=$prefix_t
End if 

If (Count parameters:C259>=2)
	$selectedItemPos_l:=$2
Else 
	$selectedItemPos_l:=Selected list items:C379(hl_TestSuites)
End if 

If (Count parameters:C259>=3)
	$list_l:=$3
Else 
	$list_l:=hl_TestSuites
End if 

If (Count parameters:C259>=5)
	$returnType_l:=$4
	$resultVarName_t:=$5
End if 

If (Count parameters:C259>=7)
	$paramNames_atp:=$6
	$paramTypes_alp:=$7
End if 

If (Count parameters:C259>=8)
	$syntax_t:=$8
End if 

C_LONGINT:C283($parentList_l)

If ($selectedItemPos_l>0)  //must at least be within a test suite, cannot be top level
	
	C_LONGINT:C283($selectedRef_l; $sublist_l; $parentRef_l)
	C_TEXT:C284($text_t)
	
	$selectedRef_l:=helper_ListItemRefByPositionGet($list_l; $selectedItemPos_l)
	
	If (suite_GetListItemType($list_l; $selectedRef_l)="suite")  //add as child
		
		$parentRef_l:=$selectedRef_l
		GET LIST ITEM:C378($list_l; $selectedItemPos_l; $selectedRef_l; $text_t; $sublist_l)
		
		//Need to create a new list if this is a suite and no sublist currently exists
		If ($sublist_l=0)
			$sublist_l:=New list:C375
			SET LIST ITEM:C385($list_l; $selectedRef_l; $text_t; $selectedRef_l; $sublist_l; True:C214)
		End if 
		
	Else   //add as sibling instead of child
		$parentRef_l:=List item parent:C633($list_l; $selectedRef_l)
		GET LIST ITEM:C378($list_l; List item position:C629($list_l; $parentRef_l); $selectedRef_l; $text_t; $sublist_l)
		
	End if 
	
	C_LONGINT:C283($newItemRef_l)
	
	If ($methodName_t="")
		$methodName_t:="_"
	End if 
	If ($prefix_t="")
		$prefix_t:="_"
	End if 
	
	If (Not:C34(method_doesExist($methodName_t))) | ($methodName_t=$prefix_t)
		
		If (Is compiled mode:C492(*))
			ALERT:C41("You cannot create methods in compiled mode")
		Else 
			
			If ($methodName_t#$prefix_t)  //& ($list_l=hl_TestSuites)
				method_CreateTestCase($methodName_t; $parentRef_l; False:C215; $list_l; $returnType_l; $resultVarName_t; $paramNames_atp; $paramTypes_alp; $syntax_t)
			End if 
			
			If (server_is_running)
				client_request_test_case_add(->$newItemRef_l; $methodName_t; $parentRef_l)
				$newItemRef_l:=helper_ListAppend($sublist_l; $methodName_t; $newItemRef_l)
				suite_SetListItemType($sublist_l; "unit"; $newItemRef_l)
			Else 
				$newItemRef_l:=helper_ListAppend($sublist_l; $methodName_t; helper_ListItemRefGreatestGet($list_l)+1)
				suite_SetListItemType($sublist_l; "unit"; $newItemRef_l)
				helper_SuitesListToDocument(paths_TestFileGet; ->$list_l)
				helper_TestFileToListLoad
			End if 
			
			If ($list_l=hl_TestSuites)
				SELECT LIST ITEMS BY POSITION:C381($list_l; List item position:C629($list_l; $newItemRef_l))
				
				If ($methodName_t=$prefix_t)
					EDIT ITEM:C870(hl_TestSuites; List item position:C629(hl_TestSuites; $newItemRef_l))
				End if 
				
			End if 
			
		End if 
		
	Else 
		
		If (server_is_running)
			client_request_test_case_add(->$newItemRef_l; $methodName_t; $parentRef_l)
			$newItemRef_l:=helper_ListAppend($sublist_l; $methodName_t; $newItemRef_l)
			suite_SetListItemType($sublist_l; "unit"; $newItemRef_l)
		Else 
			$newItemRef_l:=helper_ListAppend($sublist_l; $methodName_t; helper_ListItemRefGreatestGet($list_l)+1)
			suite_SetListItemType($sublist_l; "unit"; $newItemRef_l)
			helper_SuitesListToDocument
		End if 
		
	End if 
	
End if 

_callstack_pop