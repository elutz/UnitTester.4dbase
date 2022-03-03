//%attributes = {"invisible":true}
//TEST SUITE SETUP
//Define variables, create temporary documents, etc. that will be used by the tests

Unit_BeginTest("Longint arrays"; Current method name:C684)

ARRAY LONGINT:C221($arr1_al; 4)
ARRAY LONGINT:C221($arr2_al; 4)

$arr1_al{1}:=1
$arr1_al{2}:=11
$arr1_al{3}:=111
$arr1_al{4}:=1111

$arr2_al{1}:=1
$arr2_al{2}:=11
$arr2_al{3}:=111
$arr2_al{4}:=1111

Unit_EqualAssert(->$arr1_al; ->$arr2_al)

Unit_BeginTest("Real arrays"; Current method name:C684)

ARRAY REAL:C219($arr1_ar; 4)
ARRAY REAL:C219($arr2_ar; 4)

$arr1_ar{1}:=1
$arr1_ar{2}:=11.1
$arr1_ar{3}:=111
$arr1_ar{4}:=1111.1

$arr2_ar{1}:=1
$arr2_ar{2}:=11.1
$arr2_ar{3}:=111
$arr2_ar{4}:=1111.1

Unit_EqualAssert(->$arr1_ar; ->$arr2_ar; "arrays not equal")

Unit_BeginTest("Date arrays"; Current method name:C684)
ARRAY DATE:C224($arr1_ad; 4)
ARRAY DATE:C224($arr2_ad; 4)

$arr1_ad{1}:=!2008-01-01!
$arr1_ad{2}:=!2008-01-02!
$arr1_ad{3}:=!2008-01-03!
$arr1_ad{4}:=!2008-01-04!

$arr2_ad{1}:=!2008-01-01!
$arr2_ad{2}:=!2008-01-02!
$arr2_ad{3}:=!2008-01-03!
$arr2_ad{4}:=!2008-01-04!

Unit_EqualAssert(->$arr1_ad; ->$arr2_ad)

Unit_BeginTest("Text arrays"; Current method name:C684)
ARRAY TEXT:C222($arr1_at; 4)
ARRAY TEXT:C222($arr2_at; 4)

$arr1_at{1}:="1st"
$arr1_at{2}:="2nd"
$arr1_at{3}:="3rd"
$arr1_at{4}:="4th"

$arr2_at{1}:="1st"
$arr2_at{2}:="2nd"
$arr2_at{3}:="3rd"
$arr2_at{4}:="4th"

Unit_EqualAssert(->$arr1_at; ->$arr2_at)

Unit_BeginTest("Boolean arrays"; Current method name:C684)
ARRAY BOOLEAN:C223($arr1_ab; 4)
ARRAY BOOLEAN:C223($arr2_ab; 4)

$arr1_ab{1}:=True:C214
$arr1_ab{2}:=False:C215
$arr1_ab{3}:=True:C214
$arr1_ab{4}:=False:C215

$arr2_ab{1}:=True:C214
$arr2_ab{2}:=False:C215
$arr2_ab{3}:=True:C214
$arr2_ab{4}:=False:C215

Unit_EqualAssert(->$arr1_ab; ->$arr2_ab)

Unit_BeginTest("Picture arrays"; Current method name:C684)
ARRAY PICTURE:C279($arr1_apic; 4)
ARRAY PICTURE:C279($arr2_apic; 4)

$arr1_apic{1}:=helper_GetResourceImage("assert_failed_16.png")
$arr1_apic{2}:=helper_GetResourceImage("failure_lead_16.png")
$arr1_apic{3}:=helper_GetResourceImage("assert_failed_16.png")
$arr1_apic{4}:=helper_GetResourceImage("assert_failed_16.png")

$arr2_apic{1}:=helper_GetResourceImage("assert_failed_16.png")
$arr2_apic{2}:=helper_GetResourceImage("failure_lead_16.png")
$arr2_apic{3}:=helper_GetResourceImage("assert_failed_16.png")
$arr2_apic{4}:=helper_GetResourceImage("assert_failed_16.png")

Unit_EqualAssert(->$arr1_apic; ->$arr2_apic)

Unit_BeginTest("Blob vars - same sizes"; Current method name:C684)
C_BLOB:C604($var1_blob; $var2_blob)
SET BLOB SIZE:C606($var1_blob; 150)
SET BLOB SIZE:C606($var2_blob; 150)
Unit_EqualAssert(->$var1_blob; ->$var2_blob)

Unit_BeginTest("Picture vars - same"; Current method name:C684)
C_PICTURE:C286($pic1; $pic2)
$pic1:=helper_GetResourceImage("delete.png")
$pic2:=helper_GetResourceImage("delete.png")
Unit_EqualAssert(->$pic1; ->$pic2)


Unit_BeginTest("Pointers"; Current method name:C684)
C_POINTER:C301($ptr1; $ptr2)
$ptr1:=->$pic1
$ptr2:=->$pic2
Unit_EqualAssert(->$ptr1; ->$ptr1)

If (Unit_BeginTest("Objects"; Current method name:C684))
	
	C_OBJECT:C1216($object1; $object2)
	$object1:=New object:C1471("name"; "eins")
	$object2:=New object:C1471("name"; "eins")
	
	Unit_EqualAssert(->$object1; ->$object2; "objects not equal")
	
End if 

//TEAR DOWN UNIT
//Delete temporary documents, clear arrays, blobs, pictures, etc.