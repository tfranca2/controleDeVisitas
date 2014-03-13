<?php
    
    require_once('conexao.class.php');
    require_once('crud.class.php');
    require_once('funcoes.php');
    
	protegeArquivo(basename( __FILE__ ));
    
    if( isset($_POST['login']) ){
        $con = new conexao(); 
        $con->connect(); 
        
        $consulta = mysql_query("SELECT * FROM usuario WHERE 
									MD5(login) = '".criptografar($_POST['usuario'])."' 
									AND usuario_ativo = 1 
									AND habilitado = 1 
								LIMIT 1");
        $result = mysql_fetch_array($consulta);
        
        if(criptografar($_POST['senha'])==$result['senha']){
            
            $_SESSION['id_usuario'] = $result['id_usuario'];
            $_SESSION['nome'] = $result['nome'];
            $_SESSION['login'] = $result['login'];
            $_SESSION['senha'] = $result['senha'];
			$_SESSION['senha_alterada'] = $result['senha_alterada'];
            $_SESSION['usuario_ativo'] = $result['usuario_ativo'];
            $_SESSION['usuario_edicao'] = $result['usuario_edicao'];
            $_SESSION['usuario_admin'] = $result['usuario_admin'];
            
            header("Location: index.php?p=listarVisitas");
        } else {
        	alerta("Você não pode fazer login!");
        }
        
        $con->disconnect();
    } else if(isset($_SESSION['login'])) {
            header("Location: index.php?p=listarVisitas");
	}

?>

        <div class="form">
            <form method="post">
            	<h3>Login</h3>
                <label> Usu&aacute;rio:  <input type="text" name="usuario" required autofocus /> </label> <br />
                    <label> Senha:  <input type="password" name="senha" required /> </label><br />
                    <input type="submit" name="login" value="Login" class="btn btn-large btn-primary" /> 
            </form>
        </div>
