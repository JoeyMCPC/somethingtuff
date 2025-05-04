<?php
session_start();
if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    die("Access denied");
}

$conn = new mysqli
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

// Check if it's a range delete
if (isset($_GET['start_id']) && isset($_GET['end_id'])) {
    $start = intval($_GET['start_id']);
    $end = intval($_GET['end_id']);
    if ($start > 0 && $end >= $start) {
        $conn->query("DELETE FROM posts WHERE id BETWEEN $start AND $end");
        $conn->query("DELETE FROM posts WHERE parent_id BETWEEN $start AND $end");
    }
    header("Location: admin_dashboard.php");
    exit();
}

// Otherwise, handle single post delete
if (isset($_GET['post_id'])) {
    $id = intval($_GET['post_id']);
    $conn->query("DELETE FROM posts WHERE id = $id");
    $conn->query("DELETE FROM posts WHERE parent_id = $id");
}

header("Location: admin_dashboard.php");
exit();
?>
