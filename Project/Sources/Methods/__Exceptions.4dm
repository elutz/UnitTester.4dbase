//%attributes = {"invisible":true}
//***********************************************************************
//* UnitTester method: _Exceptions                                      *
//* Method under test:                                                  *
//* Date created: 03/31/2009                                            *
//* Created by: Mark Schaake                                            *
//***********************************************************************


//SETUP -----------------------------------------------------------------
//Define variables, create temporary documents, etc. that will be used by the tests
//START TRANSACTION `use a transaction if you are modifying data. Cancel in TEAR DOWN
Unit_CustomLogTextSet("this is some good user data"; Current method name:C684)
//SETUP END -------------------------------------------------------------


//TESTS -----------------------------------------------------------------

Unit_BeginTest("E_Try returns true when no exceptions have been thrown"; Current method name:C684)
Unit_TrueAssert(_E_Try)

Unit_BeginTest("E_Catch returns false when no exceptions have been thrown"; Current method name:C684)
Unit_FalseAssert(_E_Catch("@"))

//Throw an exception
_E_Throw("my exception")

Unit_BeginTest("E_Try returns false when an exception has been thrown"; Current method name:C684)
Unit_FalseAssert(_E_Try)

Unit_BeginTest("E_Catch returns false when no match"; Current method name:C684)
Unit_FalseAssert(_E_Catch("your exception"))

Unit_BeginTest("E_Catch returns true when an exception has been thrown"; Current method name:C684)
Unit_TrueAssert(_E_Catch)

Unit_BeginTest("E_Try returns true after an exception has been caught"; Current method name:C684)
Unit_TrueAssert(_E_Try)

Unit_BeginTest("E_Catch returns false after an exception has been caught"; Current method name:C684)
Unit_FalseAssert(_E_Catch)

//Throw an exception
_E_Throw("my exception")
Unit_BeginTest("E_Catch('my exception') returns true when an exception has been thrown"; Current method name:C684)
Unit_TrueAssert(_E_Catch("my exception"))

//TESTS END -------------------------------------------------------------


//TEAR DOWN -------------------------------------------------------------
//Delete temporary documents, clear arrays, blobs, pictures, etc.
//CANCEL TRANSACTION

//TEAR DOWN END ---------------------------------------------------------