//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 17:16:06
// ----------------------------------------------------
// Method: helper_Trim
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_TEXT:C284($0)

//REQUIRED PARAMETERS
C_TEXT:C284($1; $string_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$string_t:=$1
$string_t:=Replace string:C233($string_t; Char:C90(10); Char:C90(Carriage return:K15:38))

C_LONGINT:C283($pos_found_l; $length_found_l)

//break the string into array of chars

If (Length:C16($string_t)>0)
	
	While ($string_t[[1]]=Char:C90(10))
		$string_t:=Delete string:C232($string_t; 1; 1)
	End while 
	
	If (Match regex:C1019(" +"; $string_t; 1; $pos_found_l; $length_found_l; *))
		$string_t:=Delete string:C232($string_t; 1; $length_found_l)
	End if 
	
	If (Match regex:C1019(" +$"; $string_t; 1; $pos_found_l; $length_found_l))
		$string_t:=Delete string:C232($string_t; Length:C16($string_t)-($length_found_l-1); $length_found_l)
	End if 
	
	If (Length:C16($string_t)>0)
		C_BOOLEAN:C305($ok_boo)
		$ok_boo:=($string_t[[Length:C16($string_t)]]=Char:C90(Carriage return:K15:38))
		
		If ($ok_boo)
			
			Repeat 
				
				$string_t:=Delete string:C232($string_t; Length:C16($string_t); 1)
				
				$ok_boo:=(Length:C16($string_t)>0)
				If ($ok_boo)
					$ok_boo:=($string_t[[Length:C16($string_t)]]=Char:C90(Carriage return:K15:38))
				End if 
				
			Until (Not:C34($ok_boo))
			
		End if 
		
	End if 
	
End if 

$0:=$string_t