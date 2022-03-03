//%attributes = {"invisible":true}
// ----------------------------------------------------
// User name (OS)/ Mark Schaake
// Date and time/ 03/05/09, 15/10/49
// ----------------------------------------------------
// Method/ _UnitTester_PostBuild
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_LONGINT:C283($newBuild_l\
)
C_TEXT:C284($builtPath_t\
; $demoPath_t; $demoComponentPath_t; $dir; $temp_t)

C_TEXT:C284($root_t\
; $4DVersion_t)

// Change this to whatever the location is for the output
$root_t:=System folder:C487\
(Desktop:K41:16)

// Suffix the name of UnitTester with a version corresponding to to 4D version it was built with
$4DVersion_t:="-v"\
+Substring:C12(Application version:C493; 1; 2)

$dir:=Folder separator:K24:12
$path_t:=Get 4D folder:C485\
(Database folder:K5:14)
$builtPath_t:=Get 4D folder:C485\
(Database folder:K5:14)+"build"+$dir\
+"Components"+$dir+"UnitTester.4dbase"

$demoPath_t:=helper_ParentDirectory\
($path_t)+"Demo"+$4DVersion_t+".4dbase"
$demoComponentPath_t:=$demoPath_t+$dir+"Components"+$dir+"UnitTester"+$4DVersion_t+".4dbase"

//Rename the component
//For some reason, mv -f is not always overwriting the existing component, so we need to manually delete it
LAUNCH EXTERNAL PROCESS:C811("rm -rf "\
+helper_UnixPathGet(helper_ParentDirectory($builtPath_t)+"UnitTester"+$4DVersion_t+".4dbase"))
LAUNCH EXTERNAL PROCESS:C811("mv -f "\
+helper_UnixPathGet($builtPath_t)+" "\
+helper_UnixPathGet(helper_ParentDirectory($builtPath_t)+"UnitTester"+$4DVersion_t+".4dbase"))

//Add version to built path
$builtPath_t:=helper_ParentDirectory($builtPath_t)+"UnitTester"+$4DVersion_t+".4dbase"

//Add the macros folder
LAUNCH EXTERNAL PROCESS:C811("cp -f -R "\
+helper_UnixPathGet($path_t+"Macros v2")+" "+helper_UnixPathGet($builtPath_t+$dir\
+"Macros v2"))

//Copy the component into the Demo
LAUNCH EXTERNAL PROCESS:C811("cp -f -R "\
+helper_UnixPathGet($builtPath_t)+" "\
+helper_UnixPathGet($demoComponentPath_t))

//Zip up the component and demo
_UnixZipToDestination($root_t\
+"UnitTester"+$4DVersion_t+".zip"; $builtPath_t)
_UnixZipToDestination($root_t\
+"Demo"+$4DVersion_t+".zip"; $demoPath_t)
