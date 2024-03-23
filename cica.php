<?php
session_start();

// Adatbázis kapcsolódás
$mysqli = new mysqli("localhost", "root", "", "toppet");

// Ellenőrizzük a kapcsolatot
if ($mysqli->connect_error) {
    die("Sikertelen kapcsolódás: " . $mysqli->connect_error);
}

// Lekérdezés a termékek táblából
$sql = "SELECT * FROM macska_termek";
$result = $mysqli->query($sql);

?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kutya</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<header class="header">
      <div class="headerakcio">
        <a href="kedvezmenyek.php"><h4>Újévi akciónk kereteiben akár -50% kezdvezmény 	&#8594</h4></a>
      </div>
      <img src="pet logo.png" alt="Pet logó" class="logó">
        <div class="containerheader">
        
        <nav>
            <ul>
            <li><a href="index.php">Főoldal</a></li>
                    <li>
                        <a href="#">Termékek</a>
                        <div>
                            <a href="kutya.php">Kutya</a>
                            <a href="cica.php">Cica</a>
                            <a href="kisemlős.php">Kisemlős</a>
                            <a href="madar.php">Madár</a>
                            <a href="halakhullok.php">Hal, Hüllő</a>
                        </div>
                    </li>
                    <li><a href="rolunk.php">Rólunk</a></li>
                    <li><a href="forum.php">Fórum</a></li>
              <li style="float: right;"><a href="kosar.php" style="width:40px; height:40px; text-align: center;"><i class="fa fa-shopping-bag"></i></a></li>
              <li style="float: right;">
                    <a href="#" style="width:40px; height:40px; text-align: center;"><i class="	fa fa-user"></i></a>
                        <div>
                          <?php if (isset($user)): ?>
        
                            <a href="account.php">Üdvözlünk <?= htmlspecialchars($user["name"]) ?>!</a>

        

                            <a href="logout.php">Kijelentkezés</a>
                        </div>
                        <div>      
                          <?php else: ?>
        
                            <a href="login.php">Bejelentkezés</a>
                            <a href="signup.php">Regisztráció</a>
        
                          <?php endif; ?>
                        </div>  
              </li>
            </ul>
          </nav>
        </div>
    </header>

    <style>
    body {
        font-family: Arial, sans-serif;
        
    }
    .container {
        max-width: 1000px;
        margin: 0 auto;
        padding: 20px;
        display: flex; /* Flexbox layout */
        flex-wrap: wrap; /* Ha kifut a konténerből, tördeljen */
        justify-content: space-between; /* Távolság az elemek között */
    }
    .product {
        width: calc(33.33% - 20px); /* Szélesség 33.33%, mínusz a margó */
        background-color: #0ca2bd;
        color: white;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Árnyék hozzáadása */
        transition: transform 0.3s ease; /* Animáció */
        text-align: center; /* Szöveg középre igazítása */
    }
    .product:hover {
        transform: translateY(-5px); /* Kicsit felemelkedik, ha rávisz a kurzor */
    }
    .product img {
        max-width: 200px; /* Kép maximális szélessége */
        height: auto;
        margin-bottom: 10px;
        border-radius: 10px;
        display: block; /* Eltávolítja a felesleges helyet az img elemek körül */
        margin: 0 auto; /* Kép középre igazítása */
    }
    .btn {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        border-radius: 5px;
        transition: background-color 0.3s ease; /* Háttérszín animáció */
    }
    .btn:hover {
        background-color: #45a049; /* Színváltás hoverre */
    }
</style>



<div class="container">
    <?php
    // Ellenőrizze, hogy vannak-e eredmények a lekérdezésből
    if ($result->num_rows > 0) {
        // Iteráljunk végig a lekérdezett sorokon
        while ($row = $result->fetch_assoc()) {
            // Jelenítsük meg a termékeket
            echo "<div class='product'>";
            
            // Lekérjük az adott termékhez tartozó kép elérési útvonalát az adatbázisból

            $kep_id = $row['kepek_id']; // helyesen: kep_id
            $sql_kep = "SELECT url FROM kepek_id WHERE kep_id = ?";
            $stmt = $mysqli->prepare($sql_kep);
            $stmt->bind_param("i", $kep_id);
            $stmt->execute();
            $result_kep = $stmt->get_result();

            if ($result_kep->num_rows > 0) {
                $row_kep = $result_kep->fetch_assoc();
                $kep_url = $row_kep['url'];
                echo "<img src='" . $kep_url . "' alt='{$row['nev']}'>";
            } else {
                echo "Nincs kép az adatbázisban az adott azonosítóval.";
            }
            echo "<h2>{$row['nev']}</h2>";
            echo "<p>Leírás: {$row['leiras']}</p>";
            echo "<p>Ár: {$row['ar']} Ft</p>";
            echo "<a href='#' class='btn'>Kosárba</a>";
            echo "</div>";
        }
    } else {
        echo "Nincsenek termékek az adatbázisban.";
    }

    // Adatbázis kapcsolat bezárása
    $mysqli->close();
    ?>
</div>


<footer class="footer">
        <div class="containerfooter">
          <div class="rowfooter">
            <div class="footer-col">
              <h4>Áruházaink</h4>
              <ul>
                <li><a href="https://www.google.com/maps/place/Gy%C5%91r/@47.6693457,17.518602,11z/data=!3m1!4b1!4m5!3m4!1s0x476bbf87407ea035:0x400c4290c1e11e0!8m2!3d47.6874569!4d17.6503974" target="_blank">Győr</a></li>
                <li><a href="https://www.google.com/maps/place/Budapest/@47.4808722,18.8501225,10z/data=!3m1!4b1!4m5!3m4!1s0x4741c334d1d4cfc9:0x400c4290c1e1160!8m2!3d47.497912!4d19.040235" target="_blank">Budapest</a></li>
                <li><a href="https://www.google.com/maps/place/P%C3%A9cs/@46.0776474,18.1104982,11z/data=!3m1!4b1!4m5!3m4!1s0x4742b111ea3252e3:0x400c4290c1e1200!8m2!3d46.0727345!4d18.232266" target="_blank">Pécs</a></li>
                <li><a href="https://www.google.com/maps/place/Debrecen/@47.5305732,21.3800015,10z/data=!3m1!4b1!4m5!3m4!1s0x47470c2afe5e2b83:0x400c4290c1e1170!8m2!3d47.5316049!4d21.6273124" target="_blank">Debrecen</a></li>
                <li><a href="#">Szeged</a></li>
                <li><a href="#">Veszprém</a></li>
              </ul>
            </div>
            <div class="footer-col">
              <h4>Oldalak</h4>
              <ul>
                <li><a href="#">Szállítás</a></li>
                <li><a href
                ="#">Árlista</a></li>
                <li><a href="GYIK.php">GYIK</a></li>
                <li><a href="Adatvédelmi tájékoztató.docx" download>
                    <p>Adatvédelmi tájékoztató</p>
                  </a>
                </li>

              </ul>
            </div>
            <div class="footer-col">
              <h4>Elérhetőségek</h4>
              <ul>
                <li><a href="#">TopPet Kft.</a></li>
                <li><a href="#">7022 Győr Henye út 26.</a></li>
                <li><a href="#">+36 20/744 5545</a></li>
                <li><a href="mailto:top.pet.info@gmail.com">top.pet.info@gmail.com</a></li>
              </ul>
            </div>
            <div class="footer-col">
              <h4>Kövess Minket!</h4>
              <div class="social-links">
                <a href="#" class="fa fa-facebook"></a>
                <a href="#" class="fa fa-twitter"></a>
                <a href="#" class="fa fa-instagram"></a>
                <a href="https://www.youtube.com/channel/UCAjk-w0_bCCEpkNaPaPjHDw" class="fa fa-youtube"></a>
              </div>
            </div>
          </div>
        </div>
    </footer>

</body>
</html>
