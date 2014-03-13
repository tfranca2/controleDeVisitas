<?php
	require_once('controle/controleUsuario.php');
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
		$crud = new crud('usuario');
		$result = $crud->selecionar("","MD5(`login`) = '".criptografar($getId)."' LIMIT 1");
		foreach($result as $campo){
			$valores = $campo;
		}
    }
	
	$_SESSION['login_modify'] = @$valores['login'];
	
?>
    <div class="form">
        <h3>Casdastro de Usu&aacute;rio</h3>
        <form method="post">
            <label>Nome: <input type="text" name="nome" <?php echo "value=\"".@$valores['nome']."\""; ?> required autofocus /> </label> <br />
            <label>Login: <input type="text" name="login" <?php echo "value=\"".@$valores['login']."\""; if( @$getId) echo " disabled"; ?> required pattern="\w+\.?\w+" /> </label> <br />
            <label><?php if(@$getId){ echo "Nova senha:";}else{ echo "Senha:";} ?> <input type="password" name="senha" <?php if(!@$getId){ echo"required";} ?>/> </label> <br />
            <label>Administrador:<input type="checkbox" name="admin" <?php if(@$valores['usuario_admin'] == 1) echo "checked"; ?> /> </label> <br />
            <label>Permiss&atilde;o de edi&ccedil;&atilde;o:<input type="checkbox" name="edicao" <?php if(@$valores['usuario_edicao'] == 1) echo "checked"; ?> /> </label> <br />
            <label>Ativo: <input type="checkbox" name="ativo" <?php 
																if( @$getId) {
																	if( @$valores['usuario_ativo'] == 1) 
																		echo "checked "; 
																} else
																	echo "checked "; 
															  ?> /> </label> <br />
        <?php if( @$getId) { ?>
		<label>Justificativa: <textarea required name="justificativa"></textarea> </label>
		<?php } ?>
            <input type="submit" class="btn" name="<?php echo (@$getId)?'editar':'cadastrar'; ?>" value="Salvar" />
		</form>
    </div>
<?php $con->disconnect(); ?>