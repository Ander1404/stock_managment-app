
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    isset($_POST["id_approvionnement"]) &&
    isset($_POST["fournisseur_id"]) 
) {
    // Assignation des valeurs des paramètres POST
    $fournisseur_id = $_POST["fournisseur_id"];
    $id_approvionnement = $_POST["id_approvionnement"];
    try {
        $sql = "CALL InsertOrUpdateApprovionnement (:id_approvionnement,:fournisseur_id)";
        $stmt = $dbconnection->prepare($sql);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
        $stmt->bindParam(':fournisseur_id', $fournisseur_id);
        $stmt->bindParam(':id_approvionnement', $id_approvionnement);
        // Exécution de la requête
        if ($stmt->execute()) {
            echo json_encode(array('message' => 'Mise à jour réussie.'));
        } else {
            throw new Exception("Échec de l'exécution de la requête.");
        }
    } catch (Exception $e) {
        echo json_encode(array('error' => $e->getMessage()));
    }
} else {
    echo json_encode(array('error' => 'Paramètres manquants.'));
}
?>


