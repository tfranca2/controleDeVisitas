<?php
    @include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
	require_once('conexao.class.php');
    require_once('crud.class.php');
    
	$erros = 0;	
	$getExcluir = @$_GET['excluir'];
	
	if(isset($_POST['cadastrar']) || isset($_POST['editar']) || isset($getExcluir)  ){
		$valores = array(
			 "nome" => mysql_real_escape_string(@$_POST['nome'])
			, "login" => mysql_real_escape_string(  (@$_POST['login'])?$_POST['login']:$_SESSION['login_modify']  )
		);
		$er = '/\w+\.?\w+$/';  
		if(!preg_match($er,$valores['login'])){
			$erros=1;
			alerta("Login inválido!");
		}
		
		if(@isset($_POST['cadastrar'])){
			if(@isset($_POST['senha']) and @!empty($_POST['senha'])){
				$valores['senha'] = criptografar(@$_POST['senha']);
			}
		}		
			
		foreach( $valores as $valor ) {
			if(empty($valor)) {
				$erros = 1;
				alerta("Preencha todos os campos corretamente!");
				break;
			}
		}

		if(@isset($_POST['editar'])){
			if(@isset($_POST['senha']) and @!empty($_POST['senha'])){
				$valores['senha'] = criptografar(@$_POST['senha']);
				$valores['senha_alterada'] = 1;
			}else{
				$crud = new crud('usuario');
				$result = $crud->selecionar("senha"," MD5(`login`)='".criptografar($_GET['editar'])."'");
				$valores['senha'] = $result[0]['senha'];
				$valores['senha_alterada'] = 0;
			}
		}
		
		$valores['usuario_admin'] = (!empty($_POST['admin']))?1:0 ;
		$valores['usuario_edicao'] = (!empty($_POST['edicao']))?1:0 ;
		$valores['usuario_ativo'] = (!empty($_POST['ativo']))?1:0 ;
		
		if(@$valores['usuario_admin']) @$valores['usuario_edicao'] = 1;
		
		$con = new conexao(); 
		$con->connect(); 
		
		if(isset($_POST['cadastrar']) and !$erros ){
			$valores_imp = " '".implode("', '", $valores)."' ";			
			$crud = new crud('usuario');
			$result = $crud->selecionar("login","");
			foreach($result as $valor){
				if($valor['login'] == $valores['login']){
					$erros = 1;
					break;
				}
			}
			if(!$erros)	{
				$crud->inserir(" `nome`, `login`, `senha`, `usuario_admin`,
								`usuario_edicao`, `usuario_ativo`,`senha_alterada`, `habilitado` ", $valores_imp.", '1','1'");
				unset($valores);
				unset($_POST);
				header("Location: index.php?p=listarUsuarios");
			} else {
				alerta("Usu&aacute;rio j&aacute; existente no banco de dados.");
			}
		}

		if(isset($_POST['editar']) and !$erros ){
			$_SESSION['justificativa'] = mysql_real_escape_string(@$_POST['justificativa']);
			if(!isset($_SESSION['justificativa']) or $_SESSION['justificativa'] == " "){ 
				$erros = 1; 
				alerta("Preencha todos os campos corretamente!");
			}
		
			$crud = new crud('usuario');
			$crud->atualizar("	  nome='$valores[nome]'
								, senha='$valores[senha]'
								, senha_alterada='$valores[senha_alterada]'
								, usuario_admin='$valores[usuario_admin]'
								, usuario_edicao='$valores[usuario_edicao]'
								, usuario_ativo='$valores[usuario_ativo]' "
								, "`login`='$valores[login]'");
			unset($valores);
			unset($_POST);
			//unset($_SESSION['justificativa']);
			header("Location: index.php?p=listarUsuarios");
		}
		
		if(isset($getExcluir)){
			$valores['login'] = $getExcluir;
			$crud = new crud('usuario');
			$crud->deletar("MD5(`login`)='".criptografar($valores['login'])."'");
			unset($valores);
			unset($_POST);
			header("Location: index.php?p=listarUsuarios");
		}
		
		$con->disconnect();
	}
	
