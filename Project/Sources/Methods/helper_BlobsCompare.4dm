//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/16/08, 23:09:04
// ----------------------------------------------------
// Method: helper_BlobsAreEqual
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_BOOLEAN:C305($0; $equal_boo)

//REQUIRED PARAMETERS
C_POINTER:C301($1; $blob1_ptr; $2; $blob2_ptr)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$blob1_ptr:=$1
$blob2_ptr:=$2

$equal_boo:=True:C214

If (BLOB size:C605($blob1_ptr->)#BLOB size:C605($blob2_ptr->))
	$equal_boo:=False:C215
Else 
	
	C_LONGINT:C283($i)
	$i:=0
	For ($i; 1; BLOB size:C605($blob1_ptr->))
		
		If ($blob1_ptr->{$i-1}#$blob2_ptr->{$i-1})
			$equal_boo:=False:C215
		End if 
		
	End for 
	
End if 

$0:=$equal_boo