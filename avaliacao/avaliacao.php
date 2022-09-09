
<?php
session_start();
include('conexao.php');

if(!empty($_POST['wood'])){
	$estrela = $_POST['avaliacao'];
	
	//Salvar os dados no banco de dados
	$result_avaliacos = "INSERT INTO avaliacao (codAvaliar, estrela, dataAvaliar, observacao) 
	VALUES ('$codavaliar', '$estrela', '$dataAvaliar', '$observacao', NOW())";
	$resultado_avaliacos = mysqli_query($conn, $result_avaliacos);
	
	if(mysqli_insert_id($conn)){
		$_SESSION['msg'] = "O Wood agradece sua avaliação";
		header("Location: tela_avaliacao.php");
	}else{
		$_SESSION['msg'] = "Erro ao enviar a avaliação";
		header("Location: tela_avaliacao.php");
	}
	
}else{
	$_SESSION['msg'] = "É nescessario selecionar ao menos uma estrela";
	header("Location: tela_avaliacao.php");
}