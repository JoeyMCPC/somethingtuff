<?php
session_start();
// I think you get the point
$conn = new mysqli

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch boards
$result = $conn->query("SELECT * FROM boards");

// Fetch announcements
$announcement_sql = "SELECT * FROM announcements ORDER BY id DESC";
$announcement_result = $conn->query($announcement_sql);

// Fetch rules
$rules_sql = "SELECT * FROM rules ORDER BY id ASC";
$rules_result = $conn->query($rules_sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Something Tuff</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        .announcement, .rules { background-color: #f0f0f0; padding: 10px; margin: 10px 0; border: 1px solid #ccc; }
        .board-link { display: block; margin: 5px 0; }
        #admin-login { margin-top: 20px; font-size: 14px; }
    </style>
</head>
<body>
    <h1>Something Tuff</h1>

    <div id="admin-login">
        <a href="admin.php">Admin Login</a>
    </div>

    <h2>Boards</h2>
    <?php while ($board = $result->fetch_assoc()): ?>
        <a class="board-link" href="boards.php?b=<?= htmlspecialchars($board['shortname']) ?>">
            /<?= htmlspecialchars($board['shortname']) ?>/ - <?= htmlspecialchars($board['name']) ?>
        </a>
    <?php endwhile; ?>

    <h2><a href="boards.php?b=main">Visit /main/ Board</a></h2>

    <?php if ($announcement_result->num_rows > 0): ?>
        <div class="announcement">
            <h3>Announcements</h3>
            <?php while ($announcement = $announcement_result->fetch_assoc()): ?>
                <p><?= htmlspecialchars($announcement['message']) ?></p>
            <?php endwhile; ?>
        </div>
    <?php endif; ?>

    <?php if ($rules_result->num_rows > 0): ?>
        <div class="rules">
            <h3>Rules</h3>
            <ul>
                <?php while ($rule = $rules_result->fetch_assoc()): ?>
                    <li><?= htmlspecialchars($rule['text']) ?></li>
                <?php endwhile; ?>
            </ul>
        </div>
    <?php endif; ?>
</body>
</html>

