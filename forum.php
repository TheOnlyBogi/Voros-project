<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Fórum</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
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
        
        <form action="" method="post">
            <input type="text" name="author" placeholder="Név" required>
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
            $sql = "SELECT * FROM messages";
            $result = mysqli_query($conn, $sql);

            if ($result && mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="messageforum">';
                    echo '<p><strong>' . $row["author"] . ':</strong> ' . $row["message"] . '</p>';
                    echo '<form action="" method="post">';
                    echo '<input type="hidden" name="reply_to" value="' . $row["author"] . '">';
                    echo '<input type="text" name="author" placeholder="Név" required>'; 
                    echo '<input type="text" name="reply_message" placeholder="Válasz" required>';
                    echo '<button type="submit" name="send_reply">Válasz küldése</button>';
                    echo '</form>';
                    
                    // replies
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
                    echo '<div class="replyforum">';
                    echo '<p><strong>' . $row["author"] . ':</strong> ' . $row["message"] . '</p>';
                    echo '</div>';
                }
            }
        }

        if (isset($_POST['send_message'])) {

            $author = $_POST['author'];
            $message = $_POST['message'];
            $sql = "INSERT INTO messages (author, message) VALUES ('$author', '$message')";
            if (mysqli_query($conn, $sql)) {
                echo '<div class="messageforum">';
                echo '<p><strong>' . $author . ':</strong> ' . $message . '</p>';
                echo '</div>';
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }

        if (isset($_POST['send_reply'])) {

            $author = $_POST['author'];
            $parent_author = $_POST['reply_to'];
            $reply_message = $_POST['reply_message'];

            $sql = "SELECT id FROM messages WHERE author='$parent_author'";
            $result = mysqli_query($conn, $sql);
            $parent_id = mysqli_fetch_assoc($result)['id'];

            $sql = "INSERT INTO replies (parent_id, author, message) VALUES ('$parent_id', '$author', '$reply_message')";
            if (mysqli_query($conn, $sql)) {
                echo '<div class="replyforum">';
                echo '<p><strong>Reply to ' . $parent_author . ':</strong> ' . $reply_message . '</p>';
                echo '</div>';
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }

        displayMessages($conn);

        mysqli_close($conn);
        ?>


        
    </div>
</body>
</html>
