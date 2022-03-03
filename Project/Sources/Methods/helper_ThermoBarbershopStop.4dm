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


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_TEXT:C284(vProgress_t)

OBJECT SET VISIBLE:C603(*; "progress_@"; False:C215)
OBJECT SET FORMAT:C236(progTherm; "0;100;1;1;0")
progTherm:=0
vProgress_t:=""