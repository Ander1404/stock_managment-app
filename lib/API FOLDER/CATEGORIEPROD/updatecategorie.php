
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    isset($_POST["designation"])
) {
    // Assignation des valeurs des paramètres POST
    $designation = $_POST["designation"];
    $id_categorie = $_POST["id_categorie"];
    try {
        $sql = "CALL InsertOrUpdateCategorieProduit (:id_categorie,:designation)";
        $stmt = $dbconnection->prepare($sql);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
        $stmt->bindParam(':designation', $designation);
        $stmt->bindParam(':id_categorie', $id_categorie);

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


