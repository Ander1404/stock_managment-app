<?php
    include('../CONNEXION/connexion.php');
?>
<?php
    $id_client=htmlspecialchars($_POST['id_client']);
    $stmt=$dbconnection->prepare("DELETE FROM `tclient` WHERE id_client=:id_client");
    $stmt->bindParam("id_client", $id_client,PDO::PARAM_STR);
    
    $stmt->execute();
    $status= 'succes';
    echo json_encode(array("response"=>$status));
?>