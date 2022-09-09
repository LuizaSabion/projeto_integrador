<?php

include('conexao.php');
 
//Upload da foto    
$fotoNome = $_FILES['foto']['name'];
$target_dir = "escolha_comodo/selecionar_comodo.html/";
$target_file = $target_dir . basename($_FILES["foto"]["name"]);
// Select file type
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Valid file extensions
$extensions_arr = array("jpg","jpeg","png","gif");

?>
