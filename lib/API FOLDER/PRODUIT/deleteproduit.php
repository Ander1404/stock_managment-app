<?php
    include('../CONNEXION/connexion.php');
?>
<?php
    $id_produit=htmlspecialchars($_POST['id_produit']);
    $stmt=$dbconnection->prepare("DELETE FROM `produit` WHERE id_produit=:id_produit");
    $stmt->bindParam("id_produit", $id_produit,PDO::PARAM_STR);
    
    $stmt->execute();
    $status= 'succes';
    echo json_encode(array("response"=>$status));
?>