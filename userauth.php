<?php
$dbhost = 'localhost:3036';
$dbuser = 'root';
$dbpass = '';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
if(! $conn )
{
  die('Could not connect: ' . mysql_error());
}
$u=$_GET['username'];
if ($_GET['type']=="c")
{
$sql = "SELECT Password from CustLogin where Username='$u'";
}
else 
{
$sql = "SELECT Password from EmpLogin where Username='$u'";
}

mysql_select_db('Bank');
$retval = mysql_query( $sql, $conn );
if(! $retval )
{
  die('Could not get data: ' . mysql_error());
}
while($row = mysql_fetch_array($retval, MYSQL_ASSOC))
{
   if ($_GET['password']==$row['Password'])
{
echo "true";
if ($_GET['type']!="c")
{

$sql = "UPDATE `EmpLogin` SET `loggedIn`=1 WHERE username='$u'";
mysql_select_db('Bank');
$retval = mysql_query( $sql, $conn );

}
}
else {echo "false";}


} 

mysql_close($conn);
?>
