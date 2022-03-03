//%attributes = {"invisible":true}
//TEST SUITE SETUP
//Define variables, create temporary documents, etc. that will be used by the tests

Unit_BeginTest("Longint arrays"; Current method name:C684)

ARRAY LONGINT:C221($arr1_al; 4)
ARRAY LONGINT:C221($arr2_al; 4)

$arr1_al{1}:=1
$arr1_al{2}:=11
$arr1_al{3}:=111
$arr1_al{4}:=11111

$arr2_al{1}:=1
$arr2_al{2}:=11
$arr2_al{3}:=111
$arr2_al{4}:=1111

Unit_NotEqualAssert(->$arr1_al; ->$arr2_al)
Unit_NumericNotEqualAssert($arr1_al{4}; $arr2_al{4})

Unit_BeginTest("Date arrays"; Current method name:C684)
ARRAY DATE:C224($arr1_ad; 4)
ARRAY DATE:C224($arr2_ad; 4)

$arr1_ad{1}:=!2008-01-01!
$arr1_ad{2}:=!2008-01-02!
$arr1_ad{3}:=!2008-01-03!
$arr1_ad{4}:=!2008-01-04!

$arr2_ad{1}:=!2008-01-01!
$arr2_ad{2}:=!2008-01-01!
$arr2_ad{3}:=!2008-01-03!
$arr2_ad{4}:=!2008-01-04!

Unit_NotEqualAssert(->$arr1_ad; ->$arr2_ad)
Unit_DateNotEqualAssert($arr1_ad{2}; $arr2_ad{2})

Unit_BeginTest("Text arrays"; Current method name:C684)
ARRAY TEXT:C222($arr1_at; 4)
ARRAY TEXT:C222($arr2_at; 4)

$arr1_at{1}:="1st"
$arr1_at{2}:="2nd"
$arr1_at{3}:="3rd"
$arr1_at{4}:="5th"

$arr2_at{1}:="1st"
$arr2_at{2}:="2nd"
$arr2_at{3}:="3rd"
$arr2_at{4}:="4th"

Unit_NotEqualAssert(->$arr1_at; ->$arr2_at)
Unit_TextNotEqualAssert($arr1_at{4}; $arr2_at{4})

Unit_BeginTest("Boolean arrays"; Current method name:C684)
ARRAY BOOLEAN:C223($arr1_ab; 4)
ARRAY BOOLEAN:C223($arr2_ab; 4)

$arr1_ab{1}:=True:C214
$arr1_ab{2}:=False:C215
$arr1_ab{3}:=True:C214
$arr1_ab{4}:=False:C215

$arr2_ab{1}:=False:C215
$arr2_ab{2}:=False:C215
$arr2_ab{3}:=True:C214
$arr2_ab{4}:=False:C215

Unit_NotEqualAssert(->$arr1_ab; ->$arr2_ab)


Unit_BeginTest("Text vars"; Current method name:C684)
C_TEXT:C284($var1_t; $var2_t)
$var1_t:="Mark"
$var2_t:="caitlin"

Unit_NotEqualAssert(->$var1_t; ->$var2_t)

Unit_BeginTest("Numeric vars"; Current method name:C684)
C_LONGINT:C283($var1_l; $var2_l)
$var1_l:=2
$var2_l:=3

Unit_NotEqualAssert(->$var1_t; ->$var2_t)

Unit_BeginTest("Blob vars - different sizes"; Current method name:C684)
C_BLOB:C604($var1_blob; $var2_blob)
SET BLOB SIZE:C606($var1_blob; 150)
SET BLOB SIZE:C606($var2_blob; 200)
Unit_NotEqualAssert(->$var1_blob; ->$var2_blob)

Unit_BeginTest("Blob vars - same sizes, differnt values"; Current method name:C684)
C_BLOB:C604($var1_blob; $var2_blob)
SET BLOB SIZE:C606($var1_blob; 150)
SET BLOB SIZE:C606($var2_blob; 150)
$var1_blob{100}:=0
$var2_blob{100}:=1
Unit_NotEqualAssert(->$var1_blob; ->$var2_blob)

Unit_BeginTest("Picture vars - different"; Current method name:C684)
C_PICTURE:C286($pic1; $pic2)
$pic1:=helper_GetResourceImage("delete.png")
$pic2:=helper_GetResourceImage("actions.png")
Unit_NotEqualAssert(->$pic1; ->$pic2)



//TEAR DOWN UNIT
//Delete temporary documents, clear arrays, blobs, pictures, etc.