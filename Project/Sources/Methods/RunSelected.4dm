//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 23:14:04
// ----------------------------------------------------
// Method: RunSelected
// Description:
// Runs the selected group of tests.
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

ARRAY LONGINT:C221($items_al; 0)
suite_GetSelectedItems(hl_TestSuites; ->$items_al)
RunTests(hl_TestSuites; ->$items_al)