-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Maio-2024 às 16:03
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `faculdade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `id_aluno` int(7) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(255) NOT NULL,
  `mat` int(10) NOT NULL,
  `FK_IDCURSO` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `FK_IDDISC` int(7) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`id_aluno`, `nome`, `mat`, `FK_IDCURSO`, `FK_IDDISC`) VALUES
(0000001, 'João', 123456, 0000001, 0000001),
(0000002, 'Maria', 234567, 0000002, 0000002),
(0000003, 'José', 345678, 0000003, 0000003),
(0000004, 'Ana', 456789, 0000004, 0000004),
(0000005, 'Pedro', 567890, 0000005, 0000005);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(7) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(255) NOT NULL,
  `grau` varchar(100) NOT NULL,
  `FK_IDDISC` int(7) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nome`, `grau`, `FK_IDDISC`) VALUES
(0000001, 'Engenharia Civil', 'Bacharelado', 0000001),
(0000002, 'Letras', 'Licenciatura', 0000002),
(0000003, 'História', 'Licenciatura', 0000003),
(0000004, 'Geografia', 'Licenciatura', 0000004),
(0000005, 'Ciências Biológicas', 'Bacharelado', 0000005),
(0000006, 'Letras', 'Bacharelado', 0000002);

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id_discip` int(7) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(255) NOT NULL,
  `ch` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id_discip`, `nome`, `ch`) VALUES
(0000001, 'Matemática', 60),
(0000002, 'Português', 60),
(0000003, 'História', 40),
(0000004, 'Geografia', 40),
(0000005, 'Ciências', 60),
(0000006, 'Inglês', 40);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

CREATE TABLE `professores` (
  `id_prof` int(7) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(255) NOT NULL,
  `mat` int(9) NOT NULL,
  `FK_IDCURSO` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `FK_IDDISC` int(7) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professores`
--

INSERT INTO `professores` (`id_prof`, `nome`, `mat`, `FK_IDCURSO`, `FK_IDDISC`) VALUES
(0000001, 'Carlos', 987654, 0000001, 0000001),
(0000002, 'Sandra', 876543, 0000002, 0000002),
(0000003, 'Paulo', 765432, 0000003, 0000003),
(0000004, 'Mariana', 654321, 0000004, 0000004),
(0000005, 'Fernando', 543210, 0000005, 0000005);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id_aluno`),
  ADD KEY `FK_IDCURSO` (`FK_IDCURSO`),
  ADD KEY `FK_IDDISC` (`FK_IDDISC`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `FK_cursos_disciplinas` (`FK_IDDISC`);

--
-- Índices para tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id_discip`);

--
-- Índices para tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id_prof`),
  ADD KEY `FK_IDCURSO` (`FK_IDCURSO`),
  ADD KEY `FK_IDDISC` (`FK_IDDISC`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id_aluno` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id_discip` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id_prof` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`FK_IDCURSO`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `alunos_ibfk_2` FOREIGN KEY (`FK_IDDISC`) REFERENCES `disciplinas` (`id_discip`);

--
-- Limitadores para a tabela `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `FK_cursos_disciplinas` FOREIGN KEY (`FK_IDDISC`) REFERENCES `disciplinas` (`id_discip`),
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`FK_IDDISC`) REFERENCES `disciplinas` (`id_discip`);

--
-- Limitadores para a tabela `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `professores_ibfk_1` FOREIGN KEY (`FK_IDCURSO`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `professores_ibfk_2` FOREIGN KEY (`FK_IDDISC`) REFERENCES `disciplinas` (`id_discip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
