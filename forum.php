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
    <title>Fórum</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #9fddf3;
            color: #333;
        }
        .containerforum {
            width: 80%;
            margin: 20px auto;
        }

        /*Üzenet*/
        .message {
            background-color: #fff;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .message p {
            margin: 0;
            padding: 0;
            margin-bottom: 10px;
        }
        .message h3 {
            margin-top: 0;
            margin-bottom: 5px;
        }
        .timestamp {
            font-size: 12px;
            color: #777;
        }

        /*Válasz*/
        .reply {
            background-color: #f0f0f0;
            border-radius: 5px;
            margin-left: 40px;
            padding: 10px;
        }

        /*Form*/
        form {
            margin-top: 20px;
        }
        form input[type="text"],
        form textarea,
        form button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
            box-sizing: border-box;
        }
        form button {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<header class="header">
      <div class="headerakcio">
        <a href="kedvezmenyek.php"><h4>Nyitási akciónk kereteiben akár -50% kezdvezmény 	&#8594</h4></a>
      </div>
      <img src="pet logo.png" alt="Pet logó" class="logó">
        <div class="containerheader">
          <nav>
            <ul>
            <li><a href="index.php">Főoldal</a></li>
                    <li>
                        <a>Termékek</a>
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
              <li style="float: right;"><a href="kosar.html" style="width:40px; height:40px; text-align: center;"><i class="fa fa-shopping-bag"></i></a></li>
              <li style="float: right;"><a href="account.php" style="width:40px; height:40px; text-align: center;"><i class="	fa fa-user"></i></a></li>
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

    <div class="containerforum">
        <!-- Form -->
        <form action="" method="post">
            <input type="text" name="author" placeholder="Név">
            <textarea name="message" rows="4" placeholder="Üzeneted" required></textarea>
            <button type="submit" name="send_message">Üzenet küldése</button>
        </form>

        <?php
        $db_host = "localhost";
        $db_user = "root";
        $db_pass = "";
        $db_name = "toppet";
        $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        function displayMessages($conn) {
            $sql = "SELECT * FROM messages ORDER BY created_at DESC";
            $result = mysqli_query($conn, $sql);
        
            if ($result && mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="message">';
                    echo '<h3>' . $row["author"] . '</h3>';
                    echo '<p>' . $row["message"] . '</p>';
                    echo '<span class="timestamp">' . $row["created_at"] . '</span>';
                    echo '<form action="" method="post">';
                    echo '<input type="hidden" name="reply_to" value="' . $row["id"] . '">';
                    echo '<input type="text" name="reply_author" placeholder="Név" required>';
                    echo '<textarea name="reply_message" rows="2" placeholder="Válasz" required></textarea>';
                    echo '<button type="submit" name="send_reply">Válasz küldése</button>';
                    echo '</form>';
                    displayReplies($conn, $row["id"]);
                    echo '</div>';
                }
            } else {
                echo "Nincsenek még üzenetek";
            }
        }
        

        function displayReplies($conn, $parent_id) {
            $sql = "SELECT * FROM replies WHERE parent_id = $parent_id";
            $result = mysqli_query($conn, $sql);

            if ($result && mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="reply">';
                    echo '<p>' . (isset($row["author"]) ? $row["author"] : "Anonymous") . ': ' . $row["message"] . '</p>';
                    echo '</div>';
                }
            }
        }

        if (isset($_POST['send_message'])) {
            $author = isset($_POST['author']) ? $_POST['author'] : 'Anonymous';
            $message = $_POST['message'];
            $sql = "INSERT INTO messages (author, message) VALUES ('$author', '$message')";
            if (mysqli_query($conn, $sql)) {
                header("Location: {$_SERVER['PHP_SELF']}");
                exit();
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }

        if (isset($_POST['send_reply'])) {
            $author = isset($_POST['reply_author']) ? $_POST['reply_author'] : 'Anonymous';
            $parent_id = $_POST['reply_to'];
            $reply_message = $_POST['reply_message'];

            $sql = "INSERT INTO replies (parent_id, author, message) VALUES ('$parent_id', '$author', '$reply_message')";
            if (mysqli_query($conn, $sql)) {
                header("Location: {$_SERVER['PHP_SELF']}");
                exit();
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }

        displayMessages($conn);

        mysqli_close($conn);
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
