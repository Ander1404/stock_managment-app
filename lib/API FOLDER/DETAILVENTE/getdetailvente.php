<?php
        include('../CONNEXION/Db.php');		
			$db=new Database();
			$n=$_POST['id'];
			$result=array();
				$conn = $db->connect();
				$stmt = $conn->query("SELECT * FROM  `vdetailvente` where id_detailVente=1");
				$result= $stmt->fetchAll(PDO::FETCH_ASSOC);
			echo json_encode($result);	
			// $r= json_decode($v);	
?>