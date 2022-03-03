//%attributes = {"invisible":true}

// ----------------------------------------------------
// User name (OS): Lutz.Epperlein
// Date and time: 27.09.21, 15:34:53
// ----------------------------------------------------
// Method: helper_ListSetExpandedStatus
// Description
// Sets the expanded status of items
//
// Parameters
// ----------------------------------------------------
#DECLARE($listRef : Integer; $expandedStatus : Collection)

For each ($item; $expandedStatus)
	SET LIST ITEM:C385($listRef; $item.ref; $item.text; $item.ref; $item.sublist; $item.expanded)
End for each 
