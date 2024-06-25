<?php
    include('../CONNEXION/connexion.php');
?>
<?php
    $id_detailapprovionnement=htmlspecialchars($_POST['id_detailapprovionnement']);
    $stmt=$dbconnection->prepare("DELETE FROM `detail_approvisionnement` WHERE id_detailApprovionnement=:id_detailapprovionnement");
    $stmt->bindParam("id_detailapprovionnement", $id_detailapprovionnement,PDO::PARAM_STR);
    
    $stmt->execute();
    $status= 'succes';
    echo json_encode(array("response"=>$status));
?>