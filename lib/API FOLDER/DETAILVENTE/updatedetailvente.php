
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    isset($_POST["id_detailVente"]) &&
    isset($_POST["vente_id"]) &&
    isset($_POST["produit_id"]) &&
    isset($_POST["quantite"]) &&
    isset($_POST["prixu"])
) {
    // Assignation des valeurs des paramètres POST
    $id_detailVente = $_POST["id_detailVente"];
    $vente_id = $_POST["vente_id"];
    $produit_id = $_POST["produit_id"];
    $quantite = $_POST["quantite"];
    $prixu = $_POST["prixu"];
    try {
        $sql = "CALL InsertOrUpdateDetailVente (:id_detailVente,:vente_id,:produit_id,:quantite,:prixu)";
        $stmt = $dbconnection->prepare($sql);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
        $stmt->bindParam(':id_detailVente', $id_detailVente);
        $stmt->bindParam(':vente_id', $vente_id);
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
} else {
    echo json_encode(array('error' => 'Paramètres manquants.'));
}
?>


