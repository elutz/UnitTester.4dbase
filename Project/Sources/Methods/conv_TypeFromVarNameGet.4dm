//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 12:39:51
//--------------------------------------------------------------------------------
// Method: conv_TypeFromVarNameGet
// Returns the data type name after matching based
// on the user's preferences. Considers suffixes and prefixes.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_TEXT:C284($0; $dataType_t)

//Required Parameters
C_TEXT:C284($1; $varName_t)

//Optional Parameters
C_POINTER:C301($2; $names_atp; $3; $ids_alp; $4; $prefixes_atp; $5; $suffixes_atp)

//--------------------------------------------------------------------------------

_callstack_push(Current method name:C684)

ARRAY TEXT:C222($names_at; 0)
ARRAY LONGINT:C221($ids_al; 0)
ARRAY TEXT:C222($prefixes_at; 0)
ARRAY TEXT:C222($suffixes_at; 0)
ARRAY BOOLEAN:C223($hasSuffix_ab; 0)
ARRAY BOOLEAN:C223($hasPrefix_ab; 0)
C_BOOLEAN:C305($matchFound_boo)

$varName_t:=$1

If (Count parameters:C259>=5)
	$names_atp:=$2
	$ids_alp:=$3
	$prefixes_atp:=$4
	$suffixes_atp:=$5
	COPY ARRAY:C226($names_atp->; $names_at)
	COPY ARRAY:C226($ids_alp->; $ids_al)
	COPY ARRAY:C226($prefixes_atp->; $prefixes_at)
	COPY ARRAY:C226($suffixes_atp->; $suffixes_at)
Else 
	conv_ConventionArraysLoad(->$names_at; ->$ids_al; ->$prefixes_at; ->$suffixes_at)
End if 

$matchFound_boo:=False:C215

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Size of array:C274($names_at))
	APPEND TO ARRAY:C911($hasSuffix_ab; $suffixes_at{$i}#"")
	APPEND TO ARRAY:C911($hasPrefix_ab; $prefixes_at{$i}#"")
End for 

//prefixes take precedence over suffixes
$i:=0
For ($i; 1; Size of array:C274($prefixes_at))
	If ($hasPrefix_ab{$i}) & Not:C34($matchFound_boo)
		
		//do we have a match?
		If (Match regex:C1019("\\$?"+$prefixes_at{$i}+".*"; $varName_t))
			$matchFound_boo:=True:C214
			$dataType_t:=$names_at{$i}
		End if 
		
	End if 
End for 

//need to match suffixes
$i:=0
For ($i; 1; Size of array:C274($suffixes_at))
	If ($hasSuffix_ab{$i}) & Not:C34($matchFound_boo)
		
		//do we have a match?
		If (Match regex:C1019(".*"+$suffixes_at{$i}; $varName_t))
			$matchFound_boo:=True:C214
			$dataType_t:=$names_at{$i}
		End if 
		
	End if 
End for 

$0:=$dataType_t

_callstack_pop