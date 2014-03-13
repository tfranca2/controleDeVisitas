-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.27
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `controledevisitas`
--
CREATE DATABASE `controledevisitas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `controledevisitas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `setor` varchar(100) DEFAULT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `setor`, `habilitado`) VALUES
(1, 'Tiago FranÃ§a', 'TI', 1),
(2, 'Marcos Harter', 'ManutenÃ§Ã£o', 1),
(3, 'Erminio Jardim', 'Almoxarifado', 1),
(4, 'Fernando Sousa', 'ArmazÃ©m', 1),
(5, 'Alessandra Cunha', 'DP', 1),
(6, 'Silvia Untem', 'Diretoria', 1),
(7, 'Bruno Silva', 'Compras2', 1),
(8, 'Yuri Santana', 'EstagiÃ¡rio', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(150) NOT NULL,
  `sql` varchar(255) DEFAULT NULL,
  `horario` datetime DEFAULT NULL,
  `justificativa` varchar(150) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `fk_log_usuario1_idx` (`usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=217 ;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id_log`, `usuario`, `sql`, `horario`, `justificativa`, `ip`) VALUES
(1, 'tiago', 'UPDATE `visita` SET saida=''2013-12-11 08:49:42'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''70efdf2ec9b086079795c442636b55fb'' ;', '2013-12-11 08:49:43', '', '::1'),
(2, 'tiago', 'UPDATE `visita` SET saida=''2013-12-11 08:49:42'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''70efdf2ec9b086079795c442636b55fb'' ;', '2013-12-11 08:49:43', '', '::1'),
(3, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''70efdf2ec9b086079795c442636b55fb'' ;', '2013-12-11 08:49:44', '', '::1'),
(4, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''70efdf2ec9b086079795c442636b55fb'' ;', '2013-12-11 08:49:44', '', '::1'),
(5, 'tiago', 'UPDATE `usuario` SET nome=''asdf'', senha=''912ec803b2ce49e4a541068d495ab570'', senha_alterada=''1''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''0''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 10:54:24', 'w', '::1'),
(6, 'tiago', 'UPDATE `usuario` SET nome=''asdf'', senha=''912ec803b2ce49e4a541068d495ab570'', senha_alterada=''1''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''0''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 10:54:24', 'w', '::1'),
(7, 'tiago', 'UPDATE `usuario` SET nome=''asdf'', senha=''912ec803b2ce49e4a541068d495ab570'', senha_alterada=''1''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''0''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 10:54:24', 'w', '::1'),
(8, 'tiago', 'UPDATE `usuario` SET 	  nome=''asdf''\r\n								, senha=''912ec803b2ce49e4a541068d495ab570''\r\n								, senha_alterada=''0''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''1''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 11:19:11', 'd', '::1'),
(9, 'tiago', 'UPDATE `usuario` SET 	  nome=''asdf''\r\n								, senha=''912ec803b2ce49e4a541068d495ab570''\r\n								, senha_alterada=''0''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''1''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 11:19:11', 'd', '::1'),
(10, 'tiago', 'UPDATE `usuario` SET 	  nome=''asdf''\r\n								, senha=''912ec803b2ce49e4a541068d495ab570''\r\n								, senha_alterada=''0''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''1''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 11:19:11', 'd', '::1'),
(11, 'tiago', 'UPDATE `usuario` SET 	  nome=''asdf''\r\n								, senha=''76d80224611fc919a5d54f0ff9fba446''\r\n								, senha_alterada=''1''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''1''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 11:19:55', 'a', '::1'),
(12, 'tiago', 'UPDATE `usuario` SET 	  nome=''asdf''\r\n								, senha=''76d80224611fc919a5d54f0ff9fba446''\r\n								, senha_alterada=''1''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''1''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 11:19:55', 'a', '::1'),
(13, 'tiago', 'UPDATE `usuario` SET 	  nome=''asdf''\r\n								, senha=''76d80224611fc919a5d54f0ff9fba446''\r\n								, senha_alterada=''1''\r\n								, usuario_admin=''0''\r\n								, usuario_edicao=''1''\r\n								, usuario_ativo=''1''  WHERE `login`=''asdf'' ;', '2013-12-11 11:19:55', 'a', '::1'),
(14, 'tiago', 'UPDATE `visita` SET saida=''2013-12-19 22:52:33'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''c51ce410c124a10e0db5e4b97fc2af39'' ;', '2013-12-19 22:52:34', '', '::1'),
(15, 'tiago', 'UPDATE `visita` SET saida=''2013-12-19 22:52:33'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''c51ce410c124a10e0db5e4b97fc2af39'' ;', '2013-12-19 22:52:34', '', '::1'),
(16, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''c51ce410c124a10e0db5e4b97fc2af39'' ;', '2013-12-19 22:52:34', '', '::1'),
(17, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''c51ce410c124a10e0db5e4b97fc2af39'' ;', '2013-12-19 22:52:34', '', '::1'),
(18, 'tiago', 'UPDATE `visita` SET saida=''2014-01-07 07:36:56'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''aab3238922bcc25a6f606eb525ffdc56'' ;', '2014-01-07 07:36:57', '', '::1'),
(19, 'tiago', 'UPDATE `visita` SET saida=''2014-01-07 07:36:56'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''aab3238922bcc25a6f606eb525ffdc56'' ;', '2014-01-07 07:36:57', '', '::1'),
(20, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''aab3238922bcc25a6f606eb525ffdc56'' ;', '2014-01-07 07:36:57', '', '::1'),
(21, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''aab3238922bcc25a6f606eb525ffdc56'' ;', '2014-01-07 07:36:57', '', '::1'),
(22, 'tiago', 'UPDATE `visita` SET saida=''2014-01-07 09:13:14'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''9bf31c7ff062936a96d3c8bd1f8f2ff3'' ;', '2014-01-07 09:13:15', '', '::1'),
(23, 'tiago', 'UPDATE `visita` SET saida=''2014-01-07 09:13:14'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''9bf31c7ff062936a96d3c8bd1f8f2ff3'' ;', '2014-01-07 09:13:15', '', '::1'),
(24, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''9bf31c7ff062936a96d3c8bd1f8f2ff3'' ;', '2014-01-07 09:13:16', '', '::1'),
(25, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''9bf31c7ff062936a96d3c8bd1f8f2ff3'' ;', '2014-01-07 09:13:16', '', '::1'),
(26, 'tiago', 'INSERT INTO `visitante`(  `nome`, `empresa`, `foto` ) VALUES (  ''Mario'', ''M&L encanadores'' , ''''  );', '2014-01-07 09:20:21', '', '::1'),
(27, 'tiago', 'INSERT INTO `visita`( `entrada`,`objetivo_visita`,`funcionario_idfuncionario`,`carga`,`visitante_idvisitante`,`visita_em_andamento`,`habilitado` ) VALUES (  ''2014-01-07 09:20:21'', ''conserto de encamento'', ''2'', ''0'' ,18,''1'',''1'' );', '2014-01-07 09:20:21', '', '::1'),
(28, 'tiago', 'INSERT INTO `veiculo`( `modelo`,`cor`,`placa`,`vistoria_entrada`,`visita_idvisita` ) VALUES (  ''fusca'', ''amarelo'', ''olx1235'', ''ferramentas'' , 18 );', '2014-01-07 09:20:21', '', '::1'),
(29, 'tiago', 'UPDATE `visita` SET saida=''2014-01-07 09:36:06'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''6f4922f45568161a8cdf4ad2299f6d23'' ;', '2014-01-07 09:36:07', '', '::1'),
(30, 'tiago', 'UPDATE `visita` SET saida=''2014-01-07 09:36:06'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''6f4922f45568161a8cdf4ad2299f6d23'' ;', '2014-01-07 09:36:07', '', '::1'),
(31, 'tiago', 'UPDATE `veiculo` SET vistoria_saida=''ferramentas'' WHERE MD5(`visita_idvisita`)=''6f4922f45568161a8cdf4ad2299f6d23'' ;', '2014-01-07 09:36:07', '', '::1'),
(32, 'tiago', 'UPDATE `veiculo` SET vistoria_saida=''ferramentas'' WHERE MD5(`visita_idvisita`)=''6f4922f45568161a8cdf4ad2299f6d23'' ;', '2014-01-07 09:36:07', '', '::1'),
(33, 'tiago', 'INSERT INTO `visitante`(  `nome`, `empresa`, `foto` ) VALUES (  ''GalvÃ£o'', ''Dejair Transportes'' , ''''  );', '2014-01-07 10:15:57', '', '::1'),
(34, 'tiago', 'INSERT INTO `visita`( `entrada`,`objetivo_visita`,`funcionario_idfuncionario`,`carga`,`visitante_idvisitante`,`visita_em_andamento`,`habilitado` ) VALUES (  ''2014-01-07 10:15:58'', ''Carregamento de cerveja'', ''4'', ''1'' ,19,''1'',''1'' );', '2014-01-07 10:15:58', '', '::1'),
(35, 'tiago', 'INSERT INTO `veiculo`( `modelo`,`cor`,`placa`,`vistoria_entrada`,`visita_idvisita` ) VALUES (  ''Mercedes-Benz 2213'', ''azul'', ''HEL6666'', ''Garrafeiras com vazilhames'' , 19 );', '2014-01-07 10:15:58', '', '::1'),
(36, 'tiago', 'INSERT INTO `visitante`(  `nome`, `empresa`, `foto` ) VALUES (  ''Jorge'', ''JetPack'' , ''''  );', '2014-01-07 10:23:00', '', '::1'),
(37, 'tiago', 'INSERT INTO `visita`( `entrada`,`objetivo_visita`,`funcionario_idfuncionario`,`carga`,`visitante_idvisitante`,`visita_em_andamento`,`habilitado` ) VALUES (  ''2014-01-07 10:23:00'', ''envio de equipamentos para a filial'', ''3'', ''0'' ,20,''1'',''1'' );', '2014-01-07 10:23:00', '', '::1'),
(38, 'tiago', 'INSERT INTO `veiculo`( `modelo`,`cor`,`placa`,`vistoria_entrada`,`visita_idvisita` ) VALUES (  ''TOWNER JR CABINE SIMPLES BAÃš'', ''branca'', ''DAS0945'', ''vaizo'' , 20 );', '2014-01-07 10:23:00', '', '::1'),
(39, 'tiago', 'UPDATE `visitante` SET nome=''Jorge'', empresa=''JetPack'', foto=''''  WHERE `id_visitante`=''20'' ;', '2014-01-07 10:23:34', 'foto', '::1'),
(40, 'tiago', 'UPDATE `visitante` SET nome=''Jorge'', empresa=''JetPack'', foto=''''  WHERE `id_visitante`=''20'' ;', '2014-01-07 10:23:34', 'foto', '::1'),
(41, 'tiago', 'UPDATE `visita` SET objetivo_visita=''envio de equipamentos para a filial'',funcionario_idfuncionario=''3'',carga=''0'',visitante_idvisitante=''20'' WHERE id_visita=''20'' ;', '2014-01-07 10:23:34', 'foto', '::1'),
(42, 'tiago', 'UPDATE `visita` SET objetivo_visita=''envio de equipamentos para a filial'',funcionario_idfuncionario=''3'',carga=''0'',visitante_idvisitante=''20'' WHERE id_visita=''20'' ;', '2014-01-07 10:23:34', 'foto', '::1'),
(43, 'tiago', 'UPDATE `veiculo` SET modelo=''TOWNER JR CABINE SIMPLES BAÃš'',cor=''branca'',placa=''DAS0945'',vistoria_entrada=''vaizo'' WHERE visita_idvisita=20 ;', '2014-01-07 10:23:34', 'foto', '::1'),
(44, 'tiago', 'UPDATE `veiculo` SET modelo=''TOWNER JR CABINE SIMPLES BAÃš'',cor=''branca'',placa=''DAS0945'',vistoria_entrada=''vaizo'' WHERE visita_idvisita=20 ;', '2014-01-07 10:23:34', 'foto', '::1'),
(45, 'tiago', 'INSERT INTO `visitante`(  `nome`, `empresa`, `foto` ) VALUES (  ''Mario'', ''M&L encanadores'' , ''''  );', '2014-01-07 10:25:05', 'foto', '::1'),
(46, 'tiago', 'INSERT INTO `visita`( `entrada`,`objetivo_visita`,`funcionario_idfuncionario`,`carga`,`visitante_idvisitante`,`visita_em_andamento`,`habilitado` ) VALUES (  ''2014-01-07 10:25:05'', ''conserto'', ''2'', ''0'' ,21,''1'',''1'' );', '2014-01-07 10:25:05', 'foto', '::1'),
(47, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:06:54', 'e', '::1'),
(48, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:06:54', 'e', '::1'),
(49, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:06:54', 'e', '::1'),
(50, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:06:54', 'e', '::1'),
(51, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:09:18', 'f', '::1'),
(52, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:09:18', 'f', '::1'),
(53, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:09:18', 'f', '::1'),
(54, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:09:18', 'f', '::1'),
(55, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:09:34', 'hj', '::1'),
(56, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:09:34', 'hj', '::1'),
(57, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:09:35', 'hj', '::1'),
(58, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:09:35', 'hj', '::1'),
(59, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:10:25', 's', '::1'),
(60, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:10:25', 's', '::1'),
(61, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:10:26', 's', '::1'),
(62, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:10:26', 's', '::1'),
(63, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:15:38', 'as', '::1'),
(64, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:15:38', 'as', '::1'),
(65, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:15:38', 'as', '::1'),
(66, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:15:38', 'as', '::1'),
(67, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:17:47', 's', '::1'),
(68, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:17:47', 's', '::1'),
(69, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:17:47', 's', '::1'),
(70, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:17:47', 's', '::1'),
(71, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:20:42', 's', '::1'),
(72, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:20:42', 's', '::1'),
(73, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:20:43', 's', '::1'),
(74, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:20:43', 's', '::1'),
(75, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:21:50', 's', '::1'),
(76, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:21:50', 's', '::1'),
(77, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:21:50', 's', '::1'),
(78, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:21:50', 's', '::1'),
(79, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/0405458630_e3e85ad93f5cf462b40dd07688bd6500.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:22:39', 'a', '::1'),
(80, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/0405458630_e3e85ad93f5cf462b40dd07688bd6500.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:22:39', 'a', '::1'),
(81, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:22:39', 'a', '::1'),
(82, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:22:39', 'a', '::1'),
(83, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ADAILSON TRAJANO DOS SANTOS 2.JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:26:21', 'a', '::1'),
(84, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ADAILSON TRAJANO DOS SANTOS 2.JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:26:21', 'a', '::1'),
(85, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:26:21', 'a', '::1'),
(86, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:26:21', 'a', '::1'),
(87, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ADAILSON TRAJANO DOS SANTOS 2.JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:27:40', 'as', '::1'),
(88, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ADAILSON TRAJANO DOS SANTOS 2.JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:27:40', 'as', '::1'),
(89, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:27:40', 'as', '::1'),
(90, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:27:40', 'as', '::1'),
(91, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/AGNALDO DOS SANTOS ROCHA(3).JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:28:46', 's', '::1'),
(92, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/AGNALDO DOS SANTOS ROCHA(3).JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:28:46', 's', '::1'),
(93, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:28:46', 's', '::1'),
(94, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:28:46', 's', '::1'),
(95, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ALEXSANDRO LEITE DA ROCHA (2).JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:29:46', 's', '::1'),
(96, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ALEXSANDRO LEITE DA ROCHA (2).JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:29:46', 's', '::1'),
(97, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:29:46', 's', '::1'),
(98, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:29:46', 's', '::1'),
(99, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ALBANIZA PRAXEDES DACOSTA.JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:30:47', 'd', '::1'),
(100, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ALBANIZA PRAXEDES DACOSTA.JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:30:47', 'd', '::1'),
(101, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:30:47', 'd', '::1'),
(102, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:30:47', 'd', '::1'),
(103, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ANA KAROLINE CARVALHO PEREIRA (2).JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:31:30', 'sfd', '::1'),
(104, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/ANA KAROLINE CARVALHO PEREIRA (2).JPG''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:31:30', 'sfd', '::1'),
(105, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:31:30', 'sfd', '::1'),
(106, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:31:30', 'sfd', '::1'),
(107, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:33:05', 'f', '::1'),
(108, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:33:05', 'f', '::1'),
(109, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:33:05', 'f', '::1'),
(110, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:33:05', 'f', '::1'),
(111, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:33:49', 'asdf', '::1'),
(112, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:33:49', 'asdf', '::1'),
(113, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:33:49', 'asdf', '::1'),
(114, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:33:49', 'asdf', '::1'),
(115, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:34:39', 'asd', '::1'),
(116, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:34:39', 'asd', '::1'),
(117, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:34:39', 'asd', '::1'),
(118, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:34:39', 'asd', '::1'),
(119, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:35:20', 'asdf', '::1'),
(120, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:35:20', 'asdf', '::1'),
(121, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:35:20', 'asdf', '::1'),
(122, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:35:20', 'asdf', '::1'),
(123, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:37:01', 'a', '::1'),
(124, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:37:01', 'a', '::1'),
(125, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:37:01', 'a', '::1'),
(126, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:37:01', 'a', '::1'),
(127, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:39:39', 'x', '::1'),
(128, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:39:39', 'x', '::1'),
(129, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:39:39', 'x', '::1'),
(130, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:39:39', 'x', '::1'),
(131, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:39:59', 's', '::1'),
(132, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:39:59', 's', '::1'),
(133, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:39:59', 's', '::1'),
(134, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:39:59', 's', '::1'),
(135, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:54:33', 'a', '::1'),
(136, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:54:33', 'a', '::1'),
(137, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:54:33', 'a', '::1'),
(138, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:54:33', 'a', '::1'),
(139, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:55:23', 'as', '::1'),
(140, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 11:55:23', 'as', '::1'),
(141, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:55:23', 'as', '::1'),
(142, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 11:55:23', 'as', '::1'),
(143, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:05:45', 'd', '::1'),
(144, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:05:45', 'd', '::1'),
(145, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:05:45', 'd', '::1'),
(146, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:05:45', 'd', '::1'),
(147, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:06:18', 'fasd', '::1'),
(148, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:06:18', 'fasd', '::1'),
(149, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:06:18', 'fasd', '::1'),
(150, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:06:18', 'fasd', '::1'),
(151, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/5597662884_c1e932f5c327a72d4c3625632a4bb3ba.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:07:28', 'asdf', '::1'),
(152, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/5597662884_c1e932f5c327a72d4c3625632a4bb3ba.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:07:28', 'asdf', '::1'),
(153, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:07:29', 'asdf', '::1'),
(154, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:07:29', 'asdf', '::1'),
(155, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:09:10', 'dasf', '::1'),
(156, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:09:10', 'dasf', '::1'),
(157, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:09:10', 'dasf', '::1'),
(158, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:09:10', 'dasf', '::1'),
(159, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/6304866332_19755abcf64ed1618ee384cd21146d87.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:10:42', 'asfd', '::1'),
(160, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/6304866332_19755abcf64ed1618ee384cd21146d87.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:10:42', 'asfd', '::1'),
(161, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:10:42', 'asfd', '::1'),
(162, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:10:42', 'asfd', '::1'),
(163, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:24:45', 'asfd', '::1'),
(164, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:24:45', 'asfd', '::1'),
(165, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:24:45', 'asfd', '::1'),
(166, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:24:45', 'asfd', '::1'),
(167, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:25:12', 'asdf', '::1'),
(168, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:25:12', 'asdf', '::1'),
(169, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:25:12', 'asdf', '::1'),
(170, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:25:12', 'asdf', '::1'),
(171, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:27:59', 'asdf', '::1'),
(172, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:27:59', 'asdf', '::1'),
(173, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:27:59', 'asdf', '::1'),
(174, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:27:59', 'asdf', '::1'),
(175, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/1141908219_297e1ac50b936436c4a423bc36d6d5e9.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:28:21', 'asdf', '::1'),
(176, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/1141908219_297e1ac50b936436c4a423bc36d6d5e9.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 13:28:21', 'asdf', '::1'),
(177, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:28:21', 'asdf', '::1'),
(178, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 13:28:21', 'asdf', '::1'),
(179, 'tiago', 'UPDATE `visitante` SET nome=''JoÃ£o da cerveja'', empresa=''Dejair Transportes'', foto=''images/fotos_visitante/5693151159_3d0a371e5862b00fc632c4796708bd3b.jpg''  WHERE `id_visitante`=''1'' ;', '2014-01-07 14:45:30', 'foto', '::1'),
(180, 'tiago', 'UPDATE `visitante` SET nome=''JoÃ£o da cerveja'', empresa=''Dejair Transportes'', foto=''images/fotos_visitante/5693151159_3d0a371e5862b00fc632c4796708bd3b.jpg''  WHERE `id_visitante`=''1'' ;', '2014-01-07 14:45:30', 'foto', '::1'),
(181, 'tiago', 'UPDATE `visita` SET objetivo_visita=''carregamento de cerveja'',funcionario_idfuncionario=''2'',carga=''1'',visitante_idvisitante=''1'' WHERE id_visita=''1'' ;', '2014-01-07 14:45:30', 'foto', '::1'),
(182, 'tiago', 'UPDATE `visita` SET objetivo_visita=''carregamento de cerveja'',funcionario_idfuncionario=''2'',carga=''1'',visitante_idvisitante=''1'' WHERE id_visita=''1'' ;', '2014-01-07 14:45:30', 'foto', '::1'),
(183, 'tiago', 'UPDATE `veiculo` SET modelo=''Mercedes-Benz 2213'',cor=''Azul'',placa=''HYZ1111'',vistoria_entrada=''Vazio'' WHERE visita_idvisita=1 ;', '2014-01-07 14:45:30', 'foto', '::1'),
(184, 'tiago', 'UPDATE `veiculo` SET modelo=''Mercedes-Benz 2213'',cor=''Azul'',placa=''HYZ1111'',vistoria_entrada=''Vazio'' WHERE visita_idvisita=1 ;', '2014-01-07 14:45:30', 'foto', '::1'),
(185, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/3848492738_100572cc072519cb194f6a1364b06813.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 14:48:33', 'foto', '::1'),
(186, 'tiago', 'UPDATE `visitante` SET nome=''Mario'', empresa=''M&L encanadores'', foto=''images/fotos_visitante/3848492738_100572cc072519cb194f6a1364b06813.jpg''  WHERE `id_visitante`=''21'' ;', '2014-01-07 14:48:33', 'foto', '::1'),
(187, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 14:48:33', 'foto', '::1'),
(188, 'tiago', 'UPDATE `visita` SET objetivo_visita=''conserto'',funcionario_idfuncionario=''2'',carga=''0'',visitante_idvisitante=''21'' WHERE id_visita=''21'' ;', '2014-01-07 14:48:33', 'foto', '::1'),
(189, 'tiago', 'UPDATE `visitante` SET nome=''Jorge'', empresa=''JetPack'', foto=''images/fotos_visitante/0185944362_81e4fb440d61263bbbde50db5ea0e98a.jpg''  WHERE `id_visitante`=''20'' ;', '2014-01-07 14:48:48', 'foto', '::1'),
(190, 'tiago', 'UPDATE `visitante` SET nome=''Jorge'', empresa=''JetPack'', foto=''images/fotos_visitante/0185944362_81e4fb440d61263bbbde50db5ea0e98a.jpg''  WHERE `id_visitante`=''20'' ;', '2014-01-07 14:48:48', 'foto', '::1'),
(191, 'tiago', 'UPDATE `visita` SET objetivo_visita=''envio de equipamentos para a filial'',funcionario_idfuncionario=''3'',carga=''0'',visitante_idvisitante=''20'' WHERE id_visita=''20'' ;', '2014-01-07 14:48:48', 'foto', '::1'),
(192, 'tiago', 'UPDATE `visita` SET objetivo_visita=''envio de equipamentos para a filial'',funcionario_idfuncionario=''3'',carga=''0'',visitante_idvisitante=''20'' WHERE id_visita=''20'' ;', '2014-01-07 14:48:48', 'foto', '::1'),
(193, 'tiago', 'UPDATE `veiculo` SET modelo=''TOWNER JR CABINE SIMPLES BAÃš'',cor=''branca'',placa=''DAS0945'',vistoria_entrada=''vaizo'' WHERE visita_idvisita=20 ;', '2014-01-07 14:48:48', 'foto', '::1'),
(194, 'tiago', 'UPDATE `veiculo` SET modelo=''TOWNER JR CABINE SIMPLES BAÃš'',cor=''branca'',placa=''DAS0945'',vistoria_entrada=''vaizo'' WHERE visita_idvisita=20 ;', '2014-01-07 14:48:48', 'foto', '::1'),
(195, 'tiago', 'UPDATE `visitante` SET nome=''JoÃ£o da cerveja'', empresa=''Dejair Transportes'', foto=''''  WHERE `id_visitante`=''1'' ;', '2014-01-07 16:37:41', 'acompanhante', '::1'),
(196, 'tiago', 'UPDATE `visitante` SET nome=''JoÃ£o da cerveja'', empresa=''Dejair Transportes'', foto=''''  WHERE `id_visitante`=''1'' ;', '2014-01-07 16:37:41', 'acompanhante', '::1'),
(197, 'tiago', 'UPDATE `visita` SET objetivo_visita=''carregamento de cerveja'',funcionario_idfuncionario=''4'',carga=''1'',visitante_idvisitante=''1'' WHERE id_visita=''1'' ;', '2014-01-07 16:37:41', 'acompanhante', '::1'),
(198, 'tiago', 'UPDATE `visita` SET objetivo_visita=''carregamento de cerveja'',funcionario_idfuncionario=''4'',carga=''1'',visitante_idvisitante=''1'' WHERE id_visita=''1'' ;', '2014-01-07 16:37:41', 'acompanhante', '::1'),
(199, 'tiago', 'UPDATE `veiculo` SET modelo=''Mercedes-Benz 2213'',cor=''Azul'',placa=''HYZ1111'',vistoria_entrada=''Vazio'' WHERE visita_idvisita=1 ;', '2014-01-07 16:37:41', 'acompanhante', '::1'),
(200, 'tiago', 'UPDATE `veiculo` SET modelo=''Mercedes-Benz 2213'',cor=''Azul'',placa=''HYZ1111'',vistoria_entrada=''Vazio'' WHERE visita_idvisita=1 ;', '2014-01-07 16:37:41', 'acompanhante', '::1'),
(201, 'tiago', 'UPDATE `visita` SET saida=''2014-01-08 14:20:48'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''c4ca4238a0b923820dcc509a6f75849b'' ;', '2014-01-08 14:20:49', 'acompanhante', '::1'),
(202, 'tiago', 'UPDATE `visita` SET saida=''2014-01-08 14:20:48'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''c4ca4238a0b923820dcc509a6f75849b'' ;', '2014-01-08 14:20:49', 'acompanhante', '::1'),
(203, 'tiago', 'UPDATE `veiculo` SET vistoria_saida=''20 pallets de cerveja 600ml'' WHERE MD5(`visita_idvisita`)=''c4ca4238a0b923820dcc509a6f75849b'' ;', '2014-01-08 14:20:49', 'acompanhante', '::1'),
(204, 'tiago', 'UPDATE `veiculo` SET vistoria_saida=''20 pallets de cerveja 600ml'' WHERE MD5(`visita_idvisita`)=''c4ca4238a0b923820dcc509a6f75849b'' ;', '2014-01-08 14:20:49', 'acompanhante', '::1'),
(205, 'tiago', 'UPDATE `visita` SET saida=''2014-01-14 20:04:41'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:04:42', '', '::1'),
(206, 'tiago', 'UPDATE `visita` SET saida=''2014-01-14 20:04:41'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:04:42', '', '::1'),
(207, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:04:42', '', '::1'),
(208, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:04:42', '', '::1'),
(209, 'tiago', 'UPDATE `visita` SET saida=''2014-01-14 20:56:46'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:56:47', '', '::1'),
(210, 'tiago', 'UPDATE `visita` SET saida=''2014-01-14 20:56:46'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:56:47', '', '::1'),
(211, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:56:47', '', '::1'),
(212, 'tiago', 'UPDATE `veiculo` SET vistoria_saida='''' WHERE MD5(`visita_idvisita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 20:56:47', '', '::1'),
(213, 'tiago', 'UPDATE `visita` SET saida=''2014-01-14 21:04:48'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 21:04:49', '', '::1'),
(214, 'tiago', 'UPDATE `visita` SET saida=''2014-01-14 21:04:48'', visita_em_andamento = 0 WHERE MD5(`id_visita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 21:04:49', '', '::1'),
(215, 'tiago', 'UPDATE `veiculo` SET vistoria_saida=''cervejas'' WHERE MD5(`visita_idvisita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 21:04:49', '', '::1'),
(216, 'tiago', 'UPDATE `veiculo` SET vistoria_saida=''cervejas'' WHERE MD5(`visita_idvisita`)=''98f13708210194c475687be6106a3b84'' ;', '2014-01-14 21:04:49', '', '::1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `senha_alterada` tinyint(1) NOT NULL,
  `usuario_ativo` tinyint(1) NOT NULL,
  `usuario_edicao` tinyint(1) NOT NULL,
  `usuario_admin` tinyint(1) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `login`, `senha`, `senha_alterada`, `usuario_ativo`, `usuario_edicao`, `usuario_admin`, `habilitado`) VALUES
(1, 'Yuri', 'yuri', '202cb962ac59075b964b07152d234b70', 0, 1, 1, 0, 1),
(3, 'Tiago FranÃ§a', 'tiago', '202cb962ac59075b964b07152d234b70', 0, 1, 1, 1, 1),
(4, 'asdf', 'asdf', '76d80224611fc919a5d54f0ff9fba446', 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE IF NOT EXISTS `veiculo` (
  `id_veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `visita_idvisita` int(11) NOT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `vistoria_entrada` varchar(200) DEFAULT NULL,
  `vistoria_saida` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_veiculo`),
  KEY `visita_idvisita` (`visita_idvisita`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`id_veiculo`, `visita_idvisita`, `modelo`, `cor`, `placa`, `vistoria_entrada`, `vistoria_saida`) VALUES
(1, 1, 'Mercedes-Benz 2213', 'Azul', 'HYZ1111', 'Vazio', '20 pallets de cerveja 600ml'),
(2, 15, 'corcel 73', 'Prata', 'XXX6666', 'armas', ''),
(3, 18, 'fusca', 'amarelo', 'olx1235', 'ferramentas', 'ferramentas'),
(4, 19, 'Mercedes-Benz 2213', 'azul', 'HEL6666', 'Garrafeiras com vazilhames', NULL),
(5, 20, 'TOWNER JR CABINE SIMPLES BAÃš', 'branca', 'DAS0945', 'vaizo', 'cervejas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `visita`
--

CREATE TABLE IF NOT EXISTS `visita` (
  `id_visita` int(11) NOT NULL AUTO_INCREMENT,
  `visitante_idvisitante` int(11) NOT NULL,
  `funcionario_idfuncionario` int(11) NOT NULL,
  `entrada` datetime DEFAULT NULL,
  `saida` datetime DEFAULT NULL,
  `objetivo_visita` varchar(200) DEFAULT NULL,
  `carga` tinyint(1) DEFAULT NULL,
  `visita_em_andamento` tinyint(1) DEFAULT NULL,
  `habilitado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `fk_visita_visitante_idx` (`visitante_idvisitante`),
  KEY `fk_visita_funcionario1_idx` (`funcionario_idfuncionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `visita`
--

INSERT INTO `visita` (`id_visita`, `visitante_idvisitante`, `funcionario_idfuncionario`, `entrada`, `saida`, `objetivo_visita`, `carga`, `visita_em_andamento`, `habilitado`) VALUES
(1, 1, 4, '2013-06-01 10:56:00', '2013-06-01 18:20:48', 'carregamento de cerveja', 1, 0, 1),
(5, 11, 4, '2013-11-07 10:18:00', '2013-11-07 16:41:00', 'venda de mercadoria', 1, 0, 1),
(6, 9, 8, '2013-10-23 11:13:00', '2013-10-23 19:23:00', 'venda de mercadoria', 0, 0, 1),
(8, 9, 4, '2013-10-07 11:11:00', '2013-10-07 19:14:00', 'transporte de cadeiras', 0, 0, 1),
(9, 11, 3, '2013-09-01 07:41:00', '2013-09-01 17:23:00', 'carregamento de cerveja', 1, 0, 1),
(10, 1, 3, '2013-10-24 08:43:00', '2013-10-24 14:19:00', 'carregamento de cerveja', 1, 0, 1),
(11, 1, 4, '2013-12-05 08:30:00', '2013-12-05 09:05:02', 'carregamento de cerveja', 0, 0, 1),
(12, 12, 1, '2013-11-22 10:46:45', NULL, 'inspeÃ§Ã£o', 0, 0, 0),
(13, 13, 1, '2013-11-22 11:10:09', '2013-11-22 22:52:33', 'Dominar a terra', 1, 0, 1),
(14, 14, 7, '2013-12-05 11:52:02', '2013-12-05 15:36:56', 'asdf', 0, 0, 1),
(15, 15, 6, '2013-12-05 11:53:40', '2013-12-05 18:13:14', 'entrevista', 0, 0, 1),
(16, 16, 1, '2013-12-05 11:55:05', '2013-12-05 15:10:26', 'carregar cerveja', 1, 0, 1),
(17, 17, 1, '2013-12-11 08:49:54', '2013-12-11 20:52:42', 'Cavocar', 0, 1, 1),
(18, 18, 2, '2014-01-07 09:20:21', '2014-01-07 16:40:06', 'conserto de encamento', 0, 0, 1),
(19, 19, 4, '2013-08-07 10:15:58', '2013-08-07 17:00:00', 'Carregamento de cerveja', 1, 0, 1),
(20, 20, 3, '2014-01-07 10:23:00', '2014-01-14 21:04:48', 'envio de equipamentos para a filial', 0, 1, 1),
(21, 21, 2, '2014-01-07 10:25:05', NULL, 'conserto', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitante`
--

CREATE TABLE IF NOT EXISTS `visitante` (
  `id_visitante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `foto` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_visitante`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `visitante`
--

INSERT INTO `visitante` (`id_visitante`, `nome`, `empresa`, `foto`) VALUES
(1, 'JoÃ£o da cerveja', 'Dejair Transportes', ''),
(3, 'Pedro da Silva', 'Quito', ''),
(9, 'Rodrigo', 'JetPack', ''),
(10, 'junior', 'Dejair Transportes', ''),
(11, 'wellington', 'Dejair Transportes', ''),
(12, 'Francisco', 'Quito', 'images/fotos_visitante/5955894988_1d7c70e1e9dd62c6467883f7eded4d82.jpg'),
(13, 'Sauron', 'Mordor', 'images/fotos_visitante/5080807696_7e53685effeb6bf54a978237413934d9.jpg'),
(14, 'zÃ©', 'Dejair Transportes', ''),
(15, 'maira', 'Mordor', ''),
(16, 'teste', 'JetPack', ''),
(17, 'Euphractus Sexcinctus', 'Terra', 'images/fotos_visitante/2566131630_e03b4b84bf19283724fa61c5330025c5.jpg'),
(18, 'Mario', 'M&L encanadores', ''),
(19, 'GalvÃ£o', 'Dejair Transportes', ''),
(20, 'Jorge', 'JetPack', 'images/fotos_visitante/0185944362_81e4fb440d61263bbbde50db5ea0e98a.jpg'),
(21, 'Mario', 'M&L encanadores', 'images/fotos_visitante/3848492738_100572cc072519cb194f6a1364b06813.jpg');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`visita_idvisita`) REFERENCES `visita` (`id_visita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `fk_visita_funcionario1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_visita_visitante` FOREIGN KEY (`visitante_idvisitante`) REFERENCES `visitante` (`id_visitante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
