<?php
session_start();

if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    die("Access denied");
}

$conn = new mysqli("localhost", "root", "elm600.root", "imageboard");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Delete a range of posts if start_id and end_id are provided
if (isset($_GET['start_id']) && isset($_GET['end_id'])) {
    $start_id = intval($_GET['start_id']);
    $end_id = intval($_GET['end_id']);

    if ($start_id > 0 && $end_id >= $start_id) {
        $stmt = $conn->prepare("DELETE FROM posts WHERE id BETWEEN ? AND ?");
        $stmt->bind_param("ii", $start_id, $end_id);
        $stmt->execute();

        $stmt2 = $conn->prepare("DELETE FROM posts WHERE parent_id BETWEEN ? AND ?");
        $stmt2->bind_param("ii", $start_id, $end_id);
        $stmt2->execute();
    }
}
// Otherwise, delete a single post
elseif (isset($_GET['post_id'])) {
    $post_id = intval($_GET['post_id']);

    $stmt = $conn->prepare("DELETE FROM posts WHERE id = ?");
    $stmt->bind_param("i", $post_id);
    $stmt->execute();

    $stmt2 = $conn->prepare("DELETE FROM posts WHERE parent_id = ?");
    $stmt2->bind_param("i", $post_id);
    $stmt2->execute();
}


// Delete from announcements table if it exists
$stmt = $conn->prepare("DELETE FROM announcements WHERE id = ?");
$stmt->bind_param("i", $post_id);
$stmt->execute();

header("Location: admin_dashboard.php");
exit();
?>
