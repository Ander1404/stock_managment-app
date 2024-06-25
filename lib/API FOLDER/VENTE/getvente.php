<?php
	include('../CONNEXION/connexion.php');

		$sql="SELECT * FROM  `vvente`";
		include('../CONNEXION/Db.php');

		
		$db=new Database();
		$result=array();
			$conn = $db->connect();
			$stmt = $conn->query("SELECT id_vente,client,date_vente FROM  `vvente`");
			$result= $stmt->fetchAll(PDO::FETCH_ASSOC);			
		echo json_encode($result);	

?>