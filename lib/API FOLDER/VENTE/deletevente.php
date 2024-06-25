<?php
    include('../CONNEXION/connexion.php');
?>
<?php
    $id_vente=$_POST['id'];
    $stmt=$dbconnection->prepare("DELETE FROM `vente` WHERE id_vente=:id_vente");
    $stmt->bindParam("id_vente", $id_vente,PDO::PARAM_STR);
    
    $stmt->execute();
    $status= 'succes';
    echo json_encode(array("response"=>$status));
?>