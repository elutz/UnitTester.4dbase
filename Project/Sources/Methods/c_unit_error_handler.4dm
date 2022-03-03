//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 02/26/09, 16:18:07
// ----------------------------------------------------
// Method: Unit_ErrorHandler
// Description:
// Handles errors in the worker process.
//
// ----------------------------------------------------
//
//OPTIONAL PARAMETERS
C_TEXT:C284($1; $setupTeardown_t)

//Other


// ----------------------------------------------------

If (Count parameters:C259>=1)
	$setupTeardown_t:=$1
Else 
	$setupTeardown_t:=""
End if 

Case of 
	: ($setupTeardown_t="")  //this is an error
		
		ErrorCode:=Error
		
		ARRAY TEXT:C222($descriptions_at; 0)
		ARRAY LONGINT:C221($codes_al; 0)
		ARRAY TEXT:C222($codes_at; 0)
		
		GET LAST ERROR STACK:C1015($codes_al; $codes_at; $descriptions_at)
		
		C_LONGINT:C283($i)
		$i:=0
		For ($i; 1; Size of array:C274($descriptions_at))
			
			If ($codes_al{$i}=37)  //You forgot to share the test method with components
				If (Unit_BeginTest("Test case method error"; Unit_CurrentTestCaseMethod))  //let the developer know what method caused the error
					Unit_TrueAssert(False:C215; "Test case method not shared by components and host database")
				End if 
			Else 
				Unit_TrueAssert(False:C215; $codes_at{$i}+" - "+String:C10($codes_al{$i})+" - "+$descriptions_at{$i})
			End if 
			
		End for 
		
	: ($setupTeardown_t="setup")
		_unit_prev_err_method_t:=Method called on error:C704
		ON ERR CALL:C155(Current method name:C684)
		
	: ($setupTeardown_t="teardown")
		ON ERR CALL:C155(_unit_prev_err_method_t)
		
End case 