<?php
	require_once('controle/controleSenha.php');
	@include_once('../funcoes.php');
    protegeArquivo(basename( __FILE__ ));
	
?>
<script>
$(document).ready(function(){
	$("#alterarSenha").validate({
		rules:{
        	senha:{required:true},
            nova_senha:{required:true, rangelength:[5,40]},
            repetir_senha:{required:true, equalTo:"#nova_senha"}
		}
	});
});
</script>
<div class="form">
    <h3>Alterar Senha</h3>
	<form method="post" id="alterarSenha">
		<label>Senha atual:<input type="password" required id="senha" name="senha" autofocus /> </label> <br />
        <label>Nova senha:<input type="password" required id="nova_senha" name="nova_senha" /> </label> <br />
  		<label>Repetir nova senha: <input type="password" id="repetir_senha" name="repetir_senha" /> </label> <br /> <br />
  		<input type="submit" name="alterarSenha" value="Salvar" class="btn" />
	</form>
</div>