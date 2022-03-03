//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/14/09, 07:56:34
//--------------------------------------------------------------------------------
// Method: helper_Type4dDataTypesGet
// Populates an array of data types in 4D style.
// Same as compiler command name, just without the 
// leading C_... So, C_DATE becomes DATE.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_POINTER:C301($1; $dataTypes_atp)

//Optional Parameters
C_POINTER:C301($2; $dataTypeIds_alp)

//--------------------------------------------------------------------------------

$dataTypes_atp:=$1
If (Count parameters:C259>=2)
	$dataTypeIds_alp:=$2
	helper_ArrayClear(->$dataTypeIds_alp)
Else 
	ARRAY LONGINT:C221($ids_al; 0)
	$dataTypeIds_alp:=->$ids_al
End if 

helper_ArrayClear($dataTypes_atp)

APPEND TO ARRAY:C911($dataTypeIds_alp->; Is text:K8:3)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is boolean:K8:9)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is date:K8:7)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is longint:K8:6)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is real:K8:4)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is time:K8:8)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is picture:K8:10)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is pointer:K8:14)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is BLOB:K8:12)
APPEND TO ARRAY:C911($dataTypeIds_alp->; Is integer:K8:5)

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Size of array:C274($dataTypeIds_alp->))
	APPEND TO ARRAY:C911($dataTypes_atp->; helper_Type4dName($dataTypeIds_alp->{$i}))
End for 

MULTI SORT ARRAY:C718($dataTypes_atp->; >; $dataTypeIds_alp->)