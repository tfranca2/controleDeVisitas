<?php 
if(isset($_SESSION['login'])){
	require_once('menu.php');
}
require_once('funcoes.php');
protegeArquivo(basename( __FILE__ ));


$paginas = array(
    "login"=>"login.php",
	"alterarSenha"=>"cadastros/alterarSenha.php", 
    "cadastrarFuncionario"=>"cadastros/cadastrarFuncionario.php", 
    "cadastrarUsuario"=>"cadastros/cadastrarUsuario.php", 
    "cadastrarVisitante"=>"cadastros/cadastrarVisitante.php", 
    "listarFuncionarios"=>"listagem/listarFuncionarios.php", 
    "listarUsuarios"=>"listagem/listarUsuarios.php",
    "listarVeiculos"=>"listagem/listarVeiculos.php", 
    "listarVisitas"=>"listagem/listarVisitas.php",
	"relatorioFuncionario"=>"listagem/relatorios.php",
	"relatorioEmpresa"=>"listagem/relatorios.php",
	"relatorioMes"=>"listagem/relatorios.php",
	"relatorioTempoMedio"=>"listagem/relatorios.php",
	"relatorioCarga"=>"listagem/relatorios.php"
);

if(@isset($_GET['p'])){
		if(isset($_SESSION['login'])){
			if($_SESSION['senha_alterada']){
				incluiPagina($paginas['alterarSenha']);
			}else
				incluiPagina($paginas[$_GET['p']]);
		}else
			incluiPagina($paginas['login']);
}else
	header("Location: index.php?p=login");
