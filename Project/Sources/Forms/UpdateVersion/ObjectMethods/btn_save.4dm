C_TEXT:C284($download_t; $newRelease_t)
$newRelease_t:="<p><strong>UnitTester "+new_version_t+"</strong> - "+String:C10(Current date:C33; Internal date short special:K1:4)+"<br>"+release_notes_t+"</p>"
$download_t:=Replace string:C233(helper_DocumentToText(paths_DownloadPage); "<!-- RELEASE NOTES -->"; "<!-- RELEASE NOTES -->\r\n"+$newRelease_t)

helper_TextToDocument($download_t; paths_DownloadPage)
helper_TextToDocument(new_version_t; paths_CurrentVersionFile)

ACCEPT:C269