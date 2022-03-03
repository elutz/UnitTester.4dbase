//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 11:22:21
// ----------------------------------------------------
// Method: helper_FileName
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_TEXT:C284($1; $string_t; $0; $fileName_t)

//OPTIONAL PARAMETERS
C_BOOLEAN:C305($2; $dropExtension_b)

// ----------------------------------------------------

$string_t:=$1

If (Count parameters:C259>=2)
	$dropExtension_b:=$2
Else 
	$dropExtension_b:=False:C215
End if 

C_LONGINT:C283($viLen; $viPos; $viChar; $viDirSymbol)

If ($dropExtension_b) & (Position:C15("."; $string_t; 1)>0)
	$viPos:=Length:C16($string_t)
	Repeat 
		$viPos:=$viPos-1
	Until (Character code:C91($string_t[[$viPos]])=Character code:C91("."))
	$string_t:=Delete string:C232($string_t; $viPos; 4)
End if 

If (Is Windows:C1573)
	$viDirSymbol:=Character code:C91("\\")
Else 
	$viDirSymbol:=Character code:C91(":")
End if 
$viLen:=Length:C16($string_t)
$viPos:=0
For ($viChar; $viLen; 1; -1)
	If (Character code:C91($string_t[[$viChar]])=$viDirSymbol)
		$viPos:=$viChar
		$viChar:=0
	End if 
End for 
If ($viPos>0)
	$fileName_t:=Substring:C12($string_t; $viPos+1)
Else 
	$fileName_t:=$1
End if 

$0:=$fileName_t