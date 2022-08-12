<?php
    include('conexao.php');
    $sql = 'SELECT * FROM usuario';
    
    //RETORNA TODOS OS DADOS DA CONSULTA
    $result = mysqli_query($con, $sql);
    
    //RETORNA A PRIMEIRA LINHA
    //$row = mysqli_fetch_array($result);
    //print_r($row);
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Meus Rascunhos </title>
</head>
<body>
    <center>
    <h1> Meus Rascunhos </h1>
    </center>
    <table align="center" border>
        <tr>
            <th><?php><?></th>
            <th>NOME</th>
            <th>EMAIL</th>
            <th>TELEFONE</th>
            <th>EXCLUIR</th>
        </tr>
    </table>

</body>
</html>