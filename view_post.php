<?php
session_start();

// Check if the admin is logged in
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header('Location: admin.php');
    exit();
}

if (isset($_GET['id'])) {
    $post_id = $_GET['id'];

    // Connect to the database
    $conn = new mysqli("localhost", "username", "password", "imageboard_db");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Fetch the post details
    $sql = "SELECT * FROM posts WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $post_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $post = $result->fetch_assoc();
    } else {
        echo "Post not found.";
        exit();
    }
} else {
    echo "No post ID specified.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Details</title>
</head>
<body>
    <h2>Post Details</h2>
    <p><a href="admin_dashboard.php">Back to Admin Dashboard</a></p>

    <h3>Post ID: <?php echo $post['id']; ?></h3>
    <p><strong>Author:</strong> <?php echo htmlspecialchars($post['author']); ?></p>
    <p><strong>Content:</strong></p>
    <p><?php echo nl2br(htmlspecialchars($post['content'])); ?></p>

    <p><strong>Created At:</strong> <?php echo $post['created_at']; ?></p>
</body>
</html>

<?php
$conn->close();
?>
