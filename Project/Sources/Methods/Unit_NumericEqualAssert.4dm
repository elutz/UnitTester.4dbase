//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/14/08, 12:42:02
// ----------------------------------------------------
// Method: Unit_NumericEqualAssert
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_REAL:C285($1; $expected_r; $2; $actual_r)
C_REAL:C285($3; $tolerance_r)
C_TEXT:C284($4; $other_t)

$expected_r:=$1
$actual_r:=$2

If (Count parameters:C259>=3)
	$tolerance_r:=$3
Else 
	$tolerance_r:=0
End if 

If (Count parameters:C259>=4)
	$other_t:=$4
Else 
	$other_t:=""
End if 

C_TEXT:C284($failure_t)
$failure_t:="Expected "+String:C10($expected_r)+" "+Char:C90(177)+" "+String:C10($tolerance_r)+", was "+String:C10($actual_r)

If ($other_t#"")
	$failure_t:=$failure_t+".  "+$other_t
End if 

Unit_TrueAssert(Abs:C99($expected_r-$actual_r)<=$tolerance_r; $failure_t)