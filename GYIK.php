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
    <title>GYIK</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
      }

      .container {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      }

      .tab {
        overflow: hidden;
        background-color: #f1f1f1;
        border-radius: 5px;
      }

      .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 15px 20px;
        transition: 0.3s;
        border-radius: 5px 5px 0 0;
      }

      .tab button:hover {
        background-color: #9fddf3;
      }

      .tab button.active {
        background-color: cyan;
      }

      .tabcontent {
        display: none;
        padding: 20px;
        border-radius: 0 0 5px 5px;
        border: 1px solid #ccc;
        border-top: none;
      }

      .tabcontent.active {
        display: block;
      }

      h3 {
        color: #333;
        margin-bottom: 10px; 
      }

      p {
        color: #666;
        margin-bottom: 15px; 
      }
    </style>
</head>
<body>
    <header class="header">
      <div class="headerakcio">
        <a href="Főoldal.html"><h4>Újévi akciónk kereteiben akár -50% kezdvezmény 	&#8594</h4></a>
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
  
  <div class="container">
    <div class="tab">
      <button class="tablinks active" onclick="openTab(event, 'Szállítás')">Szállítás</button>
      <button class="tablinks" onclick="openTab(event, 'Termékek')">Termékek</button>
      <button class="tablinks" onclick="openTab(event, 'Fizetés')">Fizetés</button>
      <button class="tablinks" onclick="openTab(event, 'Visszaküldés/Garancia')">Visszaküldés/Garancia</button>
      <button class="tablinks" onclick="openTab(event, 'Kapcsolattartás')">Kapcsolattartás</button>
      <button class="tablinks" onclick="openTab(event, 'Panaszok kezelése')">Panaszok kezelése</button>
    </div>

    <div id="Szállítás" class="tabcontent active">
      <h3>Szállítás</h3>
      <p>#1 Mennyi idő alatt érkezik meg a rendelésem?</p>
      <p>Válasz</p>
      <p>#2 Mennyibe kerül a szállítás?</p>
      <p>Válasz</p>
      <p>#3 Van lehetőség expressz szállításra?</p>
      <p>Válasz</p>
    </div>

    <div id="Termékek" class="tabcontent">
      <h3>Termékek</h3>
      <p>#1 Milyen anyagból készült a termék?</p>
      <p>Válasz</p>
      <p>#2 Milyen garanciát vállalnak a termékre?</p>
      <p>Válasz</p>
    </div>

    <div id="Fizetés" class="tabcontent">
      <h3>Fizetés</h3>
      <p>#1 Milyen fizetési módokat fogadnak el?</p>
      <p>Válasz</p>
      <p>#2 Biztonságos-e bankkártyás fizetni?</p>
      <p>Válasz</p>
      <p>#3 Lehet-e utánvéttel fizetni?</p>
      <p>Válasz</p>
    </div>

    <div id="Visszaküldés/Garancia" class="tabcontent">
      <h3>Visszaküldés/Garancia</h3>
      <p>#1 Mi a visszaküldési és cserepolitika?</p>
      <p>Válasz</p>
      <p>#2 Milyen esetekben vállalnak garanciát a termékekre?</p>
      <p>Válasz</p>
      <p>#3 Mennyi idő áll rendelkezésre a visszaküldésre?</p>
      <p>Válasz</p>
    </div>

    <div id="Kapcsolattartás" class="tabcontent">
      <h3>Kapcsolattartás</h3>
      <p>#1 Hogyan lehet kapcsolatba lépni az ügyfélszolgálattal?</p>
      <p>Válasz</p>
      <p>#2 Van lehetőség telefonos támogatásra?</p>
      <p>Válasz</p>
    </div>

    <div id="Panaszok kezelése" class="tabcontent">
      <h3>Panaszok kezelése</h3>
      <p>#1 Milyen módon lehet panaszt benyújtani és hogyan fogják azt kezelni?</p>
      <p>Válasz</p>
      <p>#2 Mi a folyamat, ha elégedetlen vagyok a termékkel?</p>
      <p>Válasz</p>
    </div>
  </div>

<script>
  function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
    }
  </script>


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
                Adatvédelmi tájékoztató
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
