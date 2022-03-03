//%attributes = {"invisible":true}
//***********************************************************************
// UnitTester method: _setup_license_type
// Method under test: 
// Date created: 05/30/2009, 21:37:17
// Created by: Mark Schaake
//***********************************************************************

//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------
If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	C_TEXT:C284($expected_t; $result_t)  //variables to be passed to assertions
	
	// Parameters: --none--
	
	//Other variables:
	C_TEXT:C284($single_t; $team_t; $demo_t)
	C_BLOB:C604($single_x; $team_x; $demo_x)
	$single_t:="00000000"+Char:C90(67)+Char:C90(71)+Char:C90(66)+Char:C90(68)+Char:C90(69)+Char:C90(71)+Char:C90(70)+Char:C90(67)
	TEXT TO BLOB:C554($single_t; $single_x; UTF8 text without length:K22:17)
	
	$team_t:="00000000"+Char:C90(67)+Char:C90(71)+Char:C90(66)+Char:C90(69)+Char:C90(68)+Char:C90(70)+Char:C90(67)+Char:C90(66)
	TEXT TO BLOB:C554($team_t; $team_x; UTF8 text without length:K22:17)
	
	$demo_t:="00000000ABCDEFGH"
	TEXT TO BLOB:C554($demo_t; $demo_x; UTF8 text without length:K22:17)
	
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("Single license"; Current method name:C684))
	$expected_t:="single"
	$result_t:=setup_license_type($single_x)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

If (Unit_BeginTest("Team license"; Current method name:C684))
	$expected_t:="team"
	$result_t:=setup_license_type($team_x)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

If (Unit_BeginTest("Demo license"; Current method name:C684))
	$expected_t:="demo"
	$result_t:=setup_license_type($demo_x)
	Unit_TextEqualAssert($expected_t; $result_t)
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
End if 
