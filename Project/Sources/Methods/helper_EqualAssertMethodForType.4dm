//%attributes = {"invisible":true}
//***********************************************************************
// Method Name: helper_EqualAssertMethodForType
// Date created: 05/14/09, 22:33:58
// Created by: Mark Schaake
// Returns: 
C_TEXT:C284($0; $method_t)
// Required Parameters: 
C_LONGINT:C283($1; $type_l)
// Optional Parameters: --none''
//***********************************************************************

$type_l:=$1

C_TEXT:C284($prefix_t)
prefs_GetById("wrapper_prefix"; ->$prefix_t)

If ($prefix_t="")
	$prefix_t:="Unit_"
End if 

Case of 
	: (helper_Type4dIsAlpha($type_l))
		$method_t:=$prefix_t+"TextEqualAssert"
	: (helper_Type4dIsBLOB($type_l))
		$method_t:=$prefix_t+"BLOBEqualAssert"
	: (helper_Type4dIsBoolean($type_l))
		$method_t:=$prefix_t+"TrueAssert"
	: (helper_Type4dIsDate($type_l))
		$method_t:=$prefix_t+"DateEqualAssert"
	: (helper_Type4dIsInteger($type_l))
		$method_t:=$prefix_t+"IntegerEqualAssert"
	: (helper_Type4dIsPicture($type_l))
		$method_t:=$prefix_t+"PictureEqualAssert"
	: (helper_Type4dIsPointer($type_l))
		$method_t:=$prefix_t+"PointerEqualAssert"
	: (helper_Type4dIsReal($type_l))
		$method_t:=$prefix_t+"NumericEqualAssert"
	: (helper_Type4dIsTime($type_l))
		$method_t:=$prefix_t+"TimeEqualAssert"
End case 

$0:=$method_t