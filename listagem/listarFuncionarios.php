<?php
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));

    require_once('conexao.class.php');
    require_once('crud.class.php');

    $con = new conexao(); 
    $con->connect(); 

?>
<div class="container">
<h3>Listagem de funcion&aacute;rios</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>
                        Nome
                    </th>
                    <th>
                        Setor
                    </th>
                    <th> </th>
                </tr>
            </thead>
            <tbody>
                <?php
					$crud = new crud('funcionario');
					$result = $crud->selecionar("","habilitado<>0 ORDER BY `nome` ASC");
					foreach($result as $campo){ 
					?>
                    <tr>
                        <td> <?php echo $campo['nome']; ?> </td>
                        <td> <?php echo $campo['setor']; ?> </td>
						<?php if(@$_SESSION['usuario_edicao']) { ?><td> 
							<a href="<?php echo "index.php?p=cadastrarFuncionario&editar=".$campo['id_funcionario']; ?>"><img src="images/edit.gif" alt="Editar" title="Editar" /></a> 
							<a href="<?php echo "index.php?p=cadastrarFuncionario&excluir=".$campo['id_funcionario']; ?>"><img src="images/trash.gif" alt="Excluir" title="Excluir" /></a> 
						</td><?php } ?>
                    </tr>
                <?php 
					} 
					
					$con->disconnect();
				?>
            </tbody>
        </table>
	</div>