<?php
@include_once('funcoes.php');
protegeArquivo( basename( __FILE__ ) );

class ImageUploader{
    var $pasta;
    var $nome;
    var $largura;
    var $altura;
    var $tmp_name;
    var $arquivo;
    var $caminho;
    private $erro = false;

    /** 
     * Inicia os parametros básicos para o upload da imagem.
     * @param Pasta de destino da imagem.
     * @param Largura da imagem.
     * @param Altura da imagem.
     */
    public function __construct($pastaDeDestino, $largura, $altura ){
        if( !empty($_FILES['avatar']) && !empty($_FILES['avatar']['name']) ){
            $this->pasta     = $pastaDeDestino;
            $this->nome      = $_FILES['avatar']['name'];
            $this->tmp_name  = $_FILES['avatar']['tmp_name'];
            $this->largura   = $largura*2;
            $this->altura    = $altura*2;
	
			$this->uploadArquivo();

            if( !empty($this->nome)&& !$this->erro )
                $this->caminho = $this->pasta.'/'.$this->nome;
        }
    }

    /** 
     * Gerar um nome único para o arquivo 
     */
    private function nomeRandomico() {
        $novoNome = "";
        for($i=0; $i<10; $i++) {
            $novoNome .= rand(0,9);
        }
        $novoNome = $novoNome.'_'.md5(md5($novoNome).md5(rand(0,9)));
        return $novoNome;
    }

    /** 
     * Upa o arquivo para o servidor
     */
    private function uploadArquivo() {
        if( preg_match("/\.(pjpeg|jpg|jpeg){1}$/i", $_FILES['avatar']["name"], $ext) ) { 
            if($_FILES['avatar']['size'] < 2048000){
                $this->nome = $this->nomeRandomico().".jpg";
                chmod($this->pasta."/", 0777);
                if(move_uploaded_file($this->tmp_name, $this->pasta."/".$this->nome)){
                    $this->erro = false;
                    $this->redimensiona();
                } else {
                    alerta('N&atilde;o foi poss&iacute;vel salvar a imagem no servidor!');
                    $this->erro = true;
                }
            } else {
                alerta('Imagem muito grande!');
                $this->erro = true;  
            }
        } else {
            alerta('Tipo de arquivo inv&aacute;lido!');
            $this->erro = true;
        }  
    }

    /** 
     * Redimensionar a imagem 
     */
    private function redimensiona() {
        $img = $this->pasta."/".$this->nome;
        list($larguraOriginal, $alturaOriginal, $type) = getimagesize($img);
        if ($this->largura && ($larguraOriginal < $alturaOriginal))
            $this->largura = ($this->altura / $alturaOriginal) * $larguraOriginal;
        else
            $this->altura = ($this->largura / $larguraOriginal) * $alturaOriginal;
        $novaImagem = imagecreatetruecolor($this->largura, $this->altura);
        $image = imagecreatefromjpeg($img);
        imagecopyresampled($novaImagem, $image, 0, 0, 0, 0, $this->largura, $this->altura, $larguraOriginal, $alturaOriginal);
        imagejpeg($novaImagem, $img, 100);
    }

    /** 
     * Diz se houve algum erro na execução da classe
     * @return Booleano do erro
     */
    public function getErro(){
        return $this->erro;
    }
}