<!DOCTYPE html>
<html>
<head>
<title> CS-251A: LET'S BUILD STUFF! EVENT REGISTRATION </title>
<center>
CS-251A: LET'S BUILD STUFF! EVENT REGISTRATION
</center><br>
<br>
<br>
<br>
 
<script>
function validateForm() {
    var x = document.forms["myForm"]["name"].value;
    var y = document.forms["myForm"]["address"].value;
    var z = document.forms["myForm"]["email"].value;
    var a = document.forms["myForm"]["mobile_no"].value;
    var b = document.forms["myForm"]["bank_acc"].value;
    var c = document.forms["myForm"]["bank_pass"].value;
    var errmes = "";
    if (x == "") {
        errmes = errmes + "*Name field must not be empty.\n";
        //return false;
    }
   /* else if (x.length > 20 && x.search(/^[a-zA-Z ]*$/) == -1 ) {
        alert("1.Name should be of max. 20 characters including spaces.\n2.Only English characters and spaces allowed.");
        return false; 
    }*/
    if (x.length > 20) {
        errmes = errmes + "*Name should be of max. 20 characters including spaces.\n";
       // return false;
    } 
    if (x.search(/^[a-zA-Z ]*$/) == -1) {
        errmes = errmes + "*Only English characters and spaces allowed in Name.\n";
        //return false;
    }
    if (y == "") {
        errmes = errmes + "*Address field must not be empty.\n";
    }
    if (y.length > 100) {
        errmes = errmes + "*Address should be of max. 100 characters.\n";
    }
    if (z == "") {
        errmes = errmes + "*E-mail Address field must not be empty.\n";
    }
    else if (z.search(/^[a-zA-Z]*@[a-zA-Z]*\.com$/) == -1) {
        errmes = errmes + "*E-mail Address should be of the form: someone@xyz.com\nwhere 'someone' & 'xyz' should consist of only English alphabets.\n";
    }
    if (a == "") {
        errmes = errmes + "*Mobile Number field must not be empty.\n";
    }
    else if (a.search(/^[1-9][0-9]{9}$/) == -1) {
        errmes = errmes + "*Mobile Number should be 10-digit numeric value.\n";
    }
     if (b == "") {
        errmes = errmes + "*Bank Account Number field must not be empty.\n";
    }
    else if (b.search(/^[1-9][0-9]{4}$/) == -1) {
        errmes = errmes + "*Bank Account Number should be 5-digit numeric value.\n";
    }
    
    if (c.length > 20) {
        errmes = errmes + "*Bank Password should be of max. 20 characters.\n";
       // return false;
    }
    if (c == "") {
       errmes = errmes + "*Bank Password field must not be empty.\n";
    }


else if (c.search(/^[a-zA-Z0-9]*$/) == -1) {
        errmes = errmes + "*Bank Password should consist of only alphanumeric characters.\n";
        //return false;
    }
    if(errmes!="") {
        alert(errmes);
        return false;
    }
    else
    {
    return true;
    }
   
    //return false;
}
</script>
</head>
<body>

<?php
 error_reporting(E_ERROR | E_PARSE);
   class MyDB extends SQLite3
   {
      function __construct()
      {
         $this->open('reg.db');
      }
   }
   $db = new MyDB();
   /*if(!$db){
      echo $db->lastErrorMsg();
   } else {
      echo "Opened database successfully\n";
   }*/	
  
   $sql =<<<EOF
      CREATE TABLE REGISTRATION
      (NAME                 TEXT  NOT NULL,
       ADDRESS              CHAR(100) NOT NULL,
       EMAIL_ADDRESS       TEXT  NOT NULL,
       MOBILE_NUMBER        INT   NOT NULL,
       BANK_ACCOUNT_NUMBER  INT   NOT NULL,
       BANK_PASSWORD        TEXT  NOT NULL);

       CREATE TABLE ACCOUNTS
      (BANK_ACCOUNT_NUMBER  INT   NOT NULL,
       BANK_PASSWORD        TEXT  NOT NULL,
       ACC_BAL              INT   NOT NULL);
      
      CREATE TABLE ADMIN
      (LOGIN_ID         TEXT   NOT NULL,
       PASSWORD         TEXT   NOT NULL);
EOF;

   $ret = $db->exec($sql);
  /*if(!$ret){
      echo $db->lastErrorMsg();
   } else {
      echo "Table created successfully\n";
   }*/

 

?>

<center>
 
   
    <form name="myForm" action="/action.php" onsubmit="return validateForm()"   
          method="POST" enctype="multipart/form-data"> 
    <input type="hidden" name="action" value="submit"> 
   
    NAME:<br> 
    <input name="name" type="text" value="" size="30"/><br> 

    ADDRESS:<br> 
    <textarea name="address" rows="4" cols="25"></textarea><br>
       
    E-MAIL ADDRESS:<br> 
    <input name="email" type="text" value="" size="30"/><br> 
    
    MOBILE NUMBER:<br>
    <input name="mobile_no" type="int" value="" size="30"/><br> 
 
    BANK ACCOUNT NUMBER:<br>
    <input name="bank_acc" type="int" value="" size="30"/><br> 
    
    BANK PASSWORD:<br>
    <input name="bank_pass" type="password" value="" size="30"/><br> 
    <br>
    <br>  
      
    <input type="submit" value="Submit"/> 
    <input type="reset" value="Reset"/>
    </form> 
    
    <br>
    <br>
    <br>
    
</center>

 <?php 

    $name=$_REQUEST['name']; 
    $address=$_REQUEST['address']; 
    $email=$_REQUEST['email']; 
    $mobile_no=$_REQUEST['mobile_no']; 
    $bank_acc=$_REQUEST['bank_acc'];
    $bank_pass=$_REQUEST['bank_pass'];


   $sql =<<<EOF
     /* INSERT INTO REGISTRATION (NAME, ADDRESS, EMAIL_ADDRESS, MOBILE_NUMBER, BANK_ACCOUNT_NUMBER, BANK_PASSWORD)
      VALUES ('$name', '$address', '$email', '$mobile_no','$bank_acc','$bank_pass' );*/
      INSERT INTO ACCOUNTS (BANK_ACCOUNT_NUMBER, BANK_PASSWORD, ACC_BAL)
      VALUES (12345,'pass',1234 );

      INSERT INTO ACCOUNTS (BANK_ACCOUNT_NUMBER, BANK_PASSWORD, ACC_BAL)
      VALUES (13720,'pass1',234 );

      INSERT INTO ADMIN (LOGIN_ID,PASSWORD)
      VALUES ('radhit','radhit9');


      
EOF;

   $ret = $db->exec($sql);
  /* if(!$ret){
    echo $db->lastErrorMsg();
   } else {
     echo "Records created successfully\n";
   }*/
   $db->close();
?>
<center>
<p>FOR ADMINISTRATORS:<br> To view all registrations, <a href="/registration.php" title="Some say it's a search engine">See all Registrations</a></p>
</center>


</body>
</html>

