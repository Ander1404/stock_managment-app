
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    isset($_POST["id_vente"]) &&
    isset($_POST["client_id"]) 
) {
    // Assignation des valeurs des paramètres POST
    $client_id = $_POST["client_id"];
    $id_vente = $_POST["id_vente"];
    try {
        $sql = "CALL InsertOrUpdateVente (:id_vente,:client_id)";
        $stmt = $dbconnection->prepare($sql);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
        $stmt->bindParam(':client_id', $client_id);
        $stmt->bindParam(':id_vente', $id_vente);
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


