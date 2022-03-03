//%attributes = {"invisible":true,"executedOnServer":true}


// User name (OS): Mark Schaake
// Date and time: 05/12/09, 21:53:13
//--------------------------------------------------------------------------------
// Method: helper_TestFilePathGet
// 
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($0)

//Required Parameters
// -- NONE --

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$0:=paths_TestsResourceFolderGet+"unittester.json"

_callstack_pop  //keep this at the end of the method