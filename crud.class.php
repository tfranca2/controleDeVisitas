<?php
@include_once('funcoes.php');
protegeArquivo( basename( __FILE__ ) );

require_once('conexao.class.php');
require_once('log.class.php');

  class crud {
    private $sql_ins="";
    private $tabela="";
    private $sql_sel="";
    
    /** Método construtor
      * @method __construct
      * @param string $tabela
      * @return $this->tabela
      */
    public function __construct($tabela) {
		$con = new conexao(); 
		$con->connect();
		
        $this->tabela = $tabela;
        return $this->tabela;
    }
    
    /** Método inserir
      * @method inserir
      * @param string $campos
      * @param string $valores
      * @example: $campos = "codigo, nome, email" e $valores = "1, 'João Brito', 'joao@joao.net'"
      * @return void
      */        
    public function inserir($campos, $valores) {
        $this->sql_ins = "INSERT INTO `".$this->tabela."`( $campos ) VALUES ( $valores );";
		$log = new log($this->sql_ins, @$_SESSION['justificativa']);
		if(!$this->ins = mysql_query($this->sql_ins)) die();
    }
    
	public function selecionar($campos, $where) {
		$campos = ($campos)?$campos:"*";
        if($where) $this->sql_sel = "SELECT $campos FROM ".$this->tabela." WHERE $where ;";
		else $this->sql_sel = "SELECT $campos FROM ".$this->tabela." ;";
		$log = new log($this->sql_sel, "");
        if(!$this->sel = mysql_query($this->sql_sel)) die();
		$result = null;
		while($linha = mysql_fetch_assoc($this->sel))
			$result[] = $linha;
		return $result;
    }
	
	public function query($query) {
		$log = new log($query, "");
		if(!$this->q = mysql_query($query)) die();
		$result = null;
		while($linha = mysql_fetch_assoc($this->q))
			$result[] = $linha;
		return $result;
	}
	
    public function atualizar($camposvalores, $where) {
		if($where){
			$this->sql_upd = "UPDATE `".$this->tabela."` SET $camposvalores WHERE $where ;";
			$log = new log($this->sql_upd, @$_SESSION['justificativa']);
			if(!$this->upd = mysql_query($this->sql_upd)) die();
		}
    }    
    
	public function deletar($clausula) {
		$this->atualizar("habilitado=0", $clausula);
    } 
}