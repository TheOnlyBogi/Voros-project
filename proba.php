<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forum Page</title>
    <style>
        /* Basic styling for the forum */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .comment {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .comment p {
            margin: 0;
            font-size: 16px;
        }
        .reply-form {
            margin-top: 10px;
        }
        .reply-form textarea {
            width: 100%;
            margin-bottom: 10px;
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
            resize: vertical;
        }
        .reply-form button {
            background-color: #007bff;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Forum</h1>

        <!-- PHP to handle comment and reply submissions -->
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

        // Handle comment submission
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

        // Handle reply submission
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

        // Fetch comments from the database
        $sql = "SELECT * FROM comments";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo '<div class="comment">';
                echo '<p>' . $row['content'] . '</p>';
                echo '<form class="reply-form" method="post">';
                echo '<textarea name="reply_content" rows="3" placeholder="Write your reply here..."></textarea><br>';
                echo '<input type="hidden" name="comment_id" value="' . $row['id'] . '">';
                echo '<button type="submit" name="submit_reply">Post Reply</button>';
                echo '</form>';
                echo '</div>';
            }
        } else {
            echo "0 comments";
        }

        $conn->close();
        ?>

        <!-- Add your comment form -->
        <h2>Add Your Comment</h2>
        <form method="post">
            <textarea name="comment_content" rows="5" placeholder="Write your comment here..."></textarea><br>
            <button type="submit" name="submit_comment">Post Comment</button>
        </form>
    </div>
</body>
</html>
