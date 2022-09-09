<?php
 
include('conexao.php');

$categoriaMovel = $_POST['categoria'];
$corMovel = $_POST['cor'];
$materialMovel = $_POST['material'];
$compMovel  = $_POST['comprimento'];
$larguraMovel = $_POST['largura'];
$quantDisponivel = $_POST['quantidade'];
$precoMovel = $_POST['preco'];

echo "Tipo de Móvel: $categoriaMovel
<br>Cor do Móvel: $corMovel
<br>Material do Móvel: $materialMovel
<br>Comprimento do Móvel: $compMovel
<br>Largura do Móvel: $larguraMovel
<br>Quantidade Disponível: $quantDisponivel
<br>Preço Total: $precoMovel";
 
$sql = "INSERT INTO movel (categoriaMovel, corMovel, materialMovel, compMovel, larguraMovel, quantDisponivel, precoMovel)
        VALUES ('".$categoriaMovel."', '".$corMovel."','".$materialMovel."', '".$compMovel."','".$larguraMovel."', '".$quantDisponivel."', '".$precoMovel."')";
 
$result = mysqli_query($con, $sql);
if ($result) {
    echo "<br><br>Dados inseridos com sucesso!";
} else {
    echo "<br><br>Erro ao inserir a banco de dados: ".mysqli_error($con);
}
?>