//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/17/08, 15:45:26
// ----------------------------------------------------
// Method: helper_BuildApplication
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $buildPath_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$buildPath_t:=$1

C_BOOLEAN:C305(unit_build_error_boo)
C_TEXT:C284($prevErrorHandler_t)

unit_build_error_boo:=False:C215
$prevErrorHandler_t:=Method called on error:C704
ON ERR CALL:C155("helper_BuildErrorHandler")

BUILD APPLICATION:C871($buildPath_t)

If (OK=0) & (Not:C34(unit_build_error_boo))
	ALERT:C41("Build failed for unkown reason")
End if 

ON ERR CALL:C155($prevErrorHandler_t)