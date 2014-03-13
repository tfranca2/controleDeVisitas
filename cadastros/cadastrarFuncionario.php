<?php
	require_once('controle/controleFuncionario.php');
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
	if(!$_SESSION['usuario_admin'])
		//if(!$_SESSION['usuario_edicao']) 
			header('location: index.php');
	
	$con = new conexao();
    $con->connect();
	
    @$getId = $_GET['editar'];
	unset($_GET);
	
	 if(@$getId){
		$crud = new crud('funcionario');
		$result = $crud->selecionar("nome,setor","MD5(`id_funcionario`) = '".criptografar($getId)."' LIMIT 1");
		foreach($result as $campo){	
			$valores['nome']=$campo['nome'];
			$valores['setor']=$campo['setor'];
		}
	 }
?>
<div class="form">
	<h3>Cadastro de Funcion&aacute;rio</h3>
	<form action="" method="post">
		<label>Nome: <input type="text" required id="nome" name="nome" autofocus <?php echo "value=\"".@$valores['nome']."\""; ?>  /> </label> <br />
  		<label>Setor: <input type="text" required id="setor" name="setor" <?php echo "value=\"".@$valores['setor']."\""; ?>  /> </label> <br />
		<br />
  		<input type="submit" name="<?php echo (@$getId)?'editar':'cadastrar'; ?>" value="Salvar" class="btn" />
	</form>
</div>
<?php $con->disconnect();  ?>