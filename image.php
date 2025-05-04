<?php
$conn = new mysqli('localhost', 'root', 'your_root_password', 'imageboard');

$id = (int)($_GET['id'] ?? 0);
$result = $conn->query("SELECT image, image_name FROM posts WHERE id = $id");

if ($row = $result->fetch_assoc()) {
    $image_info = pathinfo($row['image_name']);
    $extension = strtolower($image_info['extension']);
    
    if ($extension === 'jpg' || $extension === 'jpeg') {
        header("Content-Type: image/jpeg");
    } elseif ($extension === 'png') {
        header("Content-Type: image/png");
    } elseif ($extension === 'gif') {
        header("Content-Type: image/gif");
    } else {
        header("Content-Type: application/octet-stream");
    }

    echo $row['image'];
}
?>
