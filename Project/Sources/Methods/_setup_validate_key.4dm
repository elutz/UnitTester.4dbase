//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _setup_validate_key
// Method under test: 
// Date created: 05/30/2009, 14:54:36
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	C_BOOLEAN:C305($expected_boo; $result_boo)  //variables to be passed to assertions
	
	// Parameters: 
	C_TEXT:C284($invalidKey_t; $validKey_t)
	
	//Other variables:
	$validKey_t:="00000000"+Char:C90(16387)+Char:C90(16391)+Char:C90(16386)+Char:C90(16388)+Char:C90(16389)+Char:C90(16391)+Char:C90(16390)+Char:C90(16387)
	$invalidKey_t:="00000000"+Char:C90(16387)+Char:C90(16391)+Char:C90(16386)+Char:C90(16388)+Char:C90(16389)+Char:C90(16391)+Char:C90(16390)+Char:C90(16388)
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Valid key"; Current method name:C684))
	Unit_TrueAssert(setup_validate_key($validKey_t))
End if 

If (Unit_BeginTest("Invalid key"; Current method name:C684))
	Unit_FalseAssert(setup_validate_key($invalidKey_t))
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
