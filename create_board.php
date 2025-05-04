<?php
session_start();
 //Optional: Check if user is admin
// if (!isset($_SESSION['is_admin']) || !$_SESSION['is_admin']) die("Unauthorized.");

$conn = new mysqli("localhost", "root", "elm600.root", "imageboard");
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

$shortname = strtolower(trim($_POST['shortname']));
$name = trim($_POST['name']);

// Basic validation
if (!preg_match('/^[a-z0-9]{1,16}$/', $shortname)) {
    die("Invalid board shortname.");
}

if ($name === '') {
    die("Board name cannot be empty.");
}

// Check for duplicates
$stmt = $conn->prepare("SELECT id FROM boards WHERE shortname = ?");
$stmt->bind_param("s", $shortname);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
    die("A board with that shortname already exists.");
}

// Insert new board
$stmt = $conn->prepare("INSERT INTO boards (shortname, name) VALUES (?, ?)");
$stmt->bind_param("ss", $shortname, $name);
$stmt->execute();

header("Location: admin_dashboard.php?success=1");
exit();
?>
