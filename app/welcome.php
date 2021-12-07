<?php

$conn = new mysqli($_ENV["dbhost"], $_ENV["dbuser"], $_ENV["dbpassword"], $_ENV["dbname"]);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE TABLE IF NOT EXISTS MyGuests (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50),
reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)";

if ($conn->query($sql) === TRUE) {
  echo "All your DB:" . "<br>";
} else {
  echo "Error creating table: " . $conn->error;
}

$first_name = $conn->real_escape_string($_POST['first_name']);
$last_name = $conn->real_escape_string($_POST['last_name']);
$e_mail = $conn->real_escape_string($_POST['e_mail']);
$sql = "INSERT INTO MyGuests (firstname, lastname, email) VALUES ('".$first_name."','".$last_name."', '".$e_mail."')";

if ($conn->query($sql) === TRUE) {
  echo "<br>";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$sql = "SELECT id, firstname, lastname, email FROM MyGuests ORDER BY id DESC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["id"]. " " . $row["firstname"]. " " . $row["lastname"]. " " . $row["email"]. "<br>";
  }
} else {
  echo "0 results";
}

$conn->close();
?> 
