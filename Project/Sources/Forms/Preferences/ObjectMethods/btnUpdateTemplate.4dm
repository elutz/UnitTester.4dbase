If (helper_Trim(wrapper_prefix)#"")
	C_TEXT:C284($template_t)
	C_BLOB:C604($blob)
	C_TEXT:C284($oldPrefix_t)
	prefs_GetById("wrapper_prefix"; ->$oldPrefix_t)
	If ($oldPrefix_t="")
		$oldPrefix_t:="Unit_"
	End if 
	$template_t:=server_document_to_text(paths_TestCaseTemplateGet)
	$template_t:=Replace string:C233($template_t; $oldPrefix_t; wrapper_prefix)
	TEXT TO BLOB:C554($template_t; $blob; UTF8 text without length:K22:17)
	server_blob_to_document($blob; paths_TestCaseTemplateGet(True:C214))
	
	C_TEXT:C284($prefix_t)
	prefs_GetById("wrapper_prefix"; ->$prefix_t)
	If (wrapper_prefix#$prefix_t)
		prefs_SetById("wrapper_prefix"; wrapper_prefix)
		prefs_SetById("wrapper_prefix_old"; $prefix_t)
	End if 
	
	ALERT:C41("The test case template has been updated")
End if 