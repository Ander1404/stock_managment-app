<?php
include('../CONNEXION/Db.php');		
$db=new Database();
$date=$_POST['id'];
$result=array();
    $conn = $db->connect();
    $stmt = $conn->query("SELECT SUM(`prix_total`) as totalv FROM  `vdetailvente` where `datevente`=$date");
    // $stmt->bindParam(':id', $id);
    $result= $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
?>