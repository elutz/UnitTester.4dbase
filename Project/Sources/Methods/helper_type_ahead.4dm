//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: helper_type_ahead
// Created by: Mark Schaake
// Date created: 05/16/09, 11:07:19
//
// Description:
//  Implements type-ahead
// 
// Returns: --nothing--
// Required Parameters: 
C_POINTER:C301($1; $object_p)
C_LONGINT:C283($2; $event_l)
C_TEXT:C284($3; $editedText_t)
C_POINTER:C301($4; $source_array_text_p)
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$object_p:=$1
$event_l:=$2
$editedText_t:=$3
$source_array_text_p:=$4

If ($event_l=On After Keystroke:K2:26)
	
	C_LONGINT:C283($key; $length; $pos)
	$key:=Character code:C91(Keystroke:C390)
	// do not process certain keys
	If ($key#Backspace:K15:36) & ($key#Left arrow key:K12:16) & ($key#Right arrow key:K12:17)  //& (Not(Shift down))
		// how many characters are in the edited text (for positioning the highlight area)
		$length:=Length:C16($editedText_t)
		If ($length#0)
			//find the closest match to the entered text
			$pos:=Find in array:C230($source_array_text_p->; $editedText_t+"@")
			If ($pos#-1)
				// select the closest matching element in the combo box
				$object_p->:=$source_array_text_p->{$pos}
				// highlight text that has been added to the "edited text"
				HIGHLIGHT TEXT:C210($object_p->; $length+1; Length:C16($object_p->)+1)
			End if 
		End if 
	End if 
	
End if 