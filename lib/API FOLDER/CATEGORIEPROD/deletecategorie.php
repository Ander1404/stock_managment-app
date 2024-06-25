<?php
    include('../CONNEXION/connexion.php');
?>
<?php
    $id_categorie=$_POST['id'];
    $stmt=$dbconnection->prepare("DELETE FROM `categorieproduit` WHERE id_categorie=:id_categorie");   
    
    $stmt->bindParam("id_categorie", $id_categorie,PDO::PARAM_STR);
    
    $stmt->execute();
    $status= 'succes';
    echo json_encode(array("response"=>$status));
?>