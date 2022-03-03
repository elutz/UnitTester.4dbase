Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		ARRAY TEXT:C222($items_at; 0)
		helper_ArrayTextAppend(->$items_at; "Update License"; "About UnitTester"; "Documentation")
		
		C_TEXT:C284($selected_t)
		
		$selected_t:=helper_PopupMenu(Self:C308; ->$items_at; False:C215)
		
		Case of 
			: ($selected_t="Update License")
				helper_OpenProjectForm("Registration"; Sheet form window:K39:12)
				
			: ($selected_t="Documentation")
				web_OpenURL(paths_DocumentationGet)
				
			: ($selected_t="About UnitTester")
				helper_OpenProjectForm("About"; Sheet form window:K39:12)
				
		End case 
		
End case 