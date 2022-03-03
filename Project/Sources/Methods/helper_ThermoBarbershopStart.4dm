//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 16:03:54
// ----------------------------------------------------
// Method: helper_ThermoStartBarbershop
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; vProgress_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

vProgress_t:=$1

OBJECT SET VISIBLE:C603(*; "progress_@"; True:C214)
OBJECT SET FORMAT:C236(progTherm; ";;;;128")
progTherm:=1