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
$id = $pass = "";
$db = new SQLite3('reg.db');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $id = test_input($_POST["id"]);
  $pass = test_input($_POST["pass"]);
  
  
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

error_reporting(E_ERROR | E_PARSE);

    $id=$_REQUEST['id']; 
    $pass=$_REQUEST['pass']; 
    
   
?>
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
  /* if(!$db){
      echo $db->lastErrorMsg();
   } else {
      echo "Opened database successfully\n";
   }*/	
  
  $query = $db->prepare('SELECT * FROM ADMIN  WHERE (LOGIN_ID=:e) AND (PASSWORD=:p)');
$query->bindValue(':e',$_POST['id'],SQLITE3_TEXT);
$query->bindValue(':p',$_POST['pass'],SQLITE3_TEXT);
$results= $query->execute();


if($row = $results->fetchArray())
{   echo "<br> NAME      ADDRESS         EMAIL_ADDRESS        MOBILE_NUMBER        BANK_ACCOUNT_NUMBER";

$queryi = $db->prepare('SELECT NAME,ADDRESS,EMAIL_ADDRESS,MOBILE_NUMBER,BANK_ACCOUNT_NUMBER FROM REGISTRATION ');
/*$queryi->bindValue(':e',$_POST['id'],SQLITE3_TEXT);
$queryi->bindValue(':p',$_POST['pass'],SQLITE3_TEXT);*/
$resultsi= $queryi->execute();

    while ($rowi = $resultsi->fetchArray()) {
	    echo "<br> $rowi[0]       $rowi[1]      $rowi[2]      $rowi[3]     $rowi[4]";
}
}
else
{
   echo "UnAuthorised Access";
}
  /* if(!$ret){
      echo $db->lastErrorMsg();
   } else {
      echo "Table created successfully\n";
   }*/

 $db->close();



?>


<br>
<br>
<center>
<p><br> Go back to Registration Page:<br> <a href="/form.php" title="Some say it's a search engine">Another Registration</a></p>
</center>



</body>
</html>
