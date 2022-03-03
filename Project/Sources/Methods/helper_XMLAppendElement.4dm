//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 09:29:12
// ----------------------------------------------------
// Method: XML_AppendElement
// Description
// Creates a new child element by checking to see
// if there are any other child elements of same name
// and then creating the new element at the
// appropriate next index
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0; $elemRef_t)

//REQUIRED PARAMETERS
C_TEXT:C284($1; $root_t)
C_TEXT:C284($2; $elemName_t)

//OPTIONAL PARAMETERS
C_TEXT:C284(${3})  //attribute / value pairs

// ----------------------------------------------------

$root_t:=$1
$elemName_t:=$2
$elemRef_t:=""

$elemRef_t:=DOM Create XML element:C865($root_t; helper_XMLElementNameGet($root_t)+"/"+$elemName_t+"["+String:C10(DOM Count XML elements:C726($root_t; $elemName_t)+1)+"]")

C_LONGINT:C283($i)
$i:=0
For ($i; 3; Count parameters:C259; 2)
	DOM SET XML ATTRIBUTE:C866($elemRef_t; ${$i}; ${$i+1})
End for 

$0:=$elemRef_t