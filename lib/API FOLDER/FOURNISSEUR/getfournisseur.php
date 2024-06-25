<?php
	include('../CONNEXION/connexion.php');
	include('Db.php');

	$db=new Database();
	$result=array();
		$conn = $db->connect();
		$stmt = $conn->query("SELECT id_fournisseur,noms,telephone,adresse,mail FROM `tfournisseur` ");
		$result= $stmt->fetchAll(PDO::FETCH_ASSOC);
		
	
	
	
	// while($fetchData=$rqt2->fetch_assoc()){
	// 	$result[]=$fetchData;
	// }
	echo json_encode($result);	
?>