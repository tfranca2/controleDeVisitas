<?php
    @include_once('funcoes.php');
    protegeArquivo(basename( __FILE__ ));
    verificaLogin();
    
	require_once('conexao.class.php');
    require_once('crud.class.php');
	
    $con = new conexao(); 
    $con->connect();  

?>
<div class="container">
<h3>Lista de Usu&aacute;rios</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Nome</th>
					<th>Administrador</th>
                    <th>Edi&ccedil;&atilde;o</th>
					<th>Ativo</th>
					<th></th>
                </tr>
            </thead>
            <tbody>
			
                <?php
					$crud = new crud('usuario');
					$result = $crud->selecionar("","habilitado<>0 ORDER BY `nome` ASC");
					foreach($result as $campo){
                ?>
				
                    <tr>
                        <td><?php echo $campo['nome']; ?></td>
						<td class="center"><img src="<?php if($campo['usuario_admin']) echo "images/save.gif"; else echo "images/drop.gif"; ?>" /></td>
						<td class="center"><img src="<?php if($campo['usuario_edicao']) echo "images/save.gif"; else echo "images/drop.gif"; ?>" /></td>
                        <td class="center"><img src="<?php if($campo['usuario_ativo']) echo "images/save.gif"; else echo "images/drop.gif"; ?>" /></td>
                        <td><a href="<?php echo "index.php?p=cadastrarUsuario&editar=".$campo['login']; ?>"><img src="images/edit.gif" alt="Editar" title="Editar" /></a>
						    <a href="<?php echo "index.php?p=cadastrarUsuario&excluir=".$campo['login']; ?>"><img src="images/trash.gif" alt="Excluir" title="Excluir" /></a></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
</div>
<?php $con->disconnect(); ?>

