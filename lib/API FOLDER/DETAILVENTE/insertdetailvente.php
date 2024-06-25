
<?php
include('../CONNEXION/connexion.php');

// Vérification de l'existence des paramètres POST
$vente_id = $_POST['vente_id'];
$produit_id = $_POST['produit_id'];
$quantite=$_POST['quantite'];
$prixu=$_POST['prixu'];
            $sql1 = "CALL InsertOrUpdateDetailVente (null,:vente_id,:produit_id,:quantite,:prixu);
            CALL sp_transaction_stock (:produit_id,:quantite,:prixu,'SORTIE')";
            $stmt = $dbconnection->prepare($sql1);
            if ($stmt === false) {
                throw new Exception("Erreur de préparation de la requête.");
            }
            // Liaison des paramètres
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

?>


