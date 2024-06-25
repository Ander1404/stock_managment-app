
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    isset($_POST["datadetail"])
) {
    // Assignation des valeurs des paramètres POST
    $json_data=$_POST["datadetail"];
    $data = json_decode($json_data, true);
    foreach ($data as $info) {
    try { 
        $approvisionnement_id = $info['vente_id'];
            $produit_id = $info['produit_id'];
            $quantite=$info['quantite'];
            $prixu=$info['prixu'];
        $sql1 = "CALL InsertOrUpdateDetailApprovisionnement (null,:approvisionnement_id,:produit_id,:quantite,:prixu);
        CALL sp_transaction_stock (:produit_id,:quantite,:prixu,'ENTREE')";
        $stmt = $dbconnection->prepare($sql1);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
        $stmt->bindParam(':approvisionnement_id', $approvisionnement_id);
        $stmt->bindParam(':produit_id', $produit_id);
        $stmt->bindParam(':quantite', $quantite);
        $stmt->bindParam(':prixu', $prixu);
        // Exécution de la requête
        if ($stmt->execute()) {
            echo json_encode(array('message' => 'Mise à jour réussie.'));
        } else {
            throw new Exception("Échec de l'exécution de la requête.");
        }
    } catch (Exception $e) {
        echo json_encode(array('error' => $e->getMessage()));
    }
}
} else {
    echo json_encode(array('error' => 'Paramètres manquants.'));
}
?>


