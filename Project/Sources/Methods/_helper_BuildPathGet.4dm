//%attributes = {"invisible":true}
//UNIT TEST SETUP UNIT

C_TEXT:C284($unit_link_path_t; $origBuildPath_t; $buildPath_t; $tempDoc_t)
$unit_link_path_t:=helper_BuildPathLinkPath

If (Test path name:C476($unit_link_path_t)=Is a document:K24:1)
	$origBuildPath_t:=helper_DocumentToText($unit_link_path_t)
	DELETE DOCUMENT:C159($unit_link_path_t)
End if 

$tempDoc_t:=Get 4D folder:C485(Current resources folder:K5:16)+"tempfile"

If (Test path name:C476($tempDoc_t)#Is a document:K24:1)
	helper_TextToDocument($tempDoc_t; $tempDoc_t)
End if 

Unit_BeginTest("Doesn't exist returns empty"; Current method name:C684)
$buildPath_t:=helper_BuildPathGet
Unit_TextEqualAssert(""; $buildPath_t)

Unit_BeginTest("Exist returns path"; Current method name:C684)
helper_BuildPathSet($tempDoc_t)
$buildPath_t:=helper_BuildPathGet
Unit_TextEqualAssert($tempDoc_t; $buildPath_t)


//TEAR DOWN UNIT
If ($origBuildPath_t="")
	If (Test path name:C476($unit_link_path_t)=Is a document:K24:1)
		DELETE DOCUMENT:C159($unit_link_path_t)
	End if 
Else 
	helper_BuildPathSet($origBuildPath_t)
End if 

If (Test path name:C476($tempDoc_t)=Is a document:K24:1)
	DELETE DOCUMENT:C159($tempDoc_t)
End if 