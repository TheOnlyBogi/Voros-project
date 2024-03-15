<?php

session_start();

if (isset($_SESSION["user_id"])) {
    
    $mysqli = require __DIR__ . "/database.php";
    
    $sql = "SELECT * FROM user
            WHERE id = {$_SESSION["user_id"]}";
            
    $result = $mysqli->query($sql);
    
    $user = $result->fetch_assoc();
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>FőFőoldal</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        <?php include "style.css" ?>
    </style>
</head>
<body>  
        <div class="login-signup_logout">
            <?php if (isset($user)): ?>

                <p>Üdvözlünk a TopPet oldalán <?= htmlspecialchars($user["name"]) ?>!</p>
            <div class="button-container">
                <p><a href="fooldal.php">Főoldal</a></p>
                <p><a href="logout.php">Kijelentkezés</a></p>
            </div>
        </div>
        <?php else: ?>        
        <div class="fofooldal">
            <h1>Üdvözlünk a TopPet oldalán!</h1>        
            <h3>Mielőtt átirányítunk az oldalra, jelentkezz be vagy regisztrálj!</h3>
            <img src="pet logo.png" alt="Pet logó" class="logó2">
        </div>
        <div class="login-signup">
            <a href="login.php">Bejelentkezés</a>
            <a href="signup.html">Regisztráció</a>
        </div>
        <?php endif; ?>
    
    
</body>
</html>
    
    
    
    
    
    
    
    
    
    
    