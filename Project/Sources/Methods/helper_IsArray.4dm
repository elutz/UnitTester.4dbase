//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/13/08, 21:15:28
// ----------------------------------------------------
// Method: helper_IsArray
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_BOOLEAN:C305($0; $isArray_boo)

//REQUIRED PARAMETERS
C_POINTER:C301($1; $ptr_p)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$ptr_p:=$1
$isArray_boo:=True:C214

Case of 
	: (Type:C295($ptr_p->)=Boolean array:K8:21)
	: (Type:C295($ptr_p->)=Date array:K8:20)
	: (Type:C295($ptr_p->)=Integer array:K8:18)
	: (Type:C295($ptr_p->)=LongInt array:K8:19)
	: (Type:C295($ptr_p->)=Picture array:K8:22)
	: (Type:C295($ptr_p->)=Pointer array:K8:23)
	: (Type:C295($ptr_p->)=Real array:K8:17)
	: (Type:C295($ptr_p->)=String array:K8:15)
	: (Type:C295($ptr_p->)=Text array:K8:16)
	Else 
		$isArray_boo:=False:C215
End case 


$0:=$isArray_boo