//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/13/09, 06:25:14
//--------------------------------------------------------------------------------
// Method: helper_ComboBoxTypeAhead
// Implements type-ahead for a combo box object
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_POINTER:C301($1; $formObjPtr)
C_LONGINT:C283($2; $formEvent; $length; $ArrayLocation; $key)
C_TEXT:C284($3; $editedText)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$formObjPtr:=$1
$formEvent:=$2
$editedText:=$3

Case of 
	: ($formEvent=On After Keystroke:K2:26)  // processes text after it's been entered into the object
		$key:=Character code:C91(Keystroke:C390)
		// do not process certain keys
		If ($key#Backspace:K15:36) & ($key#Left arrow key:K12:16) & ($key#Right arrow key:K12:17)  //& (Not(Shift down))
			// how many characters are in the edited text (for positioning the highlight area)
			$length:=Length:C16($editedText)
			If ($length#0)
				//find the closest match to the entered text
				$arrayLocation:=Find in array:C230($formObjPtr->; $editedText+"@")
				If ($arrayLocation#-1)
					// select the closest matching element in the combo box
					$formObjPtr->{0}:=$formObjPtr->{$arrayLocation}
					$formObjPtr->:=$arrayLocation
					// highlight text that has been added to the "edited text"
					HIGHLIGHT TEXT:C210($formObjPtr->; $length+1; Length:C16($formObjPtr->{0})+1)
				Else 
					$formObjPtr->{0}:=$editedText  // display only the edited text since there is no close match
					$formObjPtr->:=0  // no elements selected
					// set cursor location to end (no highlight)
					HIGHLIGHT TEXT:C210($formObjPtr->; Length:C16($formObjPtr->{0})+1; Length:C16($formObjPtr->{0})+1)
				End if 
			End if 
		End if 
		
	: ($formEvent=On Data Change:K2:15)
		// find the closest match in the array and select it
		$arrayLocation:=Find in array:C230($formObjPtr->; $editedText+"@")
		If ($arrayLocation#-1)
			$formObjPtr->{0}:=$formObjPtr->{$arrayLocation}  // select the matching element in the combo box
			$formObjPtr->:=$arrayLocation
		End if 
		
End case 

_callstack_pop  //keep this at the end of the method