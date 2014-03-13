<?php
require_once('conexao.class.php');

class log{
	private $login="";
	private $sql="";
	private $horario="";
	private $justificativa="";
	private $ip="";
	
	public function __construct( $sql, $justificativa) {
		$this->login = $_SESSION['login'];
        $this->sql = mysql_real_escape_string($sql);
		$this->horario = date("Y-m-d H:i:s");
		$this->justificativa = $justificativa;
		$this->ip = $_SERVER['REMOTE_ADDR'];
		
		$query = explode(" ", $this->sql);
		$blacklist = array(
			"insert", "update", "delete", "truncate", "drop", "DECLARE", "EXEC", "SET", 
			"CAST",	"alter", "index", "event", "trigger", "grant", "super", "process",
			"reload", "shutdown", "lock", "replication", "user"
		);
		foreach($query as $part){
			foreach($blacklist as $word){
				if( strripos($part, $word) === false ){
					continue;
				} else {
					$this->gravarLog();
					break;
				}
			}
		}
    }
	
	private function gravarLog(){
		$con = new conexao(); 
		$con->connect();
		
		mysql_query("INSERT INTO `log` 
				(`usuario`, `sql`, `horario`, `justificativa`, `ip`) 
			VALUES ('".$this->login."', '".$this->sql."', '".$this->horario.
					"', '".$this->justificativa."', '".$this->ip."'); ");
	}
}