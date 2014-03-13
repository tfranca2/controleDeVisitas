<?php
	require_once('controle/controleVisitante.php');
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
	if(!$_SESSION['usuario_admin'])
		if(!$_SESSION['usuario_edicao']) 
			header('location: index.php');
	
	$con = new conexao();
    $con->connect();
	
	@$getId = $_GET['editar'];
	unset($_GET);
	
    if(@$getId){
		$crud = new crud('visita');
		$result = $crud->query(" 
					SELECT 
						v.`id_visita`, 
						vis.`nome` as nome_visitante, 
						vis.`empresa`, 
						vis.`foto`,
						fun.`nome` as nome_funcionario, 
						fun.`id_funcionario`,
						v.`objetivo_visita`, 
						v.`carga`,
						vei.`modelo`,
						vei.`cor`,
						vei.`placa`,
						vei.`vistoria_entrada`
					FROM `visita` v
						INNER JOIN `visitante` vis ON (vis.`id_visitante` = v.`visitante_idvisitante`)
						INNER JOIN `funcionario` fun ON (fun.`id_funcionario` = v.`funcionario_idfuncionario`)
						LEFT JOIN `veiculo` vei ON (vei.`visita_idvisita` = v.`id_visita`)

						
					WHERE v.`habilitado` <> 0
						AND v.`visita_em_andamento` <> 0
						AND v.`id_visita` = $getId
						
					ORDER BY v.`entrada` ASC;
		");
		
		foreach($result as $campo){
			$valores = $campo;
			$_SESSION['modelo'] = $valores['modelo'];
		}
	}
	
?>

<script type="text/javascript">
function habilitar(){  
    if(document.getElementById('entrada_veiculo').checked){  
		document.getElementById('carregamento').disabled = false;
        document.getElementById('modelo').disabled = false; 
		document.getElementById('modelo').required = true; 
		document.getElementById('cor').disabled = false;
		document.getElementById('cor').required = true;
		document.getElementById('placa').disabled = false;
		document.getElementById('placa').required = true;
		document.getElementById('vistoria_entrada').disabled = false;
		document.getElementById('vistoria_entrada').required = true;
    } else {  
		document.getElementById('carregamento').disabled = true;
		document.getElementById('carregamento').checked = false;
        document.getElementById('modelo').disabled = true;
		document.getElementById('modelo').required = false;
		document.getElementById('cor').disabled = true;
		document.getElementById('cor').required = false;
		document.getElementById('placa').disabled = true;
		document.getElementById('placa').required = false;
		document.getElementById('vistoria_entrada').disabled = true;  
		document.getElementById('vistoria_entrada').required = false;  
    }  
}  

$( document ).ready(function() {
    if(document.getElementById('entrada_veiculo').checked){  
		document.getElementById('carregamento').disabled = false;
        document.getElementById('modelo').disabled = false;  
		document.getElementById('cor').disabled = false;
		document.getElementById('placa').disabled = false;
		document.getElementById('vistoria_entrada').disabled = false;
    } else {  
		document.getElementById('carregamento').disabled = true;
		document.getElementById('carregamento').checked = false;
        document.getElementById('modelo').disabled = true;
		document.getElementById('cor').disabled = true;
		document.getElementById('placa').disabled = true;
		document.getElementById('vistoria_entrada').disabled = true;  
    }  
});
</script>

   <script>
  $(function() {
    var possiveisEmpresas = [
      <?php
	$crud = new crud('visitante');
	$consult = $crud->query("select distinct empresa from visitante order by empresa");
 	foreach($consult as $valor){
		@$empresas .= "\n\t\t".' "'.$valor['empresa'].'",';	
	}
	$empresas = substr($empresas,0,strlen($empresas)-1);
	echo $empresas;
?>
  
    ];
    $( "#empresa" ).autocomplete({
      source: possiveisEmpresas
    });
  });
  </script>
<div class="form form-large">
	<h3>Cadastro de Visitante</h3>
	<form action="" method="post" enctype="multipart/form-data" >	
		<div id="shell">
        	<div class="inputFile">
            	<img id="imgAvatar" src="<?php 
								if($getId) 
									if( @!empty($valores['foto'])) {
										echo @$valores['foto']; 
									}else 
									echo "images/fotos_visitante/default_user.png"; 	
								else 
									echo "images/fotos_visitante/default_user.png"; ?>" alt="Foto do visitante" />
                <input name="avatar" id="avatar" type="file" onchange="readURL(this);" />
        	</div>
            <span id="lblFoto">Foto</span>
            <script type="text/javascript">
            	function readURL(input) {
                	if (input.files && input.files[0]) {
                    	var reader = new FileReader();
                       	reader.onload = function (e) {
                        	$('#imgAvatar')
                          	.attr('src', e.target.result)
                           	.width(150)
                           	.height(150);
                        };
                       	reader.readAsDataURL(input.files[0]);
               		}
            	}
      		</script>
        </div>
		<label class="clear-none">Nome: <input type="text" required id="nome" name="nome" autofocus <?php echo "value=\"".@$valores['nome_visitante']."\""; ?> /> </label> <br />
		<label class="clear-none" for="empresa">Empresa: <input type="text" required id="empresa" name="empresa" <?php echo "value=\"".@$valores['empresa']."\""; ?> /> </label> <br />
        <label class="clear-none">Funcion&aacute;rio: &nbsp;&nbsp;&nbsp;<select required name="funcionario" id="funcionario" class="selectpicker"><option value=""></option>
         <?php
					$crud = new crud('funcionario');
					$consult = $crud->selecionar("id_funcionario,nome","habilitado<>0 ORDER BY `nome` ASC");
					foreach($consult as $func){
						if(@$func['id_funcionario'] == @$valores['id_funcionario'])
							echo '<option value="'.$func['id_funcionario'].'" selected>'.$func['nome'].'</option>';		
						else
							echo '<option value="'.$func['id_funcionario'].'">'.$func['nome'].'</option>';
					}
		?>
        </select> </label>  <br />
		<script type="text/javascript">
          $(document).ready(function(e) {
              $('.selectpicker').selectpicker();
          });
      </script>
		<div class="form-liquid">
		<label>Objetivo da visita: <textarea required name="objetivo_visita" id="objetivo_visita" ><?php echo @$valores['objetivo_visita']?></textarea> </label> <br />
			<label>Entrada com ve&iacute;culo: <input type="checkbox" id="entrada_veiculo" name="entrada_veiculo" <?php if(@$valores['modelo']) echo "checked" ?> onclick="habilitar();" /> </label> <br />
			<label>Carregamento: <input type="checkbox" name="carregamento" id="carregamento" disabled <?php if(@$valores['carga']) echo "checked" ?>  /></label><br />
			<label>Modelo: <input type="text" required id="modelo" name="modelo" disabled <?php echo "value=\"".@$valores['modelo']."\""; ?>  /> </label> <br />
			<label>Placa: <input type="text" required id="placa" name="placa" disabled <?php echo "value=\"".@$valores['placa']."\""; ?>  /> </label> <br />
			<label>Cor: <input type="text" required id="cor" name="cor" disabled <?php echo "value=\"".@$valores['cor']."\""; ?> /> </label> <br />
			<label>Vistoria de entrada: <textarea required name="vistoria_entrada" id="vistoria_entrada" disabled ><?php echo @$valores['vistoria_entrada']?></textarea> </label> <br />
			<?php if(@$getId) { ?>
			<label>Justificativa: <textarea required name="justificativa" id="justificativa" ></textarea> </label> <br />
			<?php }?>
		</div>

		<input type="submit" value="Salvar" name="<?php echo (@$getId)?'editar':'cadastrar'; ?>" class="btn"/>
	</form>
</div>
<?php $con->disconnect();  ?>
