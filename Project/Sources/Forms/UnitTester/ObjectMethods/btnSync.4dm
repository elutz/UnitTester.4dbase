Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		//First, need to save the current state = 
		//current selection
		//expaned / collapsed states
		
		C_TEXT:C284($licenseType_t)
		
		If (setup_license_type="team") | (setup_license_type="demo")
			
			ARRAY LONGINT:C221($expandedRefs_al; 0)
			ARRAY LONGINT:C221($selectedRefs_al; 0)
			C_LONGINT:C283($selected_l; $ref_l; $sublist_l)
			C_TEXT:C284($text_t)
			C_BOOLEAN:C305($expanded_boo)
			
			$selected_l:=Selected list items:C379(hl_TestSuites; $selectedRefs_al; *)
			
			For ($i; 1; Count list items:C380(hl_TestSuites; *))
				GET LIST ITEM:C378(hl_TestSuites; $i; $ref_l; $text_t; $sublist_l; $expanded_boo)
				If (Is a list:C621($sublist_l)) & ($expanded_boo)
					APPEND TO ARRAY:C911($expandedRefs_al; $ref_l)
				End if 
			End for 
			
			helper_TestFileToListLoad
			
			C_LONGINT:C283($i)
			$i:=0
			For ($i; 1; Size of array:C274($expandedRefs_al))
				GET LIST ITEM:C378(hl_TestSuites; List item position:C629(hl_TestSuites; $expandedRefs_al{$i}); $ref_l; $text_t; $sublist_l; $expanded_boo)
				SET LIST ITEM:C385(hl_TestSuites; $ref_l; $text_t; $ref_l; $sublist_l; True:C214)
			End for 
			
			SELECT LIST ITEMS BY REFERENCE:C630(hl_TestSuites; $selected_l; $selectedRefs_al)
			
		Else 
			ALERT:C41("This feature is only available to Team Development license holders")
		End if 
		
End case 