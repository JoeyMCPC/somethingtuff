<?php
session_start();
$conn = new mysqli
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get parent ID if replying
$parent_id = isset($_POST['parent_id']) && is_numeric($_POST['parent_id']) ? intval($_POST['parent_id']) : NULL;
$board = $_POST['board'] ?? 'main';  // Default to 'main' board if not provided

$name = $_POST['name'] ?? 'Anonymous';
$message = $_POST['message'] ?? '';

if (trim($message) === '') {
    header("Location: boards.php?b=" . urlencode($board));  // Redirect to the same board
    exit();
}

require_once 'filter.php';

// Filter the message
$filtered_post = filter_message($message);

// Insert the post into the database
$stmt = $conn->prepare("INSERT INTO posts (name, content, parent_id, board) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssis", $name, $filtered_post, $parent_id, $board);
$stmt->execute();

header("Location: boards.php?b=" . urlencode($board));  // Redirect to the board page
exit();
?>

