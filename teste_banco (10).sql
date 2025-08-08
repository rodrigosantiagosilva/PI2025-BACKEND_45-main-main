-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/08/2025 às 21:57
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teste_banco`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `data_evento` date NOT NULL,
  `hora_evento` time NOT NULL,
  `local_evento` varchar(255) DEFAULT NULL,
  `tipo` enum('palestra','workshop','reuniao','outro') DEFAULT 'palestra',
  `criador_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `descricao`, `data_evento`, `hora_evento`, `local_evento`, `tipo`, `criador_id`) VALUES
(1, 'Workshop de Docker', 'Aprenda a containerizar aplicações com Docker', '2023-05-15', '14:00:00', 'Laboratório 5', 'workshop', 2),
(2, 'Palestra: Carreira em TI', 'Mercado de trabalho e oportunidades na área de tecnologia', '2023-05-20', '19:30:00', 'Auditório Principal', 'palestra', 3),
(3, 'Hackathon de Inovação', 'Maratona de desenvolvimento de soluções tecnológicas', '2023-06-10', '09:00:00', 'Biblioteca Central', 'outro', 4),
(4, 'Oficina de Git e GitHub', 'Controle de versão e colaboração em projetos', '2023-06-15', '16:00:00', 'Sala 203', 'workshop', 5),
(5, 'Discussão: Ética em IA', 'Debate sobre implicações éticas do uso de inteligência artificial', '2023-07-05', '18:00:00', 'Sala Virtual', 'palestra', 11);

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento_participantes`
--

CREATE TABLE `evento_participantes` (
  `evento_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_confirmacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `criador_id` int(10) UNSIGNED NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `grupos`
--

INSERT INTO `grupos` (`id`, `nome`, `descricao`, `criador_id`, `data_criacao`) VALUES
(1, 'Estudantes de Banco de Dados', 'Grupo para discussão de tópicos avançados em bancos de dados relacionais e NoSQL', 2, '2025-08-07 13:41:53'),
(2, 'Grupo de Estudos de IA', 'Comunidade para aprender e aplicar conceitos de Inteligência Artificial', 3, '2025-08-07 13:41:53'),
(3, 'Desenvolvedores Front-end', 'Compartilhamento de recursos e técnicas modernas de desenvolvimento web', 4, '2025-08-07 13:41:53'),
(4, 'Pesquisadores de Machine Learning', 'Discussão de artigos científicos e projetos práticos em ML', 5, '2025-08-07 13:41:53'),
(5, 'Tecnologia na Educação', 'Como aplicar inovações tecnológicas para melhorar o ensino', 11, '2025-08-07 13:41:53'),
(6, 'Mario', 'Grupo do mario', 11, '2025-08-07 14:23:06'),
(7, 'skibidi sigma123', 'sigma123', 11, '2025-08-07 14:23:27'),
(8, 'Sarturneiros', 'Vaca sartuaniada ', 11, '2025-08-07 14:24:18'),
(9, 'Admin1', '123', 11, '2025-08-07 14:36:42'),
(10, 'Admin1', '123', 11, '2025-08-07 14:37:17'),
(11, 'Admin1', '123', 11, '2025-08-07 14:38:48'),
(12, 'Grupo1', 'seguidor_id', 11, '2025-08-07 16:12:41'),
(13, 'Grupo2', 'Grupo2', 11, '2025-08-07 16:13:35'),
(14, 'Grupo3', 'Grupo3', 11, '2025-08-07 16:13:42'),
(15, 'Grupo4', 'Grupo4', 11, '2025-08-07 16:13:50'),
(16, 'Grupo5', 'Grupo5', 11, '2025-08-07 16:14:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_membros`
--

CREATE TABLE `grupo_membros` (
  `grupo_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_ingresso` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `grupo_membros`
--

INSERT INTO `grupo_membros` (`grupo_id`, `usuario_id`, `data_ingresso`) VALUES
(1, 2, '2025-08-07 13:42:04'),
(1, 3, '2025-08-07 13:42:04'),
(1, 4, '2025-08-07 13:42:04'),
(1, 5, '2025-08-07 13:42:04'),
(1, 11, '2025-08-07 14:21:07'),
(2, 3, '2025-08-07 13:42:04'),
(2, 4, '2025-08-07 13:42:04'),
(2, 5, '2025-08-07 13:42:04'),
(2, 6, '2025-08-07 13:42:04'),
(2, 11, '2025-08-07 14:30:48'),
(3, 4, '2025-08-07 13:42:04'),
(3, 5, '2025-08-07 13:42:04'),
(3, 6, '2025-08-07 13:42:04'),
(3, 7, '2025-08-07 13:42:04'),
(3, 11, '2025-08-07 14:22:24'),
(4, 5, '2025-08-07 13:42:04'),
(4, 6, '2025-08-07 13:42:04'),
(4, 7, '2025-08-07 13:42:04'),
(4, 8, '2025-08-07 13:42:04'),
(4, 11, '2025-08-07 14:24:39'),
(5, 2, '2025-08-07 13:42:04'),
(5, 3, '2025-08-07 13:42:04'),
(5, 4, '2025-08-07 13:42:04'),
(5, 11, '2025-08-07 13:42:04'),
(6, 11, '2025-08-07 14:23:06'),
(7, 11, '2025-08-07 14:23:27'),
(8, 11, '2025-08-07 14:24:18'),
(9, 11, '2025-08-07 14:36:42'),
(10, 11, '2025-08-07 14:37:17'),
(11, 11, '2025-08-07 14:38:48'),
(12, 11, '2025-08-07 16:12:41'),
(13, 11, '2025-08-07 16:13:35'),
(14, 11, '2025-08-07 16:13:42'),
(15, 11, '2025-08-07 16:13:50'),
(16, 11, '2025-08-07 16:14:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `materiais`
--

CREATE TABLE `materiais` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `tipo` enum('documento','video','link','outro') DEFAULT 'documento',
  `url` varchar(255) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_publicacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `materiais`
--

INSERT INTO `materiais` (`id`, `titulo`, `descricao`, `tipo`, `url`, `usuario_id`, `data_publicacao`) VALUES
(1, 'Guia de Normalização de Dados', 'Material completo sobre formas normais e boas práticas em modelagem de dados', 'documento', 'https://drive.com/normalizacao.pdf', 2, '2025-08-07 13:42:13'),
(2, 'Introdução ao React.js', 'Tutorial básico para iniciantes em desenvolvimento front-end', 'documento', 'https://drive.com/react-intro.pdf', 3, '2025-08-07 13:42:13'),
(3, 'Vídeo: Criando APIs RESTful', 'Gravação da aula sobre desenvolvimento de APIs com Node.js', 'video', 'https://youtube.com/api-rest', 4, '2025-08-07 13:42:13'),
(4, 'Coleção de Exercícios SQL', 'Problemas práticos para aprimorar habilidades em consultas SQL', 'documento', 'https://drive.com/exercicios-sql.pdf', 5, '2025-08-07 13:42:13'),
(5, 'Fundamentos de Machine Learning', 'Apresentação sobre conceitos básicos de aprendizado de máquina', 'documento', 'https://drive.com/ml-fundamentos.pdf', 11, '2025-08-07 13:42:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `material_avaliacoes`
--

CREATE TABLE `material_avaliacoes` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `avaliacao` tinyint(4) DEFAULT NULL CHECK (`avaliacao` between 1 and 5),
  `data_avaliacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` enum('academic','materials','calendar') NOT NULL,
  `priority` enum('low','medium','high') NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `academicType` enum('homework','exam','deadline','event') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `title`, `message`, `date`, `time`, `type`, `priority`, `read`, `academicType`) VALUES
(3, 'Material Disponível', 'O professor de Algoritmos disponibilizou o material para a próxima aula.', '2025-04-11', '16:20:00', 'materials', 'medium', 1, 'homework');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(10) UNSIGNED NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `idade` tinyint(3) UNSIGNED NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('ativo','inativo') NOT NULL DEFAULT 'ativo',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `matricula`, `idade`, `foto`, `email`, `nome`, `senha`, `data_criacao`, `status`, `criado_em`, `atualizado_em`, `admin`) VALUES
(1, 'ADM001', 30, NULL, 'admin@email.com', 'Administrador do Sistema', '$2y$10$ExemploDeHashAdmin', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 1),
(2, '2023001', 20, NULL, 'aluno1@email.com', 'João Silva', '$2y$10$ExemploDeHash123', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(3, '2023002', 21, NULL, 'aluno2@email.com', 'Maria Oliveira', '$2y$10$ExemploDeHash456', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(4, '2023003', 22, NULL, 'aluno3@email.com', 'Carlos Pereira', '$2y$10$ExemploDeHash789', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(5, '2023004', 19, NULL, 'aluno4@email.com', 'Ana Santos', '$2y$10$ExemploDeHashABC', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(6, '2023005', 23, NULL, 'aluno5@email.com', 'Pedro Costa', '$2y$10$ExemploDeHashDEF', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(7, '2023006', 20, NULL, 'aluno6@email.com', 'Juliana Almeida', '$2y$10$ExemploDeHashGHI', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(8, '2023007', 21, NULL, 'aluno7@email.com', 'Fernando Lima', '$2y$10$ExemploDeHashJKL', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(9, '2023008', 22, NULL, 'aluno8@email.com', 'Mariana Ribeiro', '$2y$10$ExemploDeHashMNO', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(10, '2023009', 19, NULL, 'aluno9@email.com', 'Ricardo Gomes', '$2y$10$ExemploDeHashPQR', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(11, 'U20256959', 0, NULL, 'mario.junior2@alunos.sc.senac.br', 'Mario Gonçalves', '$2y$10$iq7qXkniq8n0aE9m1xeEBeZHr/O.73LmsyHODFSKCv3HfMHvlz4Hm', '2025-07-04 09:12:24', 'ativo', '2025-07-04 09:12:24', '2025-08-07 08:34:35', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_aparencia`
--

CREATE TABLE `usuario_aparencia` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `tema` enum('light','dark') DEFAULT 'dark',
  `tamanho_fonte` enum('small','medium','large') DEFAULT 'medium',
  `idioma` enum('pt-BR','en-US','es') DEFAULT 'pt-BR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_aparencia`
--

INSERT INTO `usuario_aparencia` (`id`, `usuario_id`, `tema`, `tamanho_fonte`, `idioma`) VALUES
(1, 2, 'dark', 'medium', 'pt-BR'),
(2, 3, 'light', 'small', 'en-US'),
(3, 4, 'dark', 'medium', 'pt-BR'),
(4, 5, 'dark', 'medium', 'pt-BR'),
(5, 6, 'dark', 'medium', 'pt-BR'),
(6, 7, 'dark', 'medium', 'pt-BR'),
(7, 8, 'dark', 'medium', 'pt-BR'),
(8, 9, 'dark', 'medium', 'pt-BR'),
(9, 10, 'dark', 'medium', 'pt-BR'),
(10, 1, 'dark', 'medium', 'pt-BR'),
(11, 11, 'light', 'large', 'pt-BR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_config`
--

CREATE TABLE `usuario_config` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `bio` text DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_config`
--

INSERT INTO `usuario_config` (`id`, `usuario_id`, `bio`, `telefone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador do sistema com experiência em segurança de dados', '+55 11 91234-5678', '2025-07-09 17:49:50', '2025-07-09 17:49:50'),
(2, 2, 'Professor de Banco de Dados com 10 anos de experiência', '+55 11 98765-4321', '2025-07-09 17:49:50', '2025-08-07 16:43:29'),
(3, 11, 'homem masculino', '47988962224', '2025-07-14 17:01:40', '2025-08-07 19:56:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_notificacoes`
--

CREATE TABLE `usuario_notificacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `mensagens` tinyint(1) DEFAULT 1,
  `matches` tinyint(1) DEFAULT 1,
  `grupos` tinyint(1) DEFAULT 1,
  `mencoes` tinyint(1) DEFAULT 1,
  `email_notificacoes` tinyint(1) DEFAULT 0,
  `push_notificacoes` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_notificacoes`
--

INSERT INTO `usuario_notificacoes` (`id`, `usuario_id`, `mensagens`, `matches`, `grupos`, `mencoes`, `email_notificacoes`, `push_notificacoes`) VALUES
(1, 2, 1, 1, 1, 1, 0, 1),
(2, 3, 1, 1, 1, 1, 0, 1),
(3, 4, 1, 1, 1, 1, 0, 1),
(4, 5, 1, 1, 1, 1, 0, 1),
(5, 6, 1, 1, 1, 1, 0, 1),
(6, 7, 1, 1, 1, 1, 0, 1),
(7, 8, 1, 1, 1, 1, 0, 1),
(8, 9, 1, 1, 1, 1, 0, 1),
(9, 10, 1, 1, 1, 1, 0, 1),
(10, 1, 1, 1, 1, 1, 0, 1),
(11, 11, 1, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_privacidade`
--

CREATE TABLE `usuario_privacidade` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `perfil_visibilidade` enum('all','connections','nobody') DEFAULT 'all',
  `status_online` tinyint(1) DEFAULT 1,
  `confirmacoes_leitura` tinyint(1) DEFAULT 1,
  `coleta_dados` tinyint(1) DEFAULT 1,
  `expiracao_chat` enum('12h','24h','48h','never') DEFAULT '24h'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_privacidade`
--

INSERT INTO `usuario_privacidade` (`id`, `usuario_id`, `perfil_visibilidade`, `status_online`, `confirmacoes_leitura`, `coleta_dados`, `expiracao_chat`) VALUES
(1, 2, 'all', 1, 1, 1, '24h'),
(2, 3, 'all', 1, 1, 1, '24h'),
(3, 4, 'all', 1, 1, 1, '24h'),
(4, 5, 'all', 1, 1, 1, '24h'),
(5, 6, 'all', 1, 1, 1, '24h'),
(6, 7, 'all', 1, 1, 1, '24h'),
(7, 8, 'all', 1, 1, 1, '24h'),
(8, 9, 'all', 1, 1, 1, '24h'),
(9, 10, 'all', 1, 1, 1, '24h'),
(10, 1, 'all', 1, 1, 1, '24h'),
(11, 11, 'connections', 0, 0, 0, '24h');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_seguidores`
--

CREATE TABLE `usuario_seguidores` (
  `seguidor_id` int(10) UNSIGNED NOT NULL,
  `seguido_id` int(10) UNSIGNED NOT NULL,
  `data_seguimento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_seguidores`
--

INSERT INTO `usuario_seguidores` (`seguidor_id`, `seguido_id`, `data_seguimento`) VALUES
(10, 11, '2025-08-07 14:04:27'),
(11, 1, '2025-08-07 14:04:21'),
(11, 2, '2025-08-07 14:06:10'),
(11, 3, '2025-08-07 16:31:06'),
(11, 4, '2025-08-07 16:10:15'),
(11, 5, '2025-08-07 16:11:41'),
(11, 6, '2025-08-07 16:11:26'),
(11, 7, '2025-08-07 16:11:07');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criador_id` (`criador_id`);

--
-- Índices de tabela `evento_participantes`
--
ALTER TABLE `evento_participantes`
  ADD PRIMARY KEY (`evento_id`,`usuario_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criador_id` (`criador_id`);

--
-- Índices de tabela `grupo_membros`
--
ALTER TABLE `grupo_membros`
  ADD PRIMARY KEY (`grupo_id`,`usuario_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `material_avaliacoes`
--
ALTER TABLE `material_avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `usuario_matricula_unique` (`matricula`),
  ADD UNIQUE KEY `usuario_email_unique` (`email`);

--
-- Índices de tabela `usuario_aparencia`
--
ALTER TABLE `usuario_aparencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_config`
--
ALTER TABLE `usuario_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_notificacoes`
--
ALTER TABLE `usuario_notificacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_privacidade`
--
ALTER TABLE `usuario_privacidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_seguidores`
--
ALTER TABLE `usuario_seguidores`
  ADD PRIMARY KEY (`seguidor_id`,`seguido_id`),
  ADD KEY `seguido_id` (`seguido_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `materiais`
--
ALTER TABLE `materiais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `material_avaliacoes`
--
ALTER TABLE `material_avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuario_aparencia`
--
ALTER TABLE `usuario_aparencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuario_config`
--
ALTER TABLE `usuario_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario_notificacoes`
--
ALTER TABLE `usuario_notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuario_privacidade`
--
ALTER TABLE `usuario_privacidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `evento_participantes`
--
ALTER TABLE `evento_participantes`
  ADD CONSTRAINT `evento_participantes_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evento_participantes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `grupo_membros`
--
ALTER TABLE `grupo_membros`
  ADD CONSTRAINT `grupo_membros_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grupo_membros_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `materiais`
--
ALTER TABLE `materiais`
  ADD CONSTRAINT `materiais_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `material_avaliacoes`
--
ALTER TABLE `material_avaliacoes`
  ADD CONSTRAINT `material_avaliacoes_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `materiais` (`id`),
  ADD CONSTRAINT `material_avaliacoes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `usuario_aparencia`
--
ALTER TABLE `usuario_aparencia`
  ADD CONSTRAINT `usuario_aparencia_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_config`
--
ALTER TABLE `usuario_config`
  ADD CONSTRAINT `usuario_config_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_notificacoes`
--
ALTER TABLE `usuario_notificacoes`
  ADD CONSTRAINT `usuario_notificacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_privacidade`
--
ALTER TABLE `usuario_privacidade`
  ADD CONSTRAINT `usuario_privacidade_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_seguidores`
--
ALTER TABLE `usuario_seguidores`
  ADD CONSTRAINT `usuario_seguidores_ibfk_1` FOREIGN KEY (`seguidor_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_seguidores_ibfk_2` FOREIGN KEY (`seguido_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
