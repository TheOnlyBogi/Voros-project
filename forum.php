<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        .container {
            width: 80%;
            margin: 20px auto;
        }

        /* Message styling */
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

        /* Reply styling */
        .reply {
            background-color: #f0f0f0;
            border-radius: 5px;
            margin-left: 40px;
            padding: 10px;
        }

        /* Form styling */
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
    <div class="container">
        <!-- Form to send a message -->
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
            $sql = "SELECT * FROM messages";
            $result = mysqli_query($conn, $sql);

            if ($result && mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="message">';
                    echo '<h3>' . $row["author"] . '</h3>';
                    echo '<p>' . $row["message"] . '</p>';
                    echo '<span class="timestamp">' . $row["created_at"] . '</span>';
                    echo '</div>';
                }
            } else {
                echo "Nincsenek még üzenetek";
            }
        }

        if (isset($_POST['send_message'])) {
            $author = isset($_POST['author']) ? $_POST['author'] : 'Anonymous';
            $message = $_POST['message'];
            $sql = "INSERT INTO messages (author, message) VALUES ('$author', '$message')";
            if (mysqli_query($conn, $sql)) {
                echo '<div class="message">';
                echo '<h3>' . $author . '</h3>';
                echo '<p>' . $message . '</p>';
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
