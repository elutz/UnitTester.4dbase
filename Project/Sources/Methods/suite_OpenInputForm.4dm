//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/19/08, 17:29:30
// ----------------------------------------------------
// Method: suite_OpenInputForm
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS
C_LONGINT:C283($1; suite_ref_l)

// ----------------------------------------------------

If (Count parameters:C259>=1)
	suite_ref_l:=$1
Else 
	suite_ref_l:=0
End if 

helper_OpenProjectForm("SuiteInput"; Sheet form window:K39:12)