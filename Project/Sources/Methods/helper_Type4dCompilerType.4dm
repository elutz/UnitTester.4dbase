//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 05/13/09, 06:09:29
//--------------------------------------------------------------------------------
// Method: helper_Type4dCompilerType
// Returns the C_... compiler command for the passed
// 4D data type.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_LONGINT:C283($0; $type_l)

//Required Parameters
C_TEXT:C284($1; $compiler_t)

//Optional Parameters
// -- NONE --

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$compiler_t:=$1
If (Not:C34(Match regex:C1019("^[Cc]_[A-Za-z]+$"; $compiler_t)))
	$compiler_t:="C_"+$compiler_t
End if 

$type_l:=0

Case of 
	: ($compiler_t=Command name:C538(284))
		$type_l:=Is text:K8:3
		
	: ($compiler_t=Command name:C538(305))
		$type_l:=Is boolean:K8:9
		
	: ($compiler_t=Command name:C538(307))
		$type_l:=Is date:K8:7
		
	: ($compiler_t=Command name:C538(283))
		$type_l:=Is longint:K8:6
		
	: ($compiler_t=Command name:C538(285))
		$type_l:=Is real:K8:4
		
	: ($compiler_t=Command name:C538(306))
		$type_l:=Is time:K8:8
		
	: ($compiler_t=Command name:C538(286))
		$type_l:=Is picture:K8:10
		
	: ($compiler_t=Command name:C538(301))
		$type_l:=Is pointer:K8:14
		
	: ($compiler_t=Command name:C538(604))
		$type_l:=Is BLOB:K8:12
		
	Else 
		$type_l:=Is integer:K8:5
		
End case 

$0:=$type_l

_callstack_pop  //keep this at the end of the method