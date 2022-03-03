//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 21:12:06
// ----------------------------------------------------
// Method: RunAllTests
// Description:
// Runs all tests disregarding selection.
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

C_BOOLEAN:C305(log_enabled_b)
C_BOOLEAN:C305(run_all_b)
log_enabled_b:=prefs_LogGenerateGet
run_all_b:=True:C214

If (log_enabled_b)
	//xml log variables
	C_TEXT:C284(xml_test_run_t)  //root
	C_TEXT:C284(xml_summaries_t; xml_test_cases_t)  //1st leve
	C_TEXT:C284(xml_test_case_t)
	C_TEXT:C284(xml_user_data_t; xml_tests)
	C_TEXT:C284(xml_test_t)
	C_TEXT:C284(xml_assertions_t)
	C_TEXT:C284(xml_assertion_t)
	C_TEXT:C284(test_start_t)
	
	test_start_t:=helper_TimestampGet
	xml_test_run_t:=DOM Create XML Ref:C861("test_run")
	xml_summaries_t:=DOM Create XML element:C865(xml_test_run_t; "summaries"; "start"; helper_TimestampToISO(test_start_t))
	xml_test_cases_t:=DOM Create XML element:C865(xml_test_run_t; "test_cases")
	
End if 

RunTests(hl_TestSuites)