<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forum</title>
    <style>
        /* Basic CSS for styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .message {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .message form {
            margin-top: 10px;
        }
        .message form input[type="text"],
        .message form textarea {
            width: 70%;
            padding: 5px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        .message form button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Form to send a message -->
        <form action="" method="post">
            <input type="text" name="author" placeholder="Your Name" required>
            <textarea name="message" rows="4" placeholder="Your Message" required></textarea>
            <button type="submit" name="send_message">Send Message</button>
        </form>
        <hr>

        <?php
        // Database connection
        $db_host = "localhost";
        $db_user = "root";
        $db_pass = "";
        $db_name = "toppet";
        $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        // Function to display messages
        function displayMessages($conn) {
            $sql = "SELECT * FROM messages";
            $result = mysqli_query($conn, $sql);

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="message">';
                    echo '<p><strong>' . $row["author"] . ':</strong> ' . $row["message"] . '</p>';
                    echo '<form action="" method="post">';
                    echo '<input type="hidden" name="reply_to" value="' . $row["author"] . '">';
                    echo '<input type="text" name="reply_message" placeholder="Your Reply" required>';
                    echo '<button type="submit" name="send_reply">Send Reply</button>';
                    echo '</form>';
                    echo '</div>';
                }
            } else {
                echo "No messages yet.";
            }
        }

        if (isset($_POST['send_message'])) {
            // Handle sending a message
            $author = $_POST['author'];
            $message = $_POST['message'];
            $sql = "INSERT INTO messages (author, message) VALUES ('$author', '$message')";
            if (mysqli_query($conn, $sql)) {
                echo '<div class="message">';
                echo '<p><strong>' . $author . ':</strong> ' . $message . '</p>';
                echo '</div>';
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }

        if (isset($_POST['send_reply'])) {
            // Handle sending a reply
            $reply_to = $_POST['reply_to'];
            $reply_message = $_POST['reply_message'];
            $sql = "INSERT INTO messages (author, message) VALUES ('$reply_to', '$reply_message')";
            if (mysqli_query($conn, $sql)) {
                echo '<div class="message">';
                echo '<p><strong>Reply to ' . $reply_to . ':</strong> ' . $reply_message . '</p>';
                echo '</div>';
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }

        // Display existing messages
        displayMessages($conn);

        mysqli_close($conn);
        ?>
    </div>
</body>
</html>
