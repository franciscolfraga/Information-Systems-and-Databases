<?php
  echo "User";
  function createUser($name, $email, $password) {
    global $conn;

    $options = [
        'cost' => 12,
    ];

    $hash = password_hash ($password , PASSWORD_DEFAULT, $options);

    $stmt = $conn->prepare('INSERT INTO users (name, email, password) VALUES (?, ?, ?)');
    $stmt->execute(array($name, $email, $hash));
  }

?>
