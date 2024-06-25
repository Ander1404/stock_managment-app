<?php
    $hostname='localhost';
    $username="root";
    $password="";
    $db="db_gestion_stock";
    try{
        $dbconnection= new PDO("mysql:host=localhost;dbname=".$db,$username,$password);
        $dbconnection->exec("set names utf8");
        $dbconnection->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        return $dbconnection;
    }
    catch(PDOException $ex){
        echo 'connection faild: '.$ex->getMessage();
    }
?>