<?php
    include('../CONNEXION/connexion.php');
?>
<?php
    $id_detailvente=htmlspecialchars($_POST['id_detailvente']);
    $stmt=$dbconnection->prepare("DELETE FROM `detail_vente` WHERE id_detailVente=:id_detailvente");
    $stmt->bindParam("id_detailvente", $id_detailapprovionnement,PDO::PARAM_STR);
    
    $stmt->execute();
    $status= 'succes';
    echo json_encode(array("response"=>$status));
?>