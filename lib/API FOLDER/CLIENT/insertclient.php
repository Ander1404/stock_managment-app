
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
if (
    //isset($_POST["id_client"]) &&
    isset($_POST["noms"]) &&
    isset($_POST["telephone"]) &&
    isset($_POST["adresse"]) &&
    isset($_POST["mail"])
) {
    // Assignation des valeurs des paramètres POST
    //$id_client = $_POST["id_client"];
    $nom = $_POST["noms"];
    $numero = $_POST["telephone"];
    $adresse = $_POST["adresse"];
    $mail = $_POST["mail"];
    try {
        
        $sql = "CALL InsertOrUpdateClient (null,:noms,:telephone,:adresse,:mail)";
        $stmt = $dbconnection->prepare($sql);
        // Vérification de la préparation de la requête
        if ($stmt === false) {
            throw new Exception("Erreur de préparation de la requête.");
        }
        // Liaison des paramètres
       // $stmt->bindParam(':id_client', $id_client);
        $stmt->bindParam(':noms', $nom);
        $stmt->bindParam(':telephone', $numero);
        $stmt->bindParam(':adresse', $adresse);
        $stmt->bindParam(':mail', $mail);

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


