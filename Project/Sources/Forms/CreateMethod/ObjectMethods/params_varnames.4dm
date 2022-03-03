
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 03/31/09, 07:18:37
// ----------------------------------------------------
// Method: Object Method: CreateMethod.params_varnames
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		EDIT ITEM:C870(Self:C308->; Self:C308->)
		
	: (Form event code:C388=On Data Change:K2:15)
		params_types{Self:C308->}:=conv_TypeFromVarNameGet(Self:C308->{Self:C308->}; ->conv_types_at; ->conv_typeids_al; ->conv_prefixes_at; ->conv_suffixes_at)
		
		If (params_types{Self:C308->}="") & (helper_Trim(Self:C308->{Self:C308->})#"") & (prefs_ConventionsStrictGet)
			ALERT:C41("The variable name $"+Self:C308->{Self:C308->}+" does not match a convention and you have set coding conventions to be strictly enforced. Please change the name or change your coding convention settings in the UnitTester preferences.")
			EDIT ITEM:C870(Self:C308->; Self:C308->)
		End if 
		
End case 