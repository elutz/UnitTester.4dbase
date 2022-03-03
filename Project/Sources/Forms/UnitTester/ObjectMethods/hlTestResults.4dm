
// ----------------------------------------------------
// User name (OS): Mark Schaake
// Date and time: 10/29/08, 22:15:50
// ----------------------------------------------------
// Method: Object Method: RunTests.hlTestResults
// Description
//
//
// ----------------------------------------------------
//
//REQUIRED PARAMETERS


//OPTIONAL PARAMETERS


// ----------------------------------------------------

Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		If (List item parent:C633(Self:C308->; *)=0) & (Not:C34(Is compiled mode:C492(*)))
			C_LONGINT:C283($err_l)
			method_Edit(helper_ListItemTextByPosGet(Self:C308->; -1))
		End if 
		
End case 