//%attributes = {"invisible":true}
//UNIT TEST SETUP UNIT
C_TEXT:C284($email_t)


If (Unit_BeginTest("Valid email"; Current method name:C684))
	$email_t:="mark@schaakeconsulting.com"
	Unit_TrueAssert(helper_IsValidEmail($email_t); $email_t+" was not valid")
End if 

If (Unit_BeginTest("Valid email with period"; Current method name:C684))
	$email_t:="mark.schaake@gmail.com"
	Unit_TrueAssert(helper_IsValidEmail($email_t); $email_t+" was not valid")
End if 

If (Unit_BeginTest("Invalid email, bad character"; Current method name:C684))
	$email_t:="mark`@schaakeconsulting.com"
	Unit_FalseAssert(helper_IsValidEmail($email_t); $email_t+" was valid")
End if 

If (Unit_BeginTest("Invalid email, no @ sign"; Current method name:C684))
	$email_t:="markschaakeconsulting.com"
	Unit_FalseAssert(helper_IsValidEmail($email_t); $email_t+" was valid")
End if 

If (Unit_BeginTest("Invalid email, suffix too short"; Current method name:C684))
	$email_t:="mark@schaakeconsulting.c"
	Unit_FalseAssert(helper_IsValidEmail($email_t); $email_t+" was valid")
End if 

If (Unit_BeginTest("Invalid email, suffix too long"; Current method name:C684))
	$email_t:="mark@schaakeconsulting.commm"
	Unit_FalseAssert(helper_IsValidEmail($email_t); $email_t+" was valid")
End if 
//TEAR DOWN UNIT