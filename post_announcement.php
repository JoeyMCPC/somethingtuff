<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header("Location: admin_login.php");
    exit;
}
$conn = new mysqli("localhost", "root", "elm600.root", "imageboard");
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

$msg = $_POST['message'];
$stmt = $conn->prepare("INSERT INTO announcements (message) VALUES (?)");
$stmt->bind_param("s", $msg);
$stmt->execute();
header("Location: admin_dashboard.php");
?>
