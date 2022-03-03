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
//REQUIRED PARAMETERS
C_POINTER:C301($1; $var_p)
C_POINTER:C301($0; $val_p)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$var_p:=$1

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
	: (Type:C295($var_p->)=Is alpha field:K8:1) | (Type:C295($var_p->)=Is text:K8:3)
		$val_p:=->vDef_t
		
	: (Type:C295($var_p->)=Is real:K8:4) | (Type:C295($var_p->)=Is longint:K8:6) | (Type:C295($var_p->)=Is integer:K8:5) | (Type:C295($var_p->)=Is integer 64 bits:K8:25)
		$val_p:=->vDef_r
		
	: (Type:C295($var_p->)=Is date:K8:7)
		$val_p:=->vDef_d
		
	: (Type:C295($var_p->)=Is time:K8:8)
		$val_p:=->vDef_time
		
	: (Type:C295($var_p->)=Is boolean:K8:9)
		$val_p:=->vDef_boo
		
	: (Type:C295($var_p->)=Is pointer:K8:14)
		//Do nothing, should be null
		$val_p:=$var_p
		
End case 

$0:=$val_p