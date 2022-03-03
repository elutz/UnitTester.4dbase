//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/16/08, 23:13:43
// ----------------------------------------------------
// Method: helper_ComparePictures
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE
C_BOOLEAN:C305($0; $equal_boo)

//REQUIRED PARAMETERS
C_POINTER:C301($1; $pic1; $2; $pic2)

//OPTIONAL PARAMETERS


// ----------------------------------------------------

$pic1:=$1
$pic2:=$2

C_BLOB:C604($blob1; $blob2)
PICTURE TO BLOB:C692($pic1->; $blob1; "image/jpeg")
PICTURE TO BLOB:C692($pic2->; $blob2; "image/jpeg")

$0:=helper_BlobsCompare(->$blob1; ->$blob2)