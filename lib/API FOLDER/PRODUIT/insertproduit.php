
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    isset($_POST["categorie_id"]) &&
    isset($_POST["designation"])
) {
    // Assignation des valeurs des paramètres POST
$image1 = pathinfo($_FILES['image1']['name']);
$ext1 = $image1['extension'];
$name1 = $image1['filename'].".".$ext1;
$target1 = 'images/'.$name1;
move_uploaded_file($_FILES['image1']['tmp_name'], $target1);

    $categorie_id = $_POST["categorie_id"];
    $designation = $_POST["designation"];
    $quantite = 0;
    $prixu = 0;
    try {
        $sql = "CALL InsertOrUpdateProduit (null,:categorie_id,:designation,:quantite,:prixu,:image)";
        $stmt = $dbconnection->prepare($sql);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
        $stmt->bindParam(':categorie_id', $categorie_id);
        $stmt->bindParam(':designation', $designation);
        $stmt->bindParam(':quantite', $quantite);
        $stmt->bindParam(':prixu', $prixu);
        $stmt->bindParam(':image', $target1);

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


