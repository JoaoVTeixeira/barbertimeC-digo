-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Jan-2023 às 04:29
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `asdasd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo_cliente` int(3) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `telefone` int(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `senha_cliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cortes`
--

CREATE TABLE `cortes` (
  `codigo_corte` int(3) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `duracao` varchar(4) NOT NULL,
  `preco` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codigo_funcionario` int(3) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `funcao` varchar(150) NOT NULL,
  `telefone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `codigo_cliente` int(3) NOT NULL,
  `codigo_funcionario` int(3) NOT NULL,
  `codigo_reserva` int(3) NOT NULL,
  `codigo_corte` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo_cliente`);

--
-- Índices para tabela `cortes`
--
ALTER TABLE `cortes`
  ADD PRIMARY KEY (`codigo_corte`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo_funcionario`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`codigo_reserva`),
  ADD KEY `codigo_funcionario` (`codigo_funcionario`),
  ADD KEY `codigo_cliente` (`codigo_cliente`),
  ADD KEY `codigo_corte` (`codigo_corte`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo_cliente` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cortes`
--
ALTER TABLE `cortes`
  MODIFY `codigo_corte` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codigo_funcionario` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `codigo_reserva` int(3) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`codigo_funcionario`) REFERENCES `funcionario` (`codigo_funcionario`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`codigo_corte`) REFERENCES `cortes` (`codigo_corte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
