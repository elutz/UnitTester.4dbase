//%attributes = {"invisible":true}
//UNIT TEST SETUP UNIT
C_TEXT:C284($text_t; $path_t)
$text_t:="Mark"
$path_t:=Get 4D folder:C485(Current resources folder:K5:16; *)+"temp"

If (Test path name:C476($path_t)=Is a document:K24:1)
	DELETE DOCUMENT:C159($path_t)
End if 

If (Unit_BeginTest("Text to document"; Current method name:C684))
	helper_TextToDocument("Mark"; $path_t)
	Unit_TrueAssert(Test path name:C476($path_t)=Is a document:K24:1; "Document not created")
End if 

If (Unit_BeginTest("Document to text"; Current method name:C684))
	$text_t:=helper_DocumentToText($path_t)
	Unit_TextEqualAssert("Mark"; $text_t)
End if 

//TEAR DOWN UNIT
If (Test path name:C476($path_t)=Is a document:K24:1)
	DELETE DOCUMENT:C159($path_t)
End if 