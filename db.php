<?php
$servername = "localhost";
$username = "root";  // Change to your DB username
$password = "elm600.root";      // Change to your DB password, if necessary
$dbname = "imageboard";  // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

