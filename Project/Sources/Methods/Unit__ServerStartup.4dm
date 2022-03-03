//%attributes = {"invisible":true,"shared":true}
//***********************************************************************
// Method Name: Unit__ServerStartup
// Date created: 05/16/09, 03:15:57
// Created by: Mark Schaake
// Description:
//  Starts the UnitTester server processes.
//  Should be called via an EXECUTE FORMULA or Execute method command after determining:
//  1) the server is running interpreted, and
//  2) the component is installed
//  
//  The processes started by this method are:
//  * unittester_request_queue
//  * unittester_request_processor
// 
// Returns: --nothing--
// Required Parameters: --none--
// Optional Parameters: --none--
//***********************************************************************

C_TEXT:C284($license_t)
$license_t:=setup_license_type(server_document_to_blob(paths_UnitLicenseGet))

version_control

If (Not:C34(server_is_running))
	server_request_processor_start
End if 