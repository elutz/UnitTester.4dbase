//%attributes = {"invisible":true}
//TEST SUITE SETUP
//Define variables, create temporary documents, etc. that will be used by the tests

ARRAY REAL:C219($arr1_ar; 4)
ARRAY REAL:C219($arr2_ar; 4)

$arr1_ar{1}:=1
$arr1_ar{2}:=11.12
$arr1_ar{3}:=111
$arr1_ar{4}:=1111.1

$arr2_ar{1}:=1
$arr2_ar{2}:=11.1
$arr2_ar{3}:=111
$arr2_ar{4}:=1111.1

Unit_BeginTest("Compare without tolerance"; Current method name:C684)
Unit_NumericEqualAssert($arr1_ar{1}; $arr2_ar{1}; 0)
Unit_NumericNotEqualAssert($arr1_ar{2}; $arr2_ar{2}; 0)
Unit_NumericEqualAssert($arr1_ar{3}; $arr2_ar{3}; 0)
Unit_NumericEqualAssert($arr1_ar{4}; $arr2_ar{4}; 0)

Unit_BeginTest("Compare with tolerance"; Current method name:C684)
Unit_NumericEqualAssert($arr1_ar{2}; $arr2_ar{2}; 0.02)
Unit_NumericNotEqualAssert($arr1_ar{2}; $arr2_ar{2}; 0.01)





//TEAR DOWN UNIT
//Delete temporary documents, clear arrays, blobs, pictures, etc.