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
    <link rel="stylesheet" href="forumstyle.css">
    <title>Fórum</title>
    
</head>
<body>
    <div class="container">
        <h1>Üdv a fórumon</h1>

        <!-- Comment -->
        <h2>Írd le mit gondolsz</h2>
        <form method="post">
            <textarea name="comment_content" rows="5" placeholder="Write your comment here..."></textarea><br>
            <button type="submit" name="submit_comment">Közzététel</button>
        </form>

        <!-- PHP code for comments and replies goes here -->
        <?php
        // Database connection settings
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "toppet";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // comment küldés
        if (isset($_POST['submit_comment'])) {
            $commentContent = $_POST['comment_content'];
            $sql = "INSERT INTO comments (content) VALUES ('$commentContent')";

            if ($conn->query($sql) === TRUE) {
                echo '<div class="comment">';
                echo '<p>' . $commentContent . '</p>';
                echo '</div>';
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }

        // reply submission
        if (isset($_POST['submit_reply'])) {
            $replyContent = $_POST['reply_content'];
            $commentId = $_POST['comment_id'];
            $sql = "INSERT INTO replies (comment_id, content) VALUES ('$commentId', '$replyContent')";

            if ($conn->query($sql) === TRUE) {
                echo '<p>Reply added successfully</p>';
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }

        $conn->close();
        ?>
    </div>
</body>
</html>
