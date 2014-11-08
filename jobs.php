<?php

$dbhost = 'localhost:3306';
$dbuser = 'root';
$dbpass = '';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
if(! $conn )
{
  die('Could not connect: ' . mysql_error());
}
$jobtype=$_GET['jobtype'];
$timeslot=$_GET['timeslot'];
$custid=$_GET['custid'];

$sql = "SELECT EmpId from EmpLogin where loggedIn=1";

mysql_select_db('Bank');
$retval = mysql_query( $sql, $conn );

while($row = mysql_fetch_array($retval, MYSQL_ASSOC))
{
$empid=$row['EmpId'];
break;
}

$sql = "SELECT DeptId from dept where DeptName='$jobtype'";

$retval = mysql_query( $sql, $conn );

while($row = mysql_fetch_array($retval, MYSQL_ASSOC))
{
$deptid=$row['DeptId'];
break;
}

$sql="INSERT INTO `job`(`JobId`, `CustId`, `AssignedEmpId`, `InTime`, `OutTime`, `Pan`, `DeptId`) VALUES (0,$custid,$empid,'$timeslot','$timeslot','',$deptid)";



$retval = mysql_query( $sql, $conn );


mysql_close($conn);

?>