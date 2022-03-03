//%attributes = {"invisible":true}
//%attributes = {"shared":true}
ErrorCode:=Error

// Fehlerbehandlung erweitert, in V12 möglich
// Geändert von: Lutz (15.09.2011)  V512
//C_LONGINT($oldOK)
//$oldOK:=OK  // OK-Variable retten


ARRAY LONGINT:C221($CodesArray; 0)
ARRAY TEXT:C222($IntCompArray; 0)
ARRAY TEXT:C222($TextArray; 0)
GET LAST ERROR STACK:C1015($CodesArray; $IntCompArray; $TextArray)

C_TEXT:C284($vtxt)
C_LONGINT:C283($vlIndex)
$vtxt:="Fehler-Nr. "+String:C10(ErrorCode)+" in "+Error method+", Zeile "+String:C10(Error line)+"\r\n"
For ($vlIndex; 1; Size of array:C274($CodesArray))
	$vtxt:=$vtxt+String:C10($CodesArray{$vlIndex})+": "+$IntCompArray{$vlIndex}+", "+$TextArray{$vlIndex}+"\r\n"
End for 

ErrorText:=$vtxt
APPEND TO ARRAY:C911(ErrorTexts; $vtxt)
