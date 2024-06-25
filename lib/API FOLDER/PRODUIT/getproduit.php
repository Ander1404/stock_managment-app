<?php
	// include('../CONNEXION/connexion.php');

		
		include('../CONNEXION/Db.php');
		// $rqt="";
		
		$db=new Database();
		$result=array();
			$conn = $db->connect();
			$stmt = $conn->query("SELECT * FROM  `vproduit`");
			$result= $stmt->fetchAll(PDO::FETCH_ASSOC);
			
		echo json_encode($result);	
		
		
?>