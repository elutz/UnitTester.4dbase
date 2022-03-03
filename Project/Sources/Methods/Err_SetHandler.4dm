//%attributes = {"invisible":true}
//%attributes = {}
// ----------------------------------------------------
// Anwender (OS): lutz
// Datum und Zeit: 21.02.07, 10:45:56
// ----------------------------------------------------
// Methode: Err_SetHandler
// Beschreibung
// Ersetzt aktuellen Errorhandler durch einen neuen und initialisiert ErrorCode Variable
//  
// Parameter
// $1 Name des neuen Errorhandlers
// $0 Name des bisherigen Errorhandlers
// ----------------------------------------------------
C_TEXT:C284($1)  // Name des neuen Errorhandlers
C_TEXT:C284($0)  // Name des bisherigen Errorhandlers
C_BOOLEAN:C305($2)  // optional: Array mit den letzten Fehlern zurücksetzen, default: nicht zurücksetzen\

ErrorCode:=0
ErrorText:=""
If (Count parameters:C259>1)
	If ($2)
		ARRAY TEXT:C222(ErrorTexts; 0)
	End if 
End if 
$0:=Method called on error:C704
ON ERR CALL:C155($1)

