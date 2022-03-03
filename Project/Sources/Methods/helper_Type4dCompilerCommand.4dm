//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/13/09, 06:18:28
//--------------------------------------------------------------------------------
// Method: helper_Type4dCompilerCommand
// Returns the 4D compiler command name for the 
// given data type.
//
//--------------------------------------------------------------------------------
//
//Return Value
// -- NONE --

//Required Parameters
C_TEXT:C284($0; $command_t)

//Optional Parameters
C_LONGINT:C283($1; $4dtype_l)

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$4dtype_l:=$1

Case of 
	: (helper_Type4dIsAlpha($4dtype_l))
		$command_t:=Command name:C538(284)
		
	: (helper_Type4dIsBoolean($4dtype_l))
		$command_t:=Command name:C538(305)
		
	: (helper_Type4dIsDate($4dtype_l))
		$command_t:=Command name:C538(307)
		
	: (helper_Type4dIsIntegerShort($4dtype_l))
		$command_t:=Command name:C538(282)
		
	: (helper_Type4dIsInteger($4dtype_l))
		$command_t:=Command name:C538(283)
		
	: (helper_Type4dIsReal($4dtype_l))
		$command_t:=Command name:C538(285)
		
	: (helper_Type4dIsTime($4dtype_l))
		$command_t:=Command name:C538(306)
		
	: (helper_Type4dIsPicture($4dtype_l))
		$command_t:=Command name:C538(286)
		
	: (helper_Type4dIsPointer($4dtype_l))
		$command_t:=Command name:C538(301)
		
	: (helper_Type4dIsBLOB($4dtype_l))
		$command_t:=Command name:C538(604)
		
	Else 
		$command_t:=""
		
End case 

$0:=$command_t

_callstack_pop  //keep this at the end of the method