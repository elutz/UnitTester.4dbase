//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/28/08, 12:39:48
// ----------------------------------------------------
// Method: helper_PointerToStringForExecut
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS
C_POINTER:C301($1; $val_p)
C_TEXT:C284($0; $strVal_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$val_p:=$1

Case of 
	: (Type:C295($val_p->)=Is text:K8:3) | (Type:C295($val_p->)=Is alpha field:K8:1)
		$strVal_t:="\""+$val_p->+"\""
		
	: (Type:C295($val_p->)=Is real:K8:4) | (Type:C295($val_p->)=Is integer:K8:5) | (Type:C295($val_p->)=Is longint:K8:6)
		$strVal_t:=String:C10($val_p->)
		
	: (Type:C295($val_p->)=Is date:K8:7)
		$strVal_t:="!"+String:C10($val_p->; Internal date short special:K1:4)+"!"
		
	: (Type:C295($val_p->)=Is time:K8:8)
		$strVal_t:="?"+String:C10($val_p->; Internal date short special:K1:4)+"?"
		
End case 

$0:=$strVal_t