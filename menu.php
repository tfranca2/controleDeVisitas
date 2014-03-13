
<div id="menu">
  <ul id="nav">
    <li><a href="index.php?p=listarVisitas">Home</a></li>
    <li><a href="#">Listar</a>
      <ul>
        <li><a href="index.php?p=listarVeiculos">Ve&iacute;culos</a></li>
        <li><a href="index.php?p=listarFuncionarios">Funcion&aacute;rios</a></li>
        <?php if($_SESSION['usuario_admin']){ ?><li><a href="index.php?p=listarUsuarios">Usu&aacute;rios</a></li><?php } ?>
      </ul>
    </li>
    <?php if($_SESSION['usuario_edicao']){ ?>
    <li><a href="#">Cadastrar</a>
      <ul>
        <li><a href="index.php?p=cadastrarVisitante">Visitante</a></li>
        <?php if($_SESSION['usuario_admin']){ ?>
        <li><a href="index.php?p=cadastrarFuncionario">Funcion&aacute;rio</a></li>
        <li><a href="index.php?p=cadastrarUsuario">Usu&aacute;rio</a></li>
        <?php } ?>
      </ul>
    </li>
    <?php } ?>
    <li><a href="#">Relat&oacute;rios</a>
      <ul>
		<li><a href="index.php?p=relatorioEmpresa">Empresa</a></li>
      	<li><a href="index.php?p=relatorioFuncionario">Funcion&aacute;rio</a></li>
      	<li><a href="index.php?p=relatorioTempoMedio">Perman&ecirc;ncia</a></li>
      	<li><a href="index.php?p=relatorioCarga">Carga</a></li>
      </ul>
    </li>
    <li><a href="index.php?p=alterarSenha">Alterar senha</a></li>
    <li><a href="logout.php">Sair</a></li>
  </ul>
</div>