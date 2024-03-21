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
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Madár</title>
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
    <script>
      var currentLocation = window.location.href;
      var navLinks = document.querySelectorAll('nav ul li a');
  
      navLinks.forEach(function(link) {
          if (link.href === currentLocation) {
              link.classList.add('VILÁGÍTS');
          } else {
              link.classList.remove('VILÁGÍTS');
          }
      });
  </script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
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
    }
    .product:hover {
        transform: translateY(-5px); /* Kicsit felemelkedik, ha rávisz a kurzor */
    }
    .product img {
        max-width: 100px;
        height: auto;
        margin-bottom: 10px;
        border-radius: 10px;
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
    <div class="product">
        <img src="madar_tollas_jatek.jpg" alt="Madár tollas játék">
        <h2>Madár tollas játék</h2>
        <p>800 Ft</p>
        <p>Interaktív és szórakoztató tollas játék madaraknak, amely fejleszti a koordinációt és a játékot.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    <div class="product">
        <img src="madar_fesu.jpg" alt="Madár fésű">
        <h2>Madár fésű</h2>
        <p>500 Ft</p>
        <p>Kényelmes és puha fésű madaraknak, amely segíti a tollak ápolását és a kényelmes érzést.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    <div class="product">
        <img src="madar_hintaztato.jpg" alt="Madár hintáztató">
        <h2>Madár hintáztató</h2>
        <p>1000 Ft</p>
        <p>Biztonságos és szórakoztató hintáztató madaraknak, amely stimulálja a mozgást és a játékot.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    

    <div class="product">
        <img src="madar_rago_jatek.jpg" alt="Madár rágó játék">
        <h2>Madár rágó játék</h2>
        <p>700 Ft</p>
        <p>Biztonságos és szórakoztató rágó játék madaraknak, amely segíti a csőrük egészséges fenntartását és a játékot.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    <div class="product">
        <img src="madar_furdokad.jpg" alt="Madár fürdőkád">
        <h2>Madár fürdőkád</h2>
        <p>1600 Ft</p>
        <p>Könnyen felszerelhető és tisztítható fürdőkád madaraknak, amely segíti a higiéniát és a tollak ápolását.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    <div class="product">
        <img src="madar_jatekkonyv.jpg" alt="Madár játékkönyv">
        <h2>Madár játékkönyv</h2>
        <p>1200 Ft</p>
        <p>Interaktív és tanulást segítő játékkönyv madaraknak, amely fejleszti az érzékeket és az intelligenciát.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    <div class="product">
        <img src="madar_etetotal.jpg" alt="Madár etetőtál">
        <h2>Madár etetőtál</h2>
        <p>800 Ft</p>
        <p>Könnyen tisztítható és tartós madár etetőtál, amely lehetővé teszi, hogy kedvenc madaraid kényelmesen táplálkozhassanak.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    <div class="product">
        <img src="madar_hinta.jpg" alt="Madár hinta">
        <h2>Madár hinta</h2>
        <p>1000 Ft</p>
        <p>Színes és szórakoztató madár hinta, amely lehetővé teszi a madarak számára a szabad repülés érzését a ketrecben.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    <div class="product">
        <img src="madar_etetoallvany.jpg" alt="Madár etetőállvány">
        <h2>Madár etetőállvány</h2>
        <p>1200 Ft</p>
        <p>Könnyen felállítható és tisztítható madár etetőállvány, amely lehetővé teszi a madarak kényelmes táplálkozását.</p>
        <a href="#" class="btn">Kosárba</a>
    </div>

    
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
                <li><a href="https://www.google.com/maps/place/Szeged/@46.2327035,20.0003853,11z/data=!3m1!4b1!4m5!3m4!1s0x474487e22bcce54b:0x400c4290c1e1190!8m2!3d46.2530102!4d20.1414253" target="_blank">Szeged</a></li>
                <li><a href="https://www.google.com/maps/place/Veszpr%C3%A9m/@47.1257777,17.8372088,12z/data=!3m1!4b1!4m5!3m4!1s0x47699add028c2f91:0x400c4290c1e1210!8m2!3d47.1028087!4d17.9093019" target="_blank">Veszprém</a></li>
              </ul>
            </div>
            <div class="footer-col">
              <h4>Oldalak</h4>
              <ul>
                <li><a href="#">Szállítás</a></li>
                <li><a href="#">Árlista</a></li>
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
