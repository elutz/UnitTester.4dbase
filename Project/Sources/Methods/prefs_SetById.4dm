//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 14:35:40
// ----------------------------------------------------
// Method: helper_PrefsSet
// Description
// 
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; ${2})  //id - value pairs of preferences

//OPTIONAL PARAMETERS


// ----------------------------------------------------

If (Count parameters:C259>0) & (Count parameters:C259%2=0)
	
	C_TEXT:C284($ref_t; $firstChild_t; $itemRef_t)
	C_BOOLEAN:C305($childrenExist_boo)
	
	$ref_t:=prefs_ParsePreferencesFile
	$firstChild_t:=DOM Get first child XML element:C723($ref_t)
	
	$childrenExist_boo:=(OK=1)
	
	C_LONGINT:C283($i)
	$i:=0
	For ($i; 1; Count parameters:C259; 2)
		
		If ($childrenExist_boo)
			
			$itemRef_t:=DOM Find XML element by ID:C1010($firstChild_t; ${$i})
			
			If (OK=0)
				$itemRef_t:=DOM Create XML element:C865($ref_t; "/Preferences/Item"; "id"; ${$i})
			End if 
			
		Else 
			$itemRef_t:=DOM Create XML element:C865($ref_t; "/Preferences/Item"; "id"; ${$i})
		End if 
		
		DOM SET XML ELEMENT VALUE:C868($itemRef_t; ${$i+1})
		
	End for 
	
	prefs_Save($ref_t)
	
End if 