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
</head>
<body>
<?php
$name = $address = $email = $bank_acc = $mobile_no = $bank_pass = "";
$db = new SQLite3('reg.db');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = test_input($_POST["name"]);
  $address = test_input($_POST["address"]);
  $email = test_input($_POST["email"]);
  $mobile_no = test_input($_POST["mobile_no"]);
  $bank_acc = test_input($_POST["bank_acc"]);
  $bank_pass = test_input($_POST["bank_pass"]);
  
  /*$insres = $db->query($qstr);*/
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<?php




$query = $db->prepare('SELECT * FROM REGISTRATION  WHERE EMAIL_ADDRESS = :e');
$query->bindValue(':e',$_POST['email'],SQLITE3_TEXT);
$results= $query->execute();

if($row = $results->fetchArray())
{ echo "Already Registered";
}
else
{
  $queryt = $db->prepare('SELECT * FROM ACCOUNTS WHERE (BANK_ACCOUNT_NUMBER = :e) AND (BANK_PASSWORD = :p) ');
$queryt->bindValue(':e',$_POST['bank_acc'],SQLITE3_TEXT);
$queryt->bindValue(':p',$_POST['bank_pass'],SQLITE3_TEXT);
$resultst= $queryt->execute();

if($rowt = $resultst->fetchArray())
{ 
  $querym = $db->prepare('SELECT * FROM ACCOUNTS WHERE (BANK_ACCOUNT_NUMBER = :e) AND (BANK_PASSWORD = :p) AND (ACC_BAL>1000)');
$querym->bindValue(':e',$_POST['bank_acc'],SQLITE3_TEXT);
$querym->bindValue(':p',$_POST['bank_pass'],SQLITE3_TEXT);
$resultsm= $querym->execute();

     if($rowm = $resultsm->fetchArray())
{
 
   $queryi = $db->prepare('UPDATE ACCOUNTS SET ACC_BAL = ACC_BAL-1000 WHERE (BANK_ACCOUNT_NUMBER = :e) AND (BANK_PASSWORD = :p) AND (ACC_BAL >1000)');
$queryi->bindValue(':e',$_POST['bank_acc'],SQLITE3_TEXT);
$queryi->bindValue(':p',$_POST['bank_pass'],SQLITE3_TEXT);
$resultsi= $queryi->execute();
$sql =<<<EOF
      INSERT INTO REGISTRATION (NAME, ADDRESS, EMAIL_ADDRESS, MOBILE_NUMBER, BANK_ACCOUNT_NUMBER, BANK_PASSWORD)
      VALUES ('$name', '$address', '$email', '$mobile_no','$bank_acc','$bank_pass' );

      
EOF;

   $ret = $db->exec($sql);
   
   $db->close();
  echo "Registration Successful";
}
      else
{
  echo "Insufficient Balance";
}
       
}
else
{
  echo "Invalid Username/Password";
}

}



?>


<br>
<br>
<center>
<p><br> Go back to Registration Page:<br> <a href="/form.php" title="Some say it's a search engine">Another Registration</a></p>
</center>



</body>
</html>
