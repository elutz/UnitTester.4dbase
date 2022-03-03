//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/12/09, 21:46:18
//--------------------------------------------------------------------------------
// Method: Unit_TestCaseMethodCreate
// Creates a test case method programmatically. Does not require
// UnitTester to be running.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_TEXT:C284($1; $suite_t)
C_TEXT:C284($2; $methodName_t)

//Optional Parameters
C_LONGINT:C283($3; $returnType_l)
C_TEXT:C284($4; $returnVarName_t)
C_POINTER:C301($5; $paramNames_atp; $6; $paramTypes_alp)
C_TEXT:C284($7; $syntax_t)

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$suite_t:=$1
$methodName_t:=$2

If (Count parameters:C259>=4)
	$returnType_l:=$3
	$returnVarName_t:=$4
Else 
	$returnType_l:=-1
End if 

If (Count parameters:C259>=6)
	$paramNames_atp:=$5
	$paramTypes_alp:=$6
End if 

If (Count parameters:C259>=7)
	$syntax_t:=$7
End if 

C_LONGINT:C283($hList_l)
C_TEXT:C284($itemType_t)
C_LONGINT:C283($ref)
ARRAY LONGINT:C221($items_al; 0)
C_LONGINT:C283($suitePos_l)
C_BOOLEAN:C305(<>ReloadList_boo)

$hList_l:=New list:C375

helper_TestFileToListLoad(paths_TestFileGet; ->$hList_l)

helper_ListExpand($hList_l; True:C214)

//Does the suite exist somewhere in the hlist?
$ref:=Find in list:C952($hList_l; $suite_t; 1; $items_al; *)

If ($ref=0)
	$suitePos_l:=suite_AddTestSuite($suite_t; $hList_l)
	$ref:=helper_ListItemRefByPositionGet($hList_l; $suitePos_l)
Else 
	$suitePos_l:=List item position:C629($hList_l; $ref)
End if 

//is it a suite?
If (suite_ListItemTypeIsSuite($hList_l; $ref))
	suite_AddTestCase($methodName_t; $suitePos_l; $hList_l; $returnType_l; $returnVarName_t; $paramNames_atp; $paramTypes_alp; $syntax_t)
	//Fixes bug #28 / #29 - removed a call to helper_SuitesListToDocument
	<>ReloadList_boo:=True:C214
	POST OUTSIDE CALL:C329(Process number:C372("UnitTester"))
End if 

CLEAR LIST:C377($hList_l)

_callstack_pop  //keep this at the end of the method