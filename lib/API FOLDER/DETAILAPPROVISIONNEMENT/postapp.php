<?php
include('../CONNEXION/connexion.php');
    
        $approvisionnement_id = $_POST['vente_id'];
            $produit_id = $_POST['produit_id'];
            $quantite=$_POST['quantite'];
            $prixu=$_POST['prixu'];
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
            echo json_encode(array('message' => 'True'));
        } else {
            throw new Exception("Échec de l'exécution de la requête.");
        }
    
?>


