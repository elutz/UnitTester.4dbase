//%attributes = {"invisible":true}
//-----------------------------------------------------------------------
//@Setup Fixtures // Define variables, create temporary records, etc.
//-----------------------------------------------------------------------

If (True:C214)
	START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in @Tear Down
	Unit_Mock_Setup  //to preserve sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
	
	C_TEXT:C284($method_t)
	C_BOOLEAN:C305($returnValue_b)
End if 

//-----------------------------------------------------------------------
//@Tests // Write your tests here.
//-----------------------------------------------------------------------
If (Unit_BeginTest("default test"; Current method name:C684))
	$method_t:="sollteEsNichtGeben"
	$returnValue_b:=method_doesExist($method_t)
	
	Unit_FalseAssert($returnValue_b; $method_t+" soll nicht existieren.")
	
	$method_t:=Current method name:C684
	$returnValue_b:=method_doesExist($method_t)
	
	Unit_TrueAssert($returnValue_b; $method_t+" existiert!")
	
End if 

//-----------------------------------------------------------------------
//@Tear Down // Delete temporary records, clear process vars, etc.
//-----------------------------------------------------------------------
If (True:C214)
	CANCEL TRANSACTION:C241  //automatically delete all records created in the test (requires call to START TRANSACTION at beginning)
	Unit_Mock_TearDown  //restore sequence numbers on tables for which records are added with Unit_Mock_RecordCreate
End if 