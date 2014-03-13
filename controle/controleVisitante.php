<?php
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
	require_once('ImageUploader.class.php');
	require_once('conexao.class.php');
    require_once('crud.class.php');
    
	$erros = 0;	
	$getFinalizar = @$_GET['finalizar'];
	$getEditar = @$_GET['editar'];
	$getVistoria = @$_GET['vistoria'];
	
	if(isset($_POST['cadastrar']) || isset($_POST['editar']) || isset($getFinalizar)){
		$valores = array(
			  "nome" => mysql_real_escape_string(@$_POST['nome'])
			, "empresa" => mysql_real_escape_string(@$_POST['empresa'])
		);
		
		foreach( $valores as $valor ) {
			if(empty($valor)) {
				$erros = 1;
				alerta("Preencha todos os campos corretamente!");
				break;
			}
		}
			
		if(isset($_POST['cadastrar']) and !$erros ){
			$img = new ImageUploader("images/fotos_visitante", 350, 350);
			$valores_imp = " '".implode("', '", $valores)."' ";	
			$crud = new crud('visitante');		
			$crud->inserir(" `nome`, `empresa`, `foto`", $valores_imp.", '".$img->caminho."' ");
			unset($valores);
			
			$valores = array(
			 "entrada" => date("Y-m-d H:i:s")
			 , "objetivo_visita" => mysql_real_escape_string(@$_POST['objetivo_visita'])
			 , "funcionario" => mysql_real_escape_string(@$_POST['funcionario'])
			);
			foreach( $valores as $valor ) {
				if(empty($valor)) {
					$erros = 1;
					alerta("Preencha todos os campos corretamente!");
					break;
				}
			}
			$valores['carga'] = (!empty($_POST['carregamento']))?1:0 ;
			$idvisitante = mysql_insert_id();
			if( !$erros ){
				$valores_imp = " '".implode("', '", $valores)."' ";	
				$crud = new crud('visita');		
				$crud->inserir(		"`entrada`,`objetivo_visita`,`funcionario_idfuncionario`,`carga`,`visitante_idvisitante`,`visita_em_andamento`,`habilitado`",				$valores_imp.",$idvisitante,'1','1'" );
				unset($valores);
			} 
		
			$entrada_veiculo = (!empty($_POST['entrada_veiculo']))?1:0 ;
			$id_visita = mysql_insert_id();
			if($entrada_veiculo){
				$valores = array(
					"modelo" => mysql_real_escape_string(@$_POST['modelo'])
					,"cor" => mysql_real_escape_string(@$_POST['cor'])
					,"placa" => mysql_real_escape_string(@$_POST['placa'])
					,"vistoria_entrada" => mysql_real_escape_string(@$_POST['vistoria_entrada'])
				);
			
				foreach( $valores as $valor ) {
					if(empty($valor)) {
						$erros = 1;
						alerta("Preencha todos os campos corretamente!");
						break;
					}
				}
				if( !$erros ){
					$valores_imp = " '".implode("', '", $valores)."' ";	
					$crud = new crud('veiculo');		
					$crud->inserir("`modelo`,`cor`,`placa`,`vistoria_entrada`,`visita_idvisita`", $valores_imp.", $id_visita" );
					unset($valores);
					unset($_POST);
				} 
			}
			header("Location: index.php?p=listarVisitas");
		}
		if(isset($_POST['editar']) and !$erros ){
				$crud = new crud('visita');
				$result = $crud->selecionar("visitante_idvisitante","MD5(`id_visita`) = '".criptografar($getEditar)."' LIMIT 1");
				foreach($result as $campo){	
					$id_visitante['visitante_idvisitante']=$campo['visitante_idvisitante'];
				}
				
				$_SESSION['justificativa'] = mysql_real_escape_string(@$_POST['justificativa']);
				if(!isset($_SESSION['justificativa']) or $_SESSION['justificativa'] == " "){ 
					$erros = 1; 
					alerta("Preencha a justificativa!");
				}
				
				$img_upd = new ImageUploader("images/fotos_visitante", 350, 350);

				$crud = new crud('visitante');
				$crud->atualizar("nome='$valores[nome]', empresa='$valores[empresa]', foto='".$img_upd->caminho."' "
								, "`id_visitante`='$id_visitante[visitante_idvisitante]'");
				unset($valores);
				
				$valores = array(
			 	"objetivo_visita" => mysql_real_escape_string(@$_POST['objetivo_visita'])
			 	, "funcionario" => mysql_real_escape_string(@$_POST['funcionario'])
				);
				foreach( $valores as $valor ) {
					if(empty($valor)) {
						$erros = 1;
						alerta("Preencha todos os campos corretamente!");
						break;
					}
				}
				$valores['carga'] = (!empty($_POST['carregamento']))?1:0 ;
								
				if( !$erros ){
					$crud = new crud('visita');		
					$crud->atualizar(		"objetivo_visita='$valores[objetivo_visita]',funcionario_idfuncionario='$valores[funcionario]',carga='$valores[carga]',visitante_idvisitante='$id_visitante[visitante_idvisitante]'","id_visita='$getEditar'" );
					unset($valores);
				}
				
				$entrada_veiculo = (!empty($_POST['entrada_veiculo']))?1:0 ;
				if($entrada_veiculo){
						$valores = array(
							"modelo" => mysql_real_escape_string(@$_POST['modelo'])
							,"cor" => mysql_real_escape_string(@$_POST['cor'])
							,"placa" => mysql_real_escape_string(@$_POST['placa'])
							,"vistoria_entrada" => mysql_real_escape_string(@$_POST['vistoria_entrada'])
						);
			
						foreach( $valores as $valor ) {
							if(empty($valor)) {
								$erros = 1;
								alerta("Preencha todos os campos corretamente!");
								break;
							}
						}
						if( !$erros ){
							if($_SESSION['modelo']){
								$crud = new crud('veiculo');		
								$crud->atualizar("modelo='$valores[modelo]',cor='$valores[cor]',placa='$valores[placa]',vistoria_entrada='$valores[vistoria_entrada]'", "visita_idvisita=$getEditar");
								unset($valores);
							}else{
								$valores_imp = " '".implode("', '", $valores)."' ";	
								$crud = new crud('veiculo');		
								$crud->inserir("`modelo`,`cor`,`placa`,`vistoria_entrada`,`visita_idvisita`", $valores_imp.", $getEditar" );
								unset($valores);
							}
						}
				}elseif($_SESSION['modelo']){
					$crud = new crud('veiculo');		
					$crud->atualizar("visita_idvisita=0", "visita_idvisita=$getEditar");
					unset($valores);
				}
				unset($_SESSION['modelo']);
				unset($_POST);
				header("Location: index.php?p=listarVisitas");
		}
		if(isset($getFinalizar)){
			$valores['id_visita'] = $getFinalizar;
			$valores['saida'] = date("Y-m-d H:i:s");
			$valores['vistoria_saida'] = $getVistoria;
			
			$crud = new crud('visita');
			$crud->atualizar("saida='$valores[saida]', visita_em_andamento = 0","MD5(`id_visita`)='".criptografar($valores['id_visita'])."'");
			
			$crud = new crud('veiculo');
			$crud->atualizar("vistoria_saida='$valores[vistoria_saida]'","MD5(`visita_idvisita`)='".criptografar($valores['id_visita'])."'");
			
			unset($valores);
			unset($_POST);
			//unset($_SESSION['justificativa']);
			header("Location: index.php?p=listarVisitas");
		}
	}