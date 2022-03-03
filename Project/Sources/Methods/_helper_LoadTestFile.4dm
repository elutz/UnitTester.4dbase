//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 11:39:44
// ----------------------------------------------------
// Method: Test_helper_LoadTestFile
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

//SETUP UNIT
C_TEXT:C284($tempDirectory_t; $tempFilePath_t)
C_LONGINT:C283($tempList_l)

$tempDirectory_t:=Get 4D folder:C485(Current resources folder:K5:16)+"testdirectory"+Folder separator:K24:12
$tempFilePath_t:=$tempDirectory_t+"testfile.json"
$tempList_l:=New list:C375

C_LONGINT:C283($ref)
APPEND TO LIST:C376($tempList_l; "Temp Item"; $ref)

If (Unit_BeginTest("Creates directory if doesn't exist"; Current method name:C684))
	Unit_FalseAssert(Test path name:C476($tempDirectory_t)=Is a folder:K24:2; "Directory "+$tempDirectory_t+" already exists")
	helper_TestFileToListLoad($tempFilePath_t; ->$tempList_l)
	Unit_TrueAssert(Test path name:C476($tempDirectory_t)=Is a folder:K24:2; "Directory "+$tempDirectory_t+" not created")
End if 

If (Unit_BeginTest("Creates file if doesn't exist"; Current method name:C684))
	Unit_TrueAssert(Test path name:C476($tempFilePath_t)=Is a document:K24:1; "Document "+$tempDirectory_t+" not created")
End if 

If (Unit_BeginTest("Contains item that was saved"; Current method name:C684))
	Unit_NumericEqualAssert(1; Count list items:C380($tempList_l))
	Unit_TextEqualAssert("Temp Item"; helper_ListItemTextByPosGet($tempList_l; 1))
End if 

//TEAR DOWN UNIT
DELETE DOCUMENT:C159($tempFilePath_t)
DELETE FOLDER:C693($tempDirectory_t)
CLEAR LIST:C377($tempList_l)