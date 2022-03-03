//%attributes = {"invisible":true,"executedOnServer":true}
_callstack_push(Current method name:C684)
//***********************************************************************
// Method Name: log_save
// Syntax: log_save($xml_blob)
// Created by: Mark Schaake
// Date created: 06/20/09, 07:57:33
//
// Description:
//  Saves log files to disk.
// 
// Returns: --nothing--
// Required Parameters: 
C_BLOB:C604($1; $xml_blob)
// Optional Parameters: --none--
// Other Variables:
C_BLOB:C604($html_blob; $xsl_blob)
C_TEXT:C284($prefix_t; $timestamp_t)

// 
//***********************************************************************

$xml_blob:=$1
$xsl_blob:=server_document_to_blob(paths_LogFileXSLGet)

_O_XSLT APPLY TRANSFORMATION:C882($xml_blob; $xsl_blob; $html_blob)

$timestamp_t:=helper_TimestampGet
$prefix_t:=paths_LogFilesDirectoryGet+"ut_log_"+$timestamp_t

server_blob_to_document($xml_blob; $prefix_t+".xml")
server_blob_to_document($html_blob; $prefix_t+".html")
log_truncate_files  //enforce the prefernce for number of logs to keep

_callstack_pop