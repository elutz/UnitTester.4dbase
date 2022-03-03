//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 11/21/08, 11:33:55
// ----------------------------------------------------
// Method: helper_QuitDaemon
// Description
//
//
// ----------------------------------------------------
//
//RETURN VALUE


//REQUIRED PARAMETERS
C_TEXT:C284($1; $daemon_t)

//OPTIONAL PARAMETERS


// ----------------------------------------------------
$daemon_t:=$1

helper_OffloadToDaemon($daemon_t; "dmn_quit")