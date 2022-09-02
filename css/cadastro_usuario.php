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

$nome = $_POST['nome'];
$data_nasc = $_POST['data_n'];
$cpf = $_POST['cpf_cliente'];
$telefone = $_POST['telefone'];
$email = $_POST['email'];
$estado = $_POST['estado'];
$cep = $_POST['cep'];
$cidade = $_POST['cidade'];
$bairro = $_POST['bairro'];
$rua = $_POST['rua'];
$numero = $_POST['numero'];

echo "Nome: $nome
<br>Data de Nascimento: $data_nasc
<br>CPF: $cpf
<br>Telefone: $telefone
<br>Email: $email
<br>Estado: $estado
<br>cep: $cep
<br>Cidade: $cidade
<br>Bairro: $bairro
<br>Rua: $rua
<br>Numero: $numero";
 
$sql = "INSERT INTO cliente (nome, data_nasc, cpf, telefone, email, estado, cep, cidade, bairro, rua, numero, foto_blob, foto_nome)
        VALUES ('".$nome."', '".$data_nasc."','".$cpf."', '".$telefone."','".$email."', '".$estado."', '".$cep."', '".$cidade."','".$bairro."','".$rua."','".$numero."','".$fotoBlob."','".$fotoNome."')";
 
$result = mysqli_query($con, $sql);
if ($result) {
    echo "<br><br>Dados inseridos com sucesso!";
} else {
    echo "<br><br>Erro ao inserir a banco de dados: ".mysqli_error($con);
}
?>