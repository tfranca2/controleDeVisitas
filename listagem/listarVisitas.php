<?php
    @include_once('funcoes.php');
    protegeArquivo(basename( __FILE__ ));
    
	require_once('conexao.class.php');
    require_once('crud.class.php');
	
    $con = new conexao(); 
    $con->connect(); 
	
?>
<?php if(@$_SESSION['usuario_edicao']) { ?>
	
	<a style="float: right; clear: both; margin:5px 5px 0 0;" 
		href="index.php?p=cadastrarVisitante"
		class="btn btn-large btn-success"
		alt="Adicionar" title="Adicionar">Add +</a>
		
		<?php } ?>
<h3>Visitas em andamento</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Empresa</th>
					<th>Acompanhante</th>
					<th>Objetivo</th>
					<th>Entrada</th>
                </tr>
            </thead>
            <tbody>
			
                <?php
                    $query = " 
					SELECT 
						v.`id_visita`, 
						vis.`nome` as nome_visitante, 
						vis.`empresa`, 
						fun.`nome` as nome_funcionario, 
						v.`objetivo_visita`, 
						DATE_FORMAT( v.`entrada` , 	'%d/%m/%Y %H:%i') AS entrada,
						vei.`id_veiculo` IS NOT NULL AS `veiculo`
					FROM `visita` v
						INNER JOIN `visitante` vis ON (vis.`id_visitante` = v.`visitante_idvisitante`)
						INNER JOIN `funcionario` fun ON (fun.`id_funcionario` = v.`funcionario_idfuncionario`)
						LEFT JOIN `veiculo` vei ON (vei.`visita_idvisita` = v.`id_visita`)
						
					WHERE v.`habilitado` <> 0
						AND v.`visita_em_andamento` <> 0
						
					ORDER BY v.`entrada` ASC; ";

					$crud = new crud('visita');
					$result = $crud->query($query);
					
					if($result){
						foreach($result as $campo){ 
                ?>
				
                    <tr>
                        <td><?php echo $campo['nome_visitante']; ?></td>
                        <td><?php echo $campo['empresa']; ?></td>
						<td><?php echo $campo['nome_funcionario']; ?></td>
						<td><?php echo $campo['objetivo_visita']; ?></td>
						<td><?php echo $campo['entrada']; ?></td>
						<?php if(@$_SESSION['usuario_edicao']) { ?><td><a <?php if($campo['veiculo']) echo 'class="vistoria"'; ?> href="<?php echo "index.php?p=cadastrarVisitante&finalizar=".@$campo['id_visita']; ?>"><img src="images/save.gif" alt="Finalizar" title="Finalizar" /></a></td>
                        <td><a href="<?php echo "index.php?p=cadastrarVisitante&editar=".@$campo['id_visita']; ?>"><img src="images/edit.gif" style="width:10px;" title="Editar" /></a></td>
					<?php } ?></tr>
                <?php } 
				} else {
					echo "
					<tr>
						<td colspan=\"5\">Sem visitas em aberto no momento.</td>
					</tr>
					";
				}
			?></tbody>
        </table>
<?php $con->disconnect();?>

<script>
  $(function() {
    var vistoria_saida = $( "#vistoria_saida" ),
      allFields = $( [] ).add( vistoria_saida ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
	
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "Finalizar": function() {
          var bValid = true;
          allFields.removeClass( "ui-state-error" );
		  if(vistoria_saida.val()==""){ bValid = false; }
		  else if ( bValid ) {
            href = valor + "&vistoria=" + vistoria_saida.val();
			$(location).attr('href', href);
            $( this ).dialog( "close" );
          }
        },
        "Cancelar": function() {
			$("a[href= #]").attr('href', valor);
			$( this ).dialog( "close" );
        }
      },
	  open: function() {
            $('.ui-dialog-buttonpane').find('button').addClass('btn');
        } ,
      close: function() {
		  $("a[href= #]").attr('href', valor);
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });

    $( ".vistoria" )
      .button()
      .click(function() {
		    valor = $(this).attr('href');
		$(this).attr('href','#');
        $( "#dialog-form" ).dialog( "open" );
      });
  });
  </script>

<div id="dialog-form" title="Vistoria de Saída">
  <p class="validateTips"></p>
 
  <form>
  <fieldset>
    <textarea name="vistoria_saida" id="vistoria_saida" class="text ui-widget-content ui-corner-all" required placeholder="Digite aqui..."></textarea>
  </fieldset>
  </form>
</div>
