<?php
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));

    require_once('conexao.class.php');
    require_once('crud.class.php');

    $con = new conexao(); 
    $con->connect();  

?>
<div class="container">
<h3>Listagem de ve&iacute;culos</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>
                        Modelo
                    </th>
					<th>
                        Placa
                    </th>
					<th>
                        Objetivo
                    </th>
					<th>
                        Empresa
                    </th>
					<th>
                        Entrada
                    </th>
                </tr>
            </thead>
            <tbody>
                <?php
				
					$query = "  SELECT 
									vei.`modelo`, 
									vei.`placa`, 
									v.`objetivo_visita`, 
									vis.`empresa`,
									DATE_FORMAT( v.`entrada` , 	'%d/%m/%Y %H:%i') AS entrada
								FROM `visita` v
								INNER JOIN `visitante` vis ON (vis.`id_visitante` = v.`visitante_idvisitante`)
								RIGHT JOIN `veiculo` vei ON (vei.`visita_idvisita` = v.`id_visita`)
								WHERE v.`habilitado` <> 0
								AND v.`visita_em_andamento`<>0
								ORDER BY v.`entrada` ASC; ";

					$crud = new crud('visita');
					$result = $crud->query($query);
					
					if($result){
						foreach($result as $campo){ 
					?>
                    <tr>
                        <td> <?php echo $campo['modelo']; ?> </td>
                        <td> <?php echo $campo['placa']; ?> </td>
                        <td> <?php echo $campo['objetivo_visita']; ?> </td>
                        <td> <?php echo $campo['empresa']; ?> </td>
                        <td> <?php echo $campo['entrada']; ?> </td>
                    </tr>
                <?php 
						} 
					} else { 
						echo "<tr>
							<td colspan=\"5\">N&atilde;o h&aacute; dados para serem exibidos.</td>
						</tr>";
					}
					$con->disconnect();
				?>
            </tbody>
        </table>
	</div>