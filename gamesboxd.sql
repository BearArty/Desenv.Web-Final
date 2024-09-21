-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/09/2024 às 02:59
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gamesboxd`
--
CREATE DATABASE IF NOT EXISTS `gamesboxd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gamesboxd`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogando`
--

CREATE TABLE `jogando` (
  `id_jogando` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_jogo` int(11) NOT NULL,
  `status_jogo` varchar(45) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `jogando`
--

INSERT INTO `jogando` (`id_jogando`, `id_usuario`, `id_jogo`, `status_jogo`, `createdAt`, `updatedAt`) VALUES
(1, 6, 1, 'Concluído', '2024-09-20 20:20:41', '2024-09-20 23:08:40'),
(5, 6, 3, 'Em andamento', '2024-09-20 22:04:24', '2024-09-20 22:08:13'),
(6, 7, 7, 'Em andamento', '2024-09-21 00:31:48', '2024-09-21 00:31:48'),
(7, 7, 3, 'Concluído', '2024-09-21 00:31:54', '2024-09-21 00:31:54'),
(8, 7, 5, 'Não iniciado', '2024-09-21 00:31:59', '2024-09-21 00:31:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo`
--

CREATE TABLE `jogo` (
  `id_jogo` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `genero_principal` varchar(60) NOT NULL,
  `desenvolvedor` varchar(60) NOT NULL,
  `estudio` varchar(60) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `data_lanc` date NOT NULL,
  `imagem` varchar(60) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `jogo`
--

INSERT INTO `jogo` (`id_jogo`, `nome`, `genero_principal`, `desenvolvedor`, `estudio`, `descricao`, `data_lanc`, `imagem`, `createdAt`, `updatedAt`) VALUES
(1, 'Alan Wake 2', 'Survival Horror', 'Remedy', 'Epic Games', 'Alan Wake 2 é um jogo de terror psicológico onde o escritor Alan Wake e a agente do FBI Saga Anderson enfrentam uma escuridão sobrenatural em Bright Falls. Alternando entre suas histórias, os jogadores exploram mistérios sombrios e tentam reescrever a realidade para escapar de pesadelos.', '2023-10-23', '1726770626712-755245372.jpg', '2024-09-19 18:30:26', '2024-09-20 23:01:30'),
(3, 'Still Wakes The Deep', 'Terror', 'The Chinese Room', 'Secret Mode', 'Um jogo de terror psicológico ambientado em uma plataforma de petróleo no Mar do Norte. Os jogadores assumem o papel de um trabalhador que deve desvendar mistérios sobrenaturais enquanto enfrenta horrores ocultos. Com uma narrativa envolvente e atmosfera tensa, o jogo explora temas de medo e sobrevi', '2024-06-16', '1726878034604-734127846.jpg', '2024-09-20 19:35:07', '2024-09-21 00:20:34'),
(4, 'Senua’s Saga: Hellblade II', 'Ação', 'Ninja Theory', 'Xbox Game Studios', 'Senua\'s Saga: Hellblade II é a aguardada sequência do aclamado Hellblade: Senua\'s Sacrifice. O jogo acompanha a guerreira celta Senua em uma jornada sombria e introspectiva, explorando a luta contra seus próprios demônios em um mundo de mitos e caos, com gráficos realistas e uma narrativa imersiva.', '2024-05-21', '1726876961930-173759273.jpg', '2024-09-21 00:02:41', '2024-09-21 00:02:41'),
(5, 'A Plague Tale: Requiem', 'Ação', 'Asobo Studio', 'Asobo Studio', 'A Plague Tale: Requiem é a sequência de A Plague Tale: Innocence, acompanhando Amicia e Hugo em uma jornada brutal por um mundo medieval devastado pela peste. Combinando narrativa intensa, ação furtiva e enigmas, o jogo destaca o vínculo dos irmãos em meio a um cenário sombrio e perigoso.', '2022-10-17', '1726877152341-727056088.jpg', '2024-09-21 00:05:52', '2024-09-21 00:05:52'),
(6, 'Detroit: Become Human', 'Aventura', 'Quantic Dream', ' Quantic Dream, Sony Interactive Entertainment', 'Detroit: Become Human é um jogo narrativo de ficção científica que se passa em um futuro onde androides convivem com humanos. As escolhas dos jogadores moldam a história de três protagonistas: Kara, Connor e Markus, cujas decisões determinam o destino da humanidade e dos androides em uma luta por li', '2018-05-25', '1726877301129-426612733.jpg', '2024-09-21 00:08:21', '2024-09-21 00:08:21'),
(7, 'Life is Strange', 'Interativo', 'Dontnod Entertainment', 'Dontnod Entertainment', 'Life is Strange é um jogo narrativo focado em escolhas e consequências. A história acompanha Max Caulfield, uma jovem com a habilidade de voltar no tempo, enquanto ela explora mistérios e relacionamentos na cidade de Arcadia Bay. O jogo destaca temas de amizade, amadurecimento e o impacto das decisõ', '2015-01-29', '1726877464652-308555079.jpg', '2024-09-21 00:11:04', '2024-09-21 00:11:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `genero_fav` varchar(45) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `acesso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `nickname`, `email`, `senha`, `genero_fav`, `createdAt`, `updatedAt`, `acesso`) VALUES
(2, 'Ana Alice', 'anaalice', 'analice@gmail.com', '$2a$10$jAsrzX7SmgnyN7vNDwShPOKcAq8Iu375TmXx.nMyXgOLSyU3KmlCy', 'acao', '2024-09-19 18:32:14', '2024-09-20 23:35:19', 'user'),
(3, 'Luis Felipe', 'siuL', 'siul@gmail.com', '$2a$10$fZWDO8xGEME5.G7AtmXTHe.xNaBNZ.U.3NrMJyYLsUDkI42gQBywG', 'rpg', '2024-09-19 18:32:49', '2024-09-19 18:40:09', 'user'),
(4, 'Ezequiel da Silva', 'Quielzs', 'ezdasilva@gmail.com', '$2a$10$dSPBWanpGBgh4i4gJ2gKeOYPBHd7usB9INzmu5hmKoO3nppPosrMO', 'multiplayer', '2024-09-19 18:39:34', '2024-09-21 00:51:09', 'admin'),
(5, 'admin', 'admin', 'admin@yahoo.com', '$2a$10$Rmwhd04EkrI1Z5LMPLgxm.8BeEQD/VBmjKtCNumqDxEGXfA.QZ63O', 'terror', '2024-09-20 16:44:01', '2024-09-20 16:51:16', 'admin'),
(6, 'Renato Junior', 'Renatinho2000', 'renatoj@yahoo.com', '$2a$10$zAxA62aAIUbtRHsUHng9Ye18.Ifk51PlpWxccpvYGynv6/DCOz9rm', 'casual', '2024-09-20 16:49:50', '2024-09-20 22:16:27', 'user'),
(7, 'Thiago', 'thigas', 'thiago@gmail.com', '$2a$10$BalYCgf7iuh0jMHAdx5XZ.Oy1ZiU/TZ1T6C.m8J3jkVcSKh2i8kQ.', 'simulacao', '2024-09-21 00:22:42', '2024-09-21 00:22:42', 'user');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `jogando`
--
ALTER TABLE `jogando`
  ADD PRIMARY KEY (`id_jogando`,`id_usuario`,`id_jogo`),
  ADD UNIQUE KEY `id_leitura_UNIQUE` (`id_jogando`),
  ADD KEY `fk_usuario_has_livro_livro1_idx` (`id_jogo`),
  ADD KEY `fk_usuario_has_livro_usuario_idx` (`id_usuario`);

--
-- Índices de tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`id_jogo`),
  ADD UNIQUE KEY `id_livro_UNIQUE` (`id_jogo`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `idusuario_UNIQUE` (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `jogando`
--
ALTER TABLE `jogando`
  MODIFY `id_jogando` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `jogo`
--
ALTER TABLE `jogo`
  MODIFY `id_jogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `jogando`
--
ALTER TABLE `jogando`
  ADD CONSTRAINT `fk_usuario_has_livro_livro1` FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_livro_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
