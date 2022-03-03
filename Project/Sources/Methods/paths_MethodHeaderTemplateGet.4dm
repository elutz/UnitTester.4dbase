//%attributes = {"invisible":true,"executedOnServer":true}
C_TEXT:C284($0; $path_t)
C_BOOLEAN:C305($1; $forceCustom_b; $2; $forceDefault_b)
// Optional Parameters: --none''
//***********************************************************************

If (Count parameters:C259>=1)
	$forceCustom_b:=$1
Else 
	$forceCustom_b:=False:C215
End if 

If (Count parameters:C259>=2)
	$forceDefault_b:=$2
Else 
	$forceDefault_b:=False:C215
End if 

If ($forceDefault_b)
	$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"MethodHeaderTemplate.txt"
Else 
	
	//First, try to use a user-defined template (if it exists)
	$path_t:=paths_TestsResourceFolderGet+"MethodHeaderTemplate.txt"
	
	//Otherwise, use the default template provided in the UnitTester:Resources folder
	If (Test path name:C476($path_t)#Is a document:K24:1) & (Not:C34($forceCustom_b))
		$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"MethodHeaderTemplate.txt"
	End if 
	
End if 

$0:=$path_t