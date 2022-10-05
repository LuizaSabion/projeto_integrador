<?php
    include('conexao.php');

    $id_usuario = $_GET['tipo'];
    $sql = 'DELETE FROM tipo WHERE tipo='.$tipo;

    echo "<h1> Exclusão do Rascunho </h1>";

	$result = mysqli_query($con, $sql);

	if($result)
		echo "Registro excluído com sucesso<br>";
	else
		echo "Erro ao tentar excluir usuário: ".mysqli_error($con)."<br>";
  
?>