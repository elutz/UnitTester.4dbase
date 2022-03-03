Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		
		OBJECT SET SCROLL POSITION:C906(*; "params_listbox"; 1)
		LISTBOX SELECT ROW:C912(*; "params_listbox"; 0; lk remove from selection:K53:3)
		
	: (Form event code:C388=On Data Change:K2:15)
		
		cbReturnType{0}:=conv_TypeFromVarNameGet(Self:C308->; ->conv_types_at; ->conv_typeids_al; ->conv_prefixes_at; ->conv_suffixes_at)
		
		C_LONGINT:C283($pos)
		$pos:=Find in array:C230(cbReturnType; cbReturnType{0})
		If ($pos>0)
			cbReturnType:=$pos
		Else 
			If (helper_Trim(Self:C308->)#"") & (prefs_ConventionsStrictGet)
				ALERT:C41("The variable name $"+Self:C308->+" does not match a convention and you have set coding conventions to be strictly enforced. Please change the name or change your coding convention settings in the UnitTester preferences.")
				EDIT ITEM:C870(Self:C308->)
			Else 
				cbReturnType:=0
			End if 
		End if 
		
	: (Form event code:C388=On Losing Focus:K2:8)
		If (prefs_ConventionsStrictGet)
			EDIT ITEM:C870(params_varnames; 1)
		End if 
		
End case 