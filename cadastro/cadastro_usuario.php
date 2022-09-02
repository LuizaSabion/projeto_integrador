<?php
 
include('conexao.php');
 
//Upload da foto    
$fotoNome = $_FILES['foto']['name'];
$target_dir = "upload/";
$target_file = $target_dir . basename($_FILES["foto"]["name"]);
// Select file type
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Valid file extensions
$extensions_arr = array("jpg","jpeg","png","gif");
 
// Check extension
if( in_array($imageFileType,$extensions_arr) ){        
    // Upload file
    if(move_uploaded_file($_FILES['foto']['tmp_name'],$target_dir.$fotoNome)){
        $fotoBlob = addslashes(file_get_contents($target_dir.$fotoNome));
    }
}

$nomeCliente = $_POST['nome'];
$dataNasc = $_POST['nascimento'];
$cpfCliente = $_POST['cpf_cliente'];
$telCliente = $_POST['telefone'];
$emailCliente = $_POST['email'];
$estadoCliente = $_POST['estado'];
$cepCliente = $_POST['cep'];
$cidadeCliente = $_POST['cidade'];
$bairroCliente = $_POST['bairro'];
$ruaCliente = $_POST['rua'];
$numCasaCliente = $_POST['numero'];

echo "Nome: $nomeCliente
<br>Data de Nascimento: $dataNasc
<br>CPF: $cpfCliente
<br>Telefone: $telCliente
<br>Email: $emailCliente
<br>Estado: $estadoCliente
<br>CEP: $cepCliente
<br>Cidade: $cidadeCliente
<br>Bairro: $bairroCliente
<br>Rua: $ruaCliente
<br>Numero da Casa: $numCasaCliente";
 
$sql = "INSERT INTO cliente (nomeCliente, dataNasc, cpfCliente, telCliente, emailCliente, estadoCliente, cepCliente, cidadeCliente, bairroCliente, ruaCliente, numCasaCliente, foto_blob, foto_nome)
        VALUES ('".$nomeCliente."', '".$dataNasc."','".$cpfCliente."', '".$telCliente."','".$emailCliente."', '".$estadoCliente."', '".$cepCliente."', '".$cidadeCliente."','".$bairroCliente."','".$ruaCliente."','".$numCasaCliente."','".$fotoBlob."','".$fotoNome."')";
 
$result = mysqli_query($con, $sql);
if ($result) {
    echo "<br><br>Dados inseridos com sucesso!";
} else {
    echo "<br><br>Erro ao inserir a banco de dados: ".mysqli_error($con);
}
?>
