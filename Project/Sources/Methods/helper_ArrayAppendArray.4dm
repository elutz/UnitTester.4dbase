//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/18/08, 16:37:13
// ----------------------------------------------------
// Method: helper_AppendArrayToArray
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_POINTER:C301($1; $arrayToAppend_p)
C_POINTER:C301($2; $arrayToBeAppened_p)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$arrayToAppend_p:=$1
$arrayToBeAppened_p:=$2

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Size of array:C274($arrayToAppend_p->))
	APPEND TO ARRAY:C911($arrayToBeAppened_p->; $arrayToAppend_p->{$i})
End for 