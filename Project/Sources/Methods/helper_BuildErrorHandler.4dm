//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:46:40
// ----------------------------------------------------
// Method: helper_BuildErrorHandler
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------
C_BOOLEAN:C305(unit_build_error_boo)
unit_build_error_boo:=True:C214

ARRAY LONGINT:C221($codes_al; 0)
ARRAY TEXT:C222($comps_at; 0)
ARRAY TEXT:C222($text_at; 0)

GET LAST ERROR STACK:C1015($codes_al; $comps_at; $text_at)

C_TEXT:C284($alert_t)

$alert_t:="The following errors occurred :"+Char:C90(Carriage return:K15:38)

C_LONGINT:C283($i)
$i:=0
For ($i; 1; Size of array:C274($text_at))
	$alert_t:=$alert_t+Char:C90(Carriage return:K15:38)+String:C10($codes_al{$i})+" - "+$text_at{$i}
End for 

ALERT:C41($alert_t)