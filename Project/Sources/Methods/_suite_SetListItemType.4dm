//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 15:12:45
// ----------------------------------------------------
// Method: Test_suit_SetListItemType
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

//SETUP UNIT
C_LONGINT:C283($tempList_l; $itemRef_l)
$tempList_l:=New list:C375

Unit_BeginTest("Sets type to 'suite'"; Current method name:C684)
$itemRef_l:=helper_ListAppend($tempList_l; "Suite Item")
suite_SetListItemType($tempList_l; "suite")
Unit_TextEqualAssert("suite"; suite_GetListItemType($tempList_l))

//TEAR DOWN
CLEAR LIST:C377($tempList_l)