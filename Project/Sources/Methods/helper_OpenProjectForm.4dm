//%attributes = {"invisible":true}
C_TEXT:C284($1; $form_t)
C_LONGINT:C283($2; $type_l; $winRef)

$form_t:=$1

If (Count parameters:C259>=2)
	$type_l:=$2
Else 
	$type_l:=Plain window:K34:13
End if 

$winRef:=Open form window:C675($form_t; $type_l; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40($form_t)
CLOSE WINDOW:C154($winRef)
