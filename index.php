<?php

echo "<h1>hola</h1>";

echo "<h2>Test conexión a MariaDB</h2>";

$host = getenv('DB_HOST') ?: 'mariadb';   // nombre del servicio en Dokploy
$db   = getenv('DB_NAME') ?: 'testdb';    // base de datos que hayas creado
$user = getenv('DB_USER') ?: 'root';      // usuario configurado
$pass = getenv('DB_PASS') ?: 'rootpass';  // contraseña configurada
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
    echo "<p>✅ Conexión exitosa a la base de datos <strong>$db</strong></p>";
} catch (PDOException $e) {
    echo "<p>❌ Error de conexión: " . $e->getMessage() . "</p>";
}

echo "<p>✅ script finalizado</p>";
