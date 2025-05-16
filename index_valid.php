<?php
require_once 'db.php';

if (isset($_POST['addtask'])) {
    $task_add = trim($_POST['textfield']);

    if (!empty($task_add)) {
        // Use prepared statements to prevent SQL injection
        $stmt = $dbcon->prepare("INSERT INTO task_table (task_name) VALUES (?)");
        $stmt->bind_param("s", $task_add);
        $stmt->execute();
        $stmt->close();
    }

    // Redirect before any output
    header('Location: index.php');
    exit;
}
?>
