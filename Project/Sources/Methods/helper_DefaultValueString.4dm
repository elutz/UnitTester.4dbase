//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:02:36
// ----------------------------------------------------
// Method: DefaultValue
// Description
//
//
// ----------------------------------------------------
//
C_TEXT:C284($0; $string_t)
//REQUIRED PARAMETERS
C_LONGINT:C283($1; $type_l)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$type_l:=$1

C_TEXT:C284(vDef_t)
C_DATE:C307(vDef_d)
C_REAL:C285(vDef_r)
C_BOOLEAN:C305(vDef_boo)
C_TIME:C306(vDef_time)

vDef_t:=""
vDef_r:=0
vDef_d:=!00-00-00!
vDef_time:=?00:00:00?
vDef_boo:=False:C215

Case of 
	: ($type_l=Is alpha field:K8:1) | ($type_l=Is text:K8:3)
		$string_t:="\"\""
		
	: ($type_l=Is real:K8:4) | ($type_l=Is longint:K8:6) | ($type_l=Is integer:K8:5) | ($type_l=Is integer 64 bits:K8:25)
		$string_t:="0"
		
	: ($type_l=Is date:K8:7)
		$string_t:="!/00/00/00!"
		
	: ($type_l=Is time:K8:8)
		$string_t:="?00:00:00?"
		
	: ($type_l=Is boolean:K8:9)
		$string_t:="True"
		
	: ($type_l=Is pointer:K8:14)
		//Do nothing, should be null
		$string_t:=""
		
End case 

$0:=$string_t