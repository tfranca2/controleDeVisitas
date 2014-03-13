<?php
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
	require_once('conexao.class.php');
    require_once('crud.class.php');
	
	$erros = 0;	
	$getExcluir = @$_GET['excluir'];
	$getEditar = @$_GET['editar'];
	
	if(isset($_POST['cadastrar']) || isset($_POST['editar']) || isset($getExcluir)  ){
		$valores = array(
			 "nome" => mysql_real_escape_string(@$_POST['nome'])
			, "setor" => mysql_real_escape_string(  (@$_POST['setor']))
		);
		
		
		foreach( $valores as $valor ) {
			if(empty($valor)) {
				$erros = 1;
				echo "Preencha todos os campos corretamente!";
				break;
			}
		}
				
		$con = new conexao(); 
		$con->connect(); 
		
		if(isset($_POST['cadastrar']) and !$erros ){
			$valores_imp = " '".implode("', '", $valores)."' ";			
			$crud = new crud('funcionario');
			$result = $crud->selecionar("nome","habilitado<>0");
			foreach($result as $valor){
				if($valor['nome'] == $valores['nome']){
					$erros = 1;
					break;
				}
			}
			if(!$erros)	{
				$crud->inserir(" `nome`, `setor`, `habilitado`", $valores_imp.", '1' ");
				unset($valores);
				unset($_POST);
				header("Location: index.php?p=listarFuncionarios");
			} else {
				echo "Funcion&aacute;rio j&aacute; existente no banco de dados.";
			}
		}
		if(isset($_POST['editar']) and !$erros ){
			$valores['id_funcionario'] = $getEditar;
			$crud = new crud('funcionario');
			$crud->atualizar(" `nome`='$valores[nome]', `setor`='$valores[setor]'"," MD5(`id_funcionario`) = '".criptografar($valores['id_funcionario'])."' ");
			unset($valores);
			unset($_POST);
			header("Location: index.php?p=listarFuncionarios");
		}
		
		if(isset($getExcluir)){
			$valores['id_funcionario'] = $getExcluir;
			$crud = new crud('funcionario');
			$crud->deletar("MD5(`id_funcionario`)='".criptografar($valores['id_funcionario'])."'");
			unset($valores);
			unset($_POST);
			header("Location: index.php?p=listarFuncionarios");
		}
		
		$con->disconnect();
	}
	
