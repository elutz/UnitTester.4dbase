//%attributes = {"invisible":true}

// User name (OS): Mark Schaake
// Date and time: 04/01/09, 20:24:44
//--------------------------------------------------------------------------------
// Method: helper_RecordToBLOB
// Cycles through the fields of a record and stores values
// in a BLOB. Used by Unit_RecordEqualAssert.
//
//--------------------------------------------------------------------------------
//
//Return Value
C_BLOB:C604($0; $blob)

//Required Parameters
C_POINTER:C301($1; $table_p)

//Optional Parameters
C_LONGINT:C283($2; $recNum_l)
C_POINTER:C301($3; $ignoreFields_app)

//--------------------------------------------------------------------------------
_callstack_push(Current method name:C684)

$table_p:=$1

If (Count parameters:C259>=2)
	$recNum_l:=$2
Else 
	$recNum_l:=Record number:C243($table_p->)
End if 

If (Count parameters:C259>=3)
	$ignoreFields_app:=$3
Else 
	ARRAY POINTER:C280($ignoreFields_ap; 0)
	$ignoreFields_app:=->$ignoreFields_ap
End if 

GOTO RECORD:C242($table_p->; $recNum_l)

C_LONGINT:C283($i)
C_POINTER:C301($field_p; $val_p)

C_TEXT:C284($val_t)
C_BLOB:C604($val_blob)
C_BOOLEAN:C305($val_boo)
C_DATE:C307($val_d)
C_LONGINT:C283($val_l)
C_PICTURE:C286($val_pic)
C_REAL:C285($val_r)
C_TIME:C306($val_time)

$i:=0
For ($i; 1; Get last field number:C255($table_p))
	
	If (Is field number valid:C1000($table_p; $i))
		
		$field_p:=Field:C253(Table:C252($table_p); $i)
		
		If (Find in array:C230($ignoreFields_app->; $field_p)=-1)
			
			Case of 
				: (Type:C295($field_p->)=Is alpha field:K8:1) | (Type:C295($field_p->)=Is text:K8:3)
					$val_p:=->$val_t
				: (Type:C295($field_p->)=Is BLOB:K8:12)
					$val_p:=->$val_blob
				: (Type:C295($field_p->)=Is boolean:K8:9)
					$val_p:=->$val_boo
				: (Type:C295($field_p->)=Is date:K8:7)
					$val_p:=->$val_d
				: (Type:C295($field_p->)=Is integer:K8:5) | (Type:C295($field_p->)=Is longint:K8:6)
					$val_p:=->$val_l
				: (Type:C295($field_p->)=Is picture:K8:10)
					$val_p:=->$val_pic
				: (Type:C295($field_p->)=Is real:K8:4)
					$val_p:=->$val_r
				: (Type:C295($field_p->)=Is time:K8:8)
					$val_p:=->$val_time
			End case 
			
			$val_p->:=$field_p->
			
			VARIABLE TO BLOB:C532($val_p->; $blob; *)
			
		End if 
		
	End if 
	
End for 

_callstack_pop  //keep this at the end of the method

$0:=$blob