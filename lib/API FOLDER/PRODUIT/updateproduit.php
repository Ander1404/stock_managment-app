
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    isset($_POST["id_produit"]) &&
    isset($_POST["categorie_id"]) &&
    isset($_POST["designation"]) &&
    isset($_POST["quantite"]) &&
    isset($_POST["prixu"])
) {
    // Assignation des valeurs des paramètres POST
    $id_produit = $_POST["id_produit"];
    $categorie_id = $_POST["categorie_id"];
    $designation = $_POST["designation"];
    $quantite = $_POST["quantite"];
    $prixu = $_POST["prixu"];
    try {
        $sql = "CALL InsertOrUpdateProduit (:id_produit,:categorie_id,:designation,:quantite,:prixu)";
        $stmt = $dbconnection->prepare($sql);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
        $stmt->bindParam(':id_produit',$id_produit);
        $stmt->bindParam(':categorie_id', $categorie_id);
        $stmt->bindParam(':designation', $designation);
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


