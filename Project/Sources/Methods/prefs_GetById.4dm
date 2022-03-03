//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/05/09, 14:45:35
// ----------------------------------------------------
// Method: helper_PrefsGet
// Description
// 
//
// ----------------------------------------------------
//
//RETURN VALUE

//REQUIRED PARAMETERS
C_TEXT:C284($1; $id_t)
C_POINTER:C301($2; $pref_p)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$id_t:=$1
$pref_p:=$2

C_TEXT:C284($ref_t; $itemRef_t)
$ref_t:=prefs_ParsePreferencesFile
$itemRef_t:=DOM Get first child XML element:C723($ref_t)

If (OK=1)  //found a child
	
	$itemRef_t:=DOM Find XML element by ID:C1010($itemRef_t; $id_t)
	
	If (OK=1)
		DOM GET XML ELEMENT VALUE:C731($itemRef_t; $pref_p->)
	Else 
		$pref_p->:=helper_DefaultValue($pref_p)->
	End if 
	
Else 
	$pref_p->:=helper_DefaultValue($pref_p)->
End if 

DOM CLOSE XML:C722($ref_t)