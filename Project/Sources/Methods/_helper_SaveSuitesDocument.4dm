//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 11:00:59
// ----------------------------------------------------
// Method: Test_Unit_SaveSuitesDocument
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

//UNIT SETUP

C_TEXT:C284($tempDirectory_t; $tempFilePath_t)
C_LONGINT:C283($tempList_l)

$tempDirectory_t:=Get 4D folder:C485(Current resources folder:K5:16)+"testdirectory"+Folder separator:K24:12
$tempFilePath_t:=$tempDirectory_t+"testfile"\

$tempList_l:=New list:C375

Unit_BeginTest("Creates directory if doesn't exist"\
; Current method name:C684)
Unit_FalseAssert(Test path name:C476($tempDirectory_t)=Is a folder:K24:2; "Directory "\
+$tempDirectory_t+" already exists"\
)
helper_SuitesListToDocument($tempFilePath_t; ->$tempList_l)
Unit_TrueAssert(Test path name:C476($tempDirectory_t)=Is a folder:K24:2; "Directory "\
+$tempDirectory_t+" not created"\
)


Unit_BeginTest("Creates file if doesn't exist"\
; Current method name:C684)
Unit_TrueAssert(Test path name:C476($tempFilePath_t)=Is a document:K24:1; "Document "\
+$tempDirectory_t+" not created"\
)

//UNIT TEAR DOWN
DELETE DOCUMENT:C159($tempFilePath_t)
DELETE FOLDER:C693($tempDirectory_t)
CLEAR LIST:C377($tempList_l)