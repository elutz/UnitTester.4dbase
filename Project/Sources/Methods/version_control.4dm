//%attributes = {"invisible":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: version_control
// Created by: Mark Schaake
// Date created: 05/23/09, 16:47:26
//
// Description:
//  Performs any necessary updates and sets the version.
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

C_TEXT:C284($thisVersion_t; $version_t)
prefs_GetById("version"; ->$version_t)

$thisVersion_t:="1.7.0"

Case of 
	: ($version_t=$thisVersion_t)
		//do nothing, we are up to date
		
	: ($version_t="1.6")
		$version_t:="1.6.1"
		prefs_SetById("version"; $version_t)
		version_control
		//Added ability for single user to have one seat for remote mode
		
	: ($version_t="1.5.3")
		$version_t:="1.6"
		prefs_SetById("version"; $version_t)
		version_control
		setup_update_host_method("_unit_error_handler")
		//implemented #70
		
	: ($version_t="1.5.2.1")
		$version_t:="1.5.3"
		prefs_SetById("version"; $version_t)
		version_control
		//Added #24
		
	: ($version_t="1.5.2")
		$version_t:="1.5.2.1"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed #28, #29
		
	: ($version_t="1.5.1")
		$version_t:="1.5.2"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed bug #7 - could not even enter demo mode in team version
		//when unlicensed. Prevented user from being able to activate.
		
	: ($version_t="1.5")
		$version_t:="1.5.1"
		prefs_SetById("version"; $version_t)
		version_control
		//Replaced UnitTester plugin with Rob Laveaux's API Pack
		
	: ($version_t="1.4.6")
		$version_t:="1.5"
		prefs_SetById("version"; $version_t)
		version_control
		//1. Removed drag and drop
		//2. Added ability to add multiple test case methods to existing suite
		
	: ($version_t="1.4.5")
		$version_t:="1.4.6"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed method_CreateTestCase so that it correctly calls the
		//method_CreateMethod method instead of the deprecated Unit_CreateMethod
		//plugin method.
		
	: ($version_t="1.4.4")
		$version_t:="1.4.5"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed Create method so that it correctly sets the Execute on Server flag
		//Last fix (1.4.4) was using the 11.4 version of 4D Pack which had a
		//bug causing all newly created methods to have this fals incorrectly set.
		//This bug was fixed in the 11.5 release.
		
	: ($version_t="1.4.1")
		$version_t:="1.4.4"
		prefs_SetById("version"; $version_t)
		version_control
		//Changed method creation to depend on the AP Create Method instead of 
		//UnitTester_CreateMethod plugin call. This is for two reasons:
		// 1. The plugin api did not expose the "Execute on Server" flag and
		//    defaulted all new methods to be Executed on Server
		// 2. Nice to give users the option to mark a method to execute on server
		
	: ($version_t="1.4")
		$version_t:="1.4.1"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed a bug in Unit_ArrayNotEqualAssert due to variable name with transposed letters
		
	: ($version_t="1.3")
		$version_t:="1.4"
		prefs_SetById("version"; $version_t)
		version_control
		//Made compatible with v11.5, which means the mock methods
		//had to be updated to no longer have a workaround for 
		//the bug in SET DATABASE PARAMETER for resetting
		//a table's sequence number
		
	: ($version_t="1.2.8")
		$version_t:="1.3"
		prefs_SetById("version"; $version_t)
		version_control
		//Added preference to turn off UnitTester's error handler
		//Updated documentation - fixed bug in pdf rendering of command and control keys
		
	: ($version_t="1.2.7")
		$version_t:="1.2.8"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed a bug where a run all that triggered a build did not reset
		//the flag for building. This meant that a subsequent run selected would
		//also result in a build.
		
	: ($version_t="1.2.6")
		$version_t:="1.2.7"
		prefs_SetById("version"; $version_t)
		version_control
		//Added preference to auto-check for updates once per day
		
	: ($version_t="1.2.5")
		If (setup_update_host_method("_unit_error_handler"))
			$version_t:="1.2.6"
			prefs_SetById("version"; $version_t)
			version_control
		End if 
		
	: ($version_t="1.2.4")
		$version_t:="1.2.5"
		prefs_SetById("version"; $version_t)
		version_control
		
	: ($version_t="1.2.3")
		If (setup_update_host_method("_unit_error_handler"))
			$version_t:="1.2.4"
			prefs_SetById("version"; $version_t)
			version_control
		End if 
		//Updated the error handler method which required
		//adopting the 4D_Pack plugin.
		//As a result, also updated preferences and Method Creator
		//to include ability to set Execute on server property
		
	: ($version_t="1.2.2")
		$version_t:="1.2.3"
		prefs_SetById("version"; $version_t)
		version_control
		//Removed enforcement of production methods being required to be shared when a test
		//case method is created
		
	: ($version_t="1.2.1")
		$version_t:="1.2.2"
		prefs_SetById("version"; $version_t)
		version_control
		//Added enforcement of shared property to method creator tool when choosing
		//to create a test case method.
		
	: ($version_t="1.2.0")
		$version_t:="1.2.1"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed bug in method creator where preference for test case method prefix
		//was ignored in favor of the default underscore
		
	: ($version_t="1.1.0")
		$version_t:="1.2.0"
		
		//If (setup_ensure_plugin (True))  //upgrade plugin
		//End if 
		prefs_SetById("version"; $version_t)
		version_control
		//Updated component to handle setting method properties in Method Creator
		
	: ($version_t="1.0.7")
		$version_t:="1.1.0"
		prefs_SetById("version"; $version_t)
		version_control
		//Added log file generation and management
		
	: ($version_t="1.0.6")
		$version_t:="1.0.7"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed a bug where method syntax showed a return value of int when no return value
		
	: ($version_t="1.0.5")
		$version_t:="1.0.6"
		prefs_SetById("version"; $version_t)
		version_control
		//Fixed bug where error handler wasn't shared with host.
		
	: ($version_t="1.0.4")
		$version_t:="1.0.5"
		prefs_SetById("version"; $version_t)
		version_control
		//Updated Method Creator interface to handle tabbing better by using an ON EVENT HANDLER
		
	: ($version_t="1.0.3")
		$version_t:="1.0.4"
		prefs_SetById("version"; $version_t)
		version_control
		//Added preference to Method Creator preferences to make conventions strictly enforced
		
	: ($version_t="1.0.2")
		$version_t:="1.0.3"
		prefs_SetById("version"; $version_t)
		version_control
		//Updated documentation to now have a pdf contents
		
	: ($version_t="1.0.1")
		$version_t:="1.0.2"
		prefs_SetById("version"; $version_t)
		version_control
		//Update the test suite input form: removed the prefix field
		//  Instead, just use the preference.
		
	: ($version_t="1.0")
		$version_t:="1.0.1"
		prefs_SetById("version"; $version_t)
		version_control
		
	Else 
		prefs_SetById("version"; $thisVersion_t)
		
End case 

If (ComponentMode)
	Macro_CreateMethodsOnHost
	setup_copy_templates
End if 

_callstack_pop