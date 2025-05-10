<?php
// Get board name from URL
$board = $_GET['b'] ?? 'main';

// Connect to the database

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to fetch posts for the current board and their replies
function fetch_posts($conn, $board, $parent_id = null) {
    $stmt = $conn->prepare("SELECT * FROM posts WHERE board = ? AND parent_id " . ($parent_id === null ? "IS NULL" : "= ?") . " ORDER BY created_at DESC");
    if ($parent_id === null) {
        $stmt->bind_param("s", $board);
    } else {
        $stmt->bind_param("si", $board, $parent_id);
    }
    $stmt->execute();
    return $stmt->get_result();
}



// Render post and replies recursively
function renderPost($post, $conn, $board) {
    $id = htmlspecialchars($post['id']);
    $name = htmlspecialchars($post['name']);
    $msg = nl2br(htmlspecialchars($post['content']));
    $created_at = htmlspecialchars($post['created_at']);

    // Greentext
    $msg = preg_replace('/^&gt;(.*)$/m', '<span style="color:green">&gt;$1</span>', $msg);
    // @mentions
    $msg = preg_replace('/@(\w+)/', '<span style="color:red">@${1}</span>', $msg);

    echo "<div class='post'>";
    echo "<div class='post-header'>{$name} <small>posted on {$created_at}</small></div>";
    echo "<div class='post-content'>{$msg}</div>";
    echo "<div class='post-actions'>";
    echo "<a href='?b=" . urlencode($board) . "&reply_to={$id}'>Reply</a> | ";
    echo "<a href='delete_post.php?post_id={$id}'>Delete</a>";
    echo "</div>";

    // Reply form if this is the post being replied to
    if (isset($_GET['reply_to']) && $_GET['reply_to'] == $post['id']) {
        echo "<div class='reply-form'>";
        echo "<form action='post.php' method='POST'>";
        echo "<input type='text' name='name' placeholder='Name' value='Anonymous'><br>";
        echo "<textarea name='message' placeholder='Your reply...' required></textarea><br>";
        echo "<input type='hidden' name='board' value='" . htmlspecialchars($board) . "'>";
        echo "<input type='hidden' name='parent_id' value='" . $id . "'>";
        echo "<input type='submit' value='Post Reply'>";
        echo "</form>";
        echo "</div>";
    }

    // Render replies
    $replies = fetch_posts($conn, $board, $post['id']);
    while ($reply = $replies->fetch_assoc()) {
        echo "<div style='margin-left: 20px;'>";
        renderPost($reply, $conn, $board);
        echo "</div>";
    }

    echo "</div>";
}

// Retrieve main posts (top-level threads)
$posts = fetch_posts($conn, $board);
// Fetch rules for the current board
$rule_stmt = $conn->prepare("SELECT * FROM board_rules WHERE board = ? ORDER BY id ASC");
$rule_stmt->bind_param("s", $board);
$rule_stmt->execute();
$rules_result = $rule_stmt->get_result();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($board) ?> Board</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .container { width: 80%; margin: auto; padding: 20px; }
        h1 { text-align: center; }
        .post { background: white; padding: 10px; margin-bottom: 10px; border-radius: 5px; }
        .post-header { font-weight: bold; }
        .post-content { margin-top: 10px; }
        .reply-form { margin-top: 20px; padding: 10px; background: #fff; border-radius: 5px; }
        .post-actions { margin-top: 10px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to the <?= htmlspecialchars($board) ?> Board</h1>
<h2>Rules for <?= htmlspecialchars($board) ?>:</h2>
<ul>
<?php while ($rule = $rules_result->fetch_assoc()): ?>
    <li><?= htmlspecialchars($rule['rule']) ?></li>
<?php endwhile; ?>
</ul>


    <!-- Post Form -->
    <form action="post.php" method="POST">
        <input type="text" name="name" placeholder="Name" value="Anonymous" required><br>
        <textarea name="message" placeholder="Message" required></textarea><br>
        <input type="hidden" name="board" value="<?= htmlspecialchars($board) ?>">
        <input type="submit" value="Post">
    </form>

    <h2>Threads:</h2>
    <?php while ($post = $posts->fetch_assoc()): ?>
        <?php renderPost($post, $conn, $board); ?>
    <?php endwhile; ?>
</div>
</body>
</html>

