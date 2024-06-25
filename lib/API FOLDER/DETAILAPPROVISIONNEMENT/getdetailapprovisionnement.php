<?php
		include('../CONNEXION/Db.php');		
		$db=new Database();
		$result=array();
			$conn = $db->connect();
			$stmt = $conn->query("SELECT * FROM  `vdetailapprovisionnement`");
			$result= $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);			
?>