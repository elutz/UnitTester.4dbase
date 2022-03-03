//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 07:42:14
//--------------------------------------------------------------------------------
// Method: helper_PrefCreateTestDefaultGet
// Returns the boolean value of the preference for default
// creating a test case method when creating a project
// method via the Method Creator.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_BOOLEAN:C305($0)

//Required Parameters
// -- NONE --

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
C_TEXT:C284($default_t)
prefs_GetById("create_test_default"; ->$default_t)

$0:=($default_t="true")