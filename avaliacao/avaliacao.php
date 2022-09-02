
<?php
session_start();
include('conexao.php');

if(!empty($_POST['wood'])){
	$estrela = $_POST['avaliacao'];
	
	//Salvar os dados no banco de dados
	$result_avaliacos = "INSERT INTO avaliacao (qnt_estrela, created) VALUES ('$estrela', NOW())";
	$resultado_avaliacos = mysqli_query($conn, $result_avaliacos);
	
	if(mysqli_insert_id($conn)){
		$_SESSION['msg'] = "nos do Wood agradecemos sua avaliação";
		header("Location: tela_avaliacao.php");
	}else{
		$_SESSION['msg'] = "Erro ao enviar a avaliação";
		header("Location: tela_avaliacao.php");
	}
	
}else{
	$_SESSION['msg'] = "É nescessario selecionar ao menos uma estrela";
	header("Location: tela_avaliacao.php");
}