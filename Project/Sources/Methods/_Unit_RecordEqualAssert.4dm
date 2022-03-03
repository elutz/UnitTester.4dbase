//%attributes = {"invisible":true}
//***********************************************************************
//* UnitTester method: _Unit_RecordEqualAssert                          *
//* Method under test: Unit_RecordEqualAssert                           *
//* Date created: 04/01/2009                                            *
//* Created by: Mark Schaake                                            *
//***********************************************************************


//SETUP -----------------------------------------------------------------
//Define variables, create temporary documents, etc. that will be used by the tests
START TRANSACTION:C239  //use a transaction if you are modifying data. Cancel in TEAR DOWN

READ WRITE:C146([test_table:1])
ALL RECORDS:C47([test_table:1])
DELETE SELECTION:C66([test_table:1])

CREATE RECORD:C68([test_table:1])
SAVE RECORD:C53([test_table:1])

CREATE RECORD:C68([test_table:1])
SAVE RECORD:C53([test_table:1])

ARRAY POINTER:C280($ignorFields_ap; 0)
APPEND TO ARRAY:C911($ignorFields_ap; ->[test_table:1]id:1)

//SETUP END -------------------------------------------------------------


//TESTS -----------------------------------------------------------------
//Write your tests here. Each test is declared by a call to:
//Unit_BeginTest(<test name here>;Current method name)
//After a test is declared, make assertions e.g. Unit_TrueAssert(...)

//As the default, we make the test fail. Replace this with your tests.
Unit_BeginTest("Equal fields ignoring primary key returns equal"; Current method name:C684)
ALL RECORDS:C47([test_table:1])
Unit_RecordEqualAssert(->[test_table:1]; 1; 2; ->$ignorFields_ap)

Unit_BeginTest("Equal fields not ignoring primary key returns unequal"; Current method name:C684)
ALL RECORDS:C47([test_table:1])
Unit_RecordNotEqualAssert(->[test_table:1]; 1; 2)

//TESTS END -------------------------------------------------------------


//TEAR DOWN -------------------------------------------------------------
//Delete temporary documents, clear arrays, blobs, pictures, etc.
CANCEL TRANSACTION:C241

//TEAR DOWN END ---------------------------------------------------------