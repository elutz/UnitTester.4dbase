//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/25/08, 13:06:59
// ----------------------------------------------------
// Method: helper_RegExMatchAllOccurrances
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_BOOLEAN:C305($0; $match_boo)

//REQUIRED PARAMETERS
C_TEXT:C284($1; $pattern_t)
C_TEXT:C284($2; $string_t)
C_POINTER:C301($3; $pos_alp)
C_POINTER:C301($4; $len_alp)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$pattern_t:=$1
$string_t:=$2
$pos_alp:=$3
$len_alp:=$4
$match_boo:=False:C215

helper_ArrayClear($pos_alp; $len_alp)

C_LONGINT:C283($pos_l; $len_l; $start_l)
$start_l:=1

While (Match regex:C1019($pattern_t; $string_t; $start_l; $pos_l; $len_l)) & (Length:C16($string_t)>0)
	$match_boo:=True:C214
	APPEND TO ARRAY:C911($pos_alp->; $pos_l)
	APPEND TO ARRAY:C911($len_alp->; $len_l)
	$start_l:=$pos_l+$len_l
End while 

$0:=$match_boo