//%attributes = {"invisible":true,"executedOnServer":true}
//***********************************************************************
// Method Name: server_is_running
// Created by: Mark Schaake
// Date created: 05/19/09, 13:51:47
//
// Description:
//  Returns true if the UnitTester server is running.
// 
// Returns: 
C_BOOLEAN:C305($0)
// Required Parameters: --none--
// Optional Parameters: --none--
// Other Variables:
// 
//***********************************************************************

$0:=(server_request_procssor_process>0)