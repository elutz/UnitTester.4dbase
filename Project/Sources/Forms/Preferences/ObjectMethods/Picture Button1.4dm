C_LONGINT:C283($i)

For ($i; Size of array:C274(home_folders_at); 1; -1)
	If (home_folders_lb{$i})
		LISTBOX DELETE ROWS:C914(home_folders_lb; $i)
	End if 
End for 