<?php
	include('../CONNEXION/connexion.php');
	include('../CONNEXION/Db.php');
		$rqt="SELECT * FROM  `categorieproduit`";
        $db=new Database();
		$result=array();
			$conn = $db->connect();
			$stmt = $conn->query("SELECT * FROM  `categorieproduit`");
			$result= $stmt->fetchAll(PDO::FETCH_ASSOC);
			
        
        
		
		// while($fetchData=$rqt2->fetch_assoc()){
		// 	$result[]=$fetchData;
		// }
		echo json_encode($result);		
?>