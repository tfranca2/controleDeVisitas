<?php
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
	require_once('conexao.class.php');
    require_once('crud.class.php');
	
    $con = new conexao(); 
    $con->connect();
?>

<form class="form-inline float-right margin-top-small margin-right-small" name="filtro" >
	<input type="hidden" name="p" value="<?php echo $_GET['p'] ?>">
	<label for="from">De</label> <input type="text" id="from" name="from"<?php echo ' value="'.@$_GET['from'].'"';?> required />
	<label for="to">At&eacute;</label> <input type="text" id="to" name="to"<?php echo ' value="'.@$_GET['to'].'"';?> required />
	<strong><a href="#" onclick="filtro.submit();" class="btn btn-primary">Filtrar</a></strong>
</form>

<h3>Relat&oacute;rios</h3>
<?php
		$TituloRelatorio = "";
		$legendaX = "";
		$legendaY = "";
		$eixoX = "";
		$sufixo = "";
		$series = "";
		$between = " AND v.`entrada` BETWEEN DATE_SUB((DATE_SUB(curdate(), INTERVAL 5 MONTH)), INTERVAL day(curdate())-1 DAY) AND CURDATE() ";
		
		if(@isset($_GET['from']) and !empty($_GET['from']) and @isset($_GET['to'])and !empty($_GET['to'])){
			$from = converteData( mysql_real_escape_string($_GET['from']));
			$to = converteData( mysql_real_escape_string($_GET['to']));
			
			if(validateDate($from, 'Y-m-d') and validateDate($to, 'Y-m-d'))
				$between = " AND v.`entrada` BETWEEN '$from' AND '$to' ";
		}
		
		if($_GET['p'] == "relatorioEmpresa"){
			$query = " 
				SELECT  
					vis.`empresa` , 
					DATE_FORMAT( v.`entrada` , '%m' ) AS `mes`
				FROM `visita` v
					INNER JOIN `visitante` vis ON ( v.`visitante_idvisitante` = vis.`id_visitante` )
				WHERE v.`habilitado` <> 0 $between
					GROUP BY vis.`empresa`, `mes`; ";
					
			$crud = new crud('visita');
			$result = $crud->query($query);
			if($result){
				foreach($result as $campo){	
					$meses_nomes[] = nomeMesPtBr($campo['mes'], 0);
					$meses[] = $campo['mes'];
					$empresas[] = $campo['empresa'];
				}	
				
				$meses_nomes = array_unique($meses_nomes);
				$meses = array_unique($meses);
				$empresas = array_unique($empresas);
				$agrupamento = array();
					
				foreach($empresas as $empresa){
					foreach($meses as $mes){
						$query = "
							SELECT 
								vis.`empresa` , 
								MONTH(v.`entrada`) AS `mes`,
								COUNT(v.`entrada`) AS `quantidade`
							FROM `visita` v
							INNER JOIN `visitante` vis 
								ON ( v.`visitante_idvisitante` = vis.`id_visitante` )
							WHERE 
								v.`habilitado` <> 0 AND
								vis.`empresa` = '$empresa' AND
								MONTH(v.`entrada`) = $mes $between
    
							GROUP BY vis.`empresa`, `mes`;
						";
						$result = $crud->query($query);
						if($result)
							@$agrupamento[$empresa] .= " ".$result[0]['quantidade'].",";
						else
							@$agrupamento[$empresa] .= " 0,";
							
					}
					$a['empresa'] =  $empresa;
					$a['quantidade'] =  $agrupamento[$empresa];
					$a['quantidade'] = substr($a['quantidade'], 0, strlen($series)-1);
					$group[] =	$a;
				}
				
				$TituloRelatorio = "Total de visitas por empresa";
				$legendaX = "";
				$legendaY = "Empresas";
				$eixoX = " '".implode("', '", $meses_nomes)."' ";
				$sufixo = " Visitas(s)";
				
				foreach($group as $valor){
					$series .= "\n\t\t\t\t\t\t\t
							{	name: '".$valor['empresa']."',
								data: [ ".$valor['quantidade']." ]	},";
				}
				$series = substr($series, 0, strlen($series)-1);
			}
		} else if($_GET['p'] == "relatorioFuncionario"){
			$query = "SELECT 
						fun.`nome`, 
						MONTH(v.`entrada`) AS `mes`,
						COUNT(MONTH(v.`entrada`)) AS `quantidade`
					FROM `visita` v
					INNER JOIN `funcionario` fun 
						ON (fun.`id_funcionario` = v.`funcionario_idfuncionario`)
					WHERE
						v.`habilitado` <> 0
						AND v.`visita_em_andamento` = 0 $between
					GROUP BY fun.`nome`, `mes`; ";
			
			$crud = new crud('visita');
			$result = $crud->query($query);
			if($result){
				foreach($result as $campo){	
					$meses_nomes[] = nomeMesPtBr($campo['mes'], 0);
					$meses[] = $campo['mes'];
					$nomes[] = $campo['nome'];
				}	
				
				$meses_nomes = array_unique($meses_nomes);
				$meses = array_unique($meses);
				$nomes = array_unique($nomes);
				$agrupamento = array();
					
				foreach($nomes as $nome){
					foreach($meses as $mes){
						$query = "
							SELECT 
								fun.`nome`, 
								MONTH(v.`entrada`) AS `mes`,
								COUNT(MONTH(v.`entrada`)) AS `quantidade`
							FROM `visita` v
							INNER JOIN `funcionario` fun 
								ON (fun.`id_funcionario` = v.`funcionario_idfuncionario`)
							WHERE
								v.`habilitado` <> 0
								AND v.`visita_em_andamento` = 0
								AND fun.`nome` = '$nome'
								AND MONTH(v.`entrada`) = $mes $between
							GROUP BY fun.`nome`, `mes`; ;
						";
						$result = $crud->query($query);
						if($result)
							@$agrupamento[$nome] .= " ".$result[0]['quantidade'].",";
						else
							@$agrupamento[$nome] .= " 0,";
							
					}
					$a['nome'] =  $nome;
					$a['quantidade'] =  $agrupamento[$nome];
					$a['quantidade'] = substr($a['quantidade'], 0, strlen($series)-1);
					$group[] =	$a;
				}
				
				$TituloRelatorio = "Total de visitas atendidas por funcionário por mês";
				$legendaX = "";
				$legendaY = "Empresas";
				$eixoX = " '".implode("', '", $meses_nomes)."' ";
				$sufixo = " Visitas(s)";
				
				foreach($group as $valor){
					$series .= "\n\t\t\t\t\t\t\t
							{	name: '".$valor['nome']."',
								data: [ ".$valor['quantidade']." ]	},";
				}
				$series = substr($series, 0, strlen($series)-1);
			}
		} else if($_GET['p'] == "relatorioTempoMedio"){
			$query = "SELECT 
						vis.`empresa`, 
						MONTH(v.`entrada`) AS `mes`,  
						SEC_TO_TIME( AVG ( TIME_TO_SEC( TIMEDIFF( v.`saida`, v.`entrada`) ) ) ) AS `media_mes`
					FROM
						`visita` v
					INNER JOIN `visitante` vis 
						ON v.`visitante_idvisitante` = vis.`id_visitante`
					WHERE 
						v.`habilitado`<>0
						AND v.`visita_em_andamento`=0 $between
					GROUP BY vis.`empresa`, `mes`;";
			$crud = new crud('visita');
			$result = $crud->query($query);
			if($result){
				foreach($result as $campo){	
					$empresas[] = $campo['empresa'];
					$meses[] = $campo['mes'];
					$meses_nomes[] = nomeMesPtBr($campo['mes'], 0);
				}
				
				$empresas = array_unique($empresas);
				$meses = array_unique($meses);
				$meses_nomes = array_unique($meses_nomes);
				$agrupamento = array();
					
				foreach($empresas as $empresa){
					foreach($meses as $mes){
						$query = "
							SELECT 
								vis.`empresa`, 
								MONTH(v.`entrada`) AS `mes`,  
								SEC_TO_TIME( AVG ( TIME_TO_SEC( TIMEDIFF( v.`saida`, v.`entrada`) ) ) ) AS `media_mes`
							FROM
								`visita` v
							INNER JOIN `visitante` vis 
								ON v.`visitante_idvisitante` = vis.`id_visitante`
							WHERE 
								v.`habilitado`<>0
								AND v.`visita_em_andamento`=0
								AND vis.`empresa` = '$empresa' 
								AND MONTH(v.`entrada`) = $mes $between
							GROUP BY vis.`empresa`, `mes`;
						";
						$result = $crud->query($query);
						if($result){
							$result[0]['media_mes'] = substr($result[0]['media_mes'], 0, -3);
							$result[0]['media_mes'] = explode(":", $result[0]['media_mes']);
							$result[0]['media_mes'] = $result[0]['media_mes'][0].".".$result[0]['media_mes'][1];
							$result[0]['media_mes'] = floatval($result[0]['media_mes']);
							@$agrupamento[$empresa] .= " ".$result[0]['media_mes'].",";
						}
						else
							@$agrupamento[$empresa] .= " 0,";
							
					}
					$a['empresa'] =  $empresa;
					$a['media_mes'] =  $agrupamento[$empresa];
					$a['media_mes'] = substr($a['media_mes'], 0, strlen($series)-1);
					$group[] =	$a;
				}
				
				$TituloRelatorio = "Tempo médio de carregamentos por mês";
				$legendaX = "";
				$legendaY = "Horas";
				$eixoX = " '".implode("', '", $meses_nomes)."' ";
				$sufixo = " Hora(s)";
				
				foreach($group as $valor){
					$series .= "\n\t\t\t\t\t\t\t
							{	name: '".$valor['empresa']."',
								data: [ ".$valor['media_mes']." ]	},";
				}
				$series = substr($series, 0, strlen($series)-1);
			}
		} else if($_GET['p'] == "relatorioCarga"){
			$query = " 
				SELECT 
					MONTH(v.`entrada`) AS `mes`, 
					COUNT(v.`id_visita`) AS `quantidade`
				FROM `visita` v
					WHERE v.`visita_em_andamento` = 0 
					AND v.`entrada` $between
				GROUP BY MONTH(v.`entrada`)
				ORDER BY v.`entrada` ; ";
			$crud = new crud('visita');
			$result = $crud->query($query);
			if($result){
				foreach($result as $campo){	
					$mes_nome[] = nomeMesPtBr($campo['mes'], 0);
					$quantidade[] = $campo['quantidade'];
				}	
				
				$mes_nome = " '".implode("', '", $mes_nome)."' ";
				$quantidade = implode(", ", $quantidade);
				
				$TituloRelatorio = "Total de carregamentos por mês";
				$legendaX = "";
				$legendaY = "Quantidade";
				$eixoX = $mes_nome;
				$sufixo = " Carregamento(s)";
				$series = "{	name: 'Carga',
								data: [ $quantidade ] }";
								
			} else {
				echo "Registros não localizados.";
			}
		}else{
			echo "Relatório não localizado.";
		}
?>

<script type="text/javascript">
			$(function () {
					$('#container').highcharts({
						title: {
							text: '<?php echo $TituloRelatorio; ?>',
							x: -20 //center
						},
						subtitle: {
							text: '',
							x: -20
						},
						xAxis: {
							categories: [<?php echo $eixoX; ?>]
						},
						yAxis: {
							title: {
								text: '<?php echo $legendaY; ?>'
							},
							plotLines: [{
								value: 0,
								width: 2,
								color: '#F00'
							}]
						},
						tooltip: {
							valueSuffix: '<?php echo $sufixo; ?>'
						},
						legend: {
							layout: 'vertical',
							align: 'right',
							verticalAlign: 'middle',
							borderWidth: 0
						},
						series: [ <?php echo $series; ?>
						
						]
					});
				});
		</script>

<script src="js/highcharts.js"></script>
<script src="js/exporting.js"></script>
<?php 
	if(false)
	if($_GET['p'] == "relatorioEmpresa"){ 
?>
<script>
	$(document).ready(function(){
		var series = $('#container').highcharts().series;
		for (var i=0; i<series.length; i++) {
			series[i].hide();
		}
	});
</script>
<?php } ?>
<script>
	$(function() {
		$( "#from" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onClose: function( selectedDate ) {
				$( "#to" ).datepicker( "option", "minDate", selectedDate );
			}
		});
		$( "#to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onClose: function( selectedDate ) {
				$( "#from" ).datepicker( "option", "maxDate", selectedDate );
			}
		});
	});
</script>

<div id="container"></div>