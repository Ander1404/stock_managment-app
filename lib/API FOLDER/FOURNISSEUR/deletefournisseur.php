<?php
    include('../CONNEXION/connexion.php');
?>
<?php
    $id_client=htmlspecialchars($_POST['id_fournisseur']);
    $stmt=$dbconnection->prepare("DELETE FROM `tfournisseur` WHERE id_fournisseur=:id_fournisseur");
    $stmt->bindParam("id_fournisseur", $id_client,PDO::PARAM_STR);
    
    $stmt->execute();
    $status= 'succes';
    echo json_encode(array("response"=>$status));
?>