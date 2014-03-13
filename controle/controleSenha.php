<?php
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
	require_once('conexao.class.php');
    require_once('crud.class.php');

	$erros = 0;	
	
	if(isset($_POST['alterarSenha'])){
		$valores = array(
			 "senha" => mysql_real_escape_string(@$_POST['senha'])
			, "nova_senha" => mysql_real_escape_string(@$_POST['nova_senha'])
			, "repetir_senha" => mysql_real_escape_string(@$_POST['repetir_senha'])
		);
		
		foreach( $valores as $valor ) {
			if(empty($valor)) {
				$erros = 1;
				echo "Preencha todos os campos corretamente!";
				break;
			}
		}
		@$valores['login'] = $_SESSION['login'];
		@$valores['senha'] = criptografar($valores['senha']);
		@$valores['nova_senha'] = criptografar($valores['nova_senha']);
		@$valores['repetir_senha'] = criptografar($valores['repetir_senha']);
				
		$con = new conexao(); 
		$con->connect(); 
		if(@$valores['senha']==$_SESSION['senha'] and @$valores['nova_senha']==@$valores['repetir_senha']){
			$crud = new crud('usuario');
			$crud->atualizar("senha='$valores[nova_senha]', senha_alterada='0'"
								, "`login`='$valores[login]'");
			unset($valores);
			header("Location: logout.php");
		}else{
			echo'Senha atual inv&aacute;lida!';
		}
		$con->disconnect();
	}
?>