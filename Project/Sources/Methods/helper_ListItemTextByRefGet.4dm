//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/01/08, 08:36:29
// ----------------------------------------------------
// Method: helper_GetListItemTextByRef
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($0; $text_t)
C_LONGINT:C283($1; $list_l)
C_LONGINT:C283($2; $ref_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$list_l:=$1
$ref_l:=$2

C_LONGINT:C283($pos_l)


Case of 
	: ($ref_l=-1)
		GET LIST ITEM:C378($list_l; *; $ref_l; $text_t)
		
	: ($ref_l>0)
		$pos_l:=List item position:C629($list_l; $ref_l)
		GET LIST ITEM:C378($list_l; $pos_l; $ref_l; $text_t)
		
	: ($ref_l=0)
		$text_t:=""
		
End case 

$0:=$text_t