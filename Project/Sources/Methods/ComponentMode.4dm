//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 22:39:01
// ----------------------------------------------------
// Method: ComponentMode
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_BOOLEAN:C305($0; $isComponent_boo)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

ARRAY TEXT:C222($components_at; 0)

COMPONENT LIST:C1001($components_at)

$isComponent_boo:=(Find in array:C230($components_at; helper_DocumentName(Structure file:C489; True:C214))>0)

$0:=$isComponent_boo