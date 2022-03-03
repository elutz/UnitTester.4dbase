//%attributes = {"invisible":true}
//***********************************************************************
//* UnitTester method: _suite_PositionInList                            *
//* Method under test: suite_PositionInList                             *
//* Date created: 04/04/2009                                            *
//* Created by: Mark Schaake                                            *
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	C_LONGINT:C283($list_l; $pos_l)
	C_TEXT:C284($prefix_t)
	C_TEXT:C284($unit_tester_text)
	
	$unit_tester_text:=Document to text:C1236(paths_TestFileGet)
	
	$list_l:=New list:C375
	$pos_l:=suite_AddTestSuite("Suite 1"; $list_l)
	$pos_l:=suite_AddTestSuite("Suite 2"; $list_l)
	$pos_l:=suite_AddTestSuite("Suite 3"; $list_l)
	$prefix_t:=conv_TestCaseMethodPrefixGet
	suite_AddTestCase($prefix_t; 3; $list_l)
	_E_Initialize
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Suite not found returns 0"; Current method name:C684))
	Unit_IntegerEqualAssert(0; suite_PositionInList($list_l; "Suite 4"))
	Unit_FalseAssert(_E_Catch)
End if 

If (Unit_BeginTest("Suite found returns position > 0"; Current method name:C684))
	Unit_IntegerEqualAssert(1; suite_PositionInList($list_l; "Suite 1"))
	Unit_FalseAssert(_E_Catch)
	Unit_IntegerEqualAssert(2; suite_PositionInList($list_l; "Suite 2"))
	Unit_FalseAssert(_E_Catch)
	Unit_IntegerEqualAssert(3; suite_PositionInList($list_l; "Suite 3"))
	Unit_FalseAssert(_E_Catch)
End if 

If (Unit_BeginTest("Match found but not suite returns 0"; Current method name:C684))
	Unit_IntegerEqualAssert(0; suite_PositionInList($list_l; $prefix_t))
	Unit_TrueAssert(_E_Catch("got test when expected suite item"))
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	//CANCEL TRANSACTION `cancel a transactionto automatically delete all records created in the test.
	CLEAR LIST:C377($list_l)
	TEXT TO DOCUMENT:C1237(paths_TestFileGet; $unit_tester_text)
End if 