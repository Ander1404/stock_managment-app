<?php
	include('../CONNEXION/connexion.php');
	include('../CONNEXION/Db.php');

		
		$db=new Database();
		$result=array();
			$conn = $db->connect();
			$stmt = $conn->query("SELECT id_client,noms,telephone,adresse,mail FROM `tclient` ");
			$result= $stmt->fetchAll(PDO::FETCH_ASSOC);
			
		echo json_encode($result);	
		
		
?>