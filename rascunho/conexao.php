<?php
$hostname = "localhost";
$port = 3306;
$username = "root";
$password = "";
$database = "rascunho";
$con = mysqli_connect($hostname, $username, $password, $database, $port);

if(mysqli_connect_errno())
{
    printf("erro ao conectar ao banco de dados: %s\n", mysqli_connect_error());
    exit;
}
printf("Que obra de arte! Aqui está o resultado do seu trabalho:")
?>