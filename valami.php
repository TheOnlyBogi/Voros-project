<?php
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