-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/07/2025 às 14:25
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
-- Banco de dados: `pi_banco_de_dados`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentario`
--

CREATE TABLE `comentario` (
  `idcomentario` int(10) UNSIGNED NOT NULL,
  `idpostagem` int(10) UNSIGNED NOT NULL,
  `idcomentario_pai` int(10) UNSIGNED DEFAULT NULL,
  `texto` text NOT NULL,
  `data_emissao` datetime NOT NULL DEFAULT current_timestamp(),
  `visibilidade` enum('publico','privado','amigos') NOT NULL DEFAULT 'publico',
  `contador_resposta` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `url_amigavel` varchar(100) DEFAULT NULL,
  `tipo_comentario` enum('comum','resposta') NOT NULL DEFAULT 'comum',
  `idusuario` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `comentario`
--

INSERT INTO `comentario` (`idcomentario`, `idpostagem`, `idcomentario_pai`, `texto`, `data_emissao`, `visibilidade`, `contador_resposta`, `url_amigavel`, `tipo_comentario`, `idusuario`, `criado_em`, `atualizado_em`) VALUES
(1, 1, NULL, 'Obrigado pelo trabalho, admin! A plataforma está ótima!', '2025-05-30 09:12:35', 'publico', 0, NULL, 'comum', 2, '2025-05-30 09:12:35', '2025-05-30 09:12:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentario_conversa`
--

CREATE TABLE `comentario_conversa` (
  `idcomentario_conversa` int(10) UNSIGNED NOT NULL,
  `conteudo` text NOT NULL,
  `data_envio` datetime NOT NULL DEFAULT current_timestamp(),
  `idconversa` int(10) UNSIGNED NOT NULL,
  `idautor` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conversa`
--

CREATE TABLE `conversa` (
  `idconversa` int(10) UNSIGNED NOT NULL,
  `idremetente` int(10) UNSIGNED NOT NULL,
  `iddestinatario` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curtidas`
--

CREATE TABLE `curtidas` (
  `idcurtida` int(10) UNSIGNED NOT NULL,
  `tipo_recurso` enum('postagem','comentario') NOT NULL,
  `idcomentario` int(10) UNSIGNED DEFAULT NULL,
  `idpostagem` int(10) UNSIGNED DEFAULT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo`
--

CREATE TABLE `grupo` (
  `idgrupo` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idconversa` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_usuarios`
--

CREATE TABLE `grupo_usuarios` (
  `idgrupo_usuario` int(10) UNSIGNED NOT NULL,
  `idgrupo` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `interesse`
--

CREATE TABLE `interesse` (
  `idinteresse` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `interesse`
--

INSERT INTO `interesse` (`idinteresse`, `nome`, `criado_em`, `atualizado_em`) VALUES
(1, 'Programação', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(2, 'Banco de Dados', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(3, 'Redes de Computadores', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(4, 'Inteligência Artificial', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(5, 'Desenvolvimento Web', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(6, 'Segurança da Informação', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(7, 'Data Science', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(8, 'Mobile Development', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(9, 'UX/UI Design', '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(10, 'Cloud Computing', '2025-05-30 09:12:35', '2025-05-30 09:12:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `interesse_usuario`
--

CREATE TABLE `interesse_usuario` (
  `idinteresse_usuario` int(10) UNSIGNED NOT NULL,
  `idinteresse` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `interesse_usuario`
--

INSERT INTO `interesse_usuario` (`idinteresse_usuario`, `idinteresse`, `idusuario`, `criado_em`, `atualizado_em`) VALUES
(1, 1, 1, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(2, 2, 1, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(3, 3, 1, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(4, 4, 2, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(5, 5, 2, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(6, 6, 3, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(7, 7, 3, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(8, 8, 4, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(9, 9, 4, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(10, 10, 5, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(11, 1, 6, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(12, 3, 6, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(13, 5, 6, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(14, 2, 7, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(15, 4, 7, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(16, 6, 8, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(17, 8, 8, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(18, 10, 8, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(19, 7, 9, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(20, 9, 9, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(21, 1, 10, '2025-05-30 09:12:35', '2025-05-30 09:12:35'),
(22, 10, 10, '2025-05-30 09:12:35', '2025-05-30 09:12:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacao`
--

CREATE TABLE `notificacao` (
  `idnotificacao` int(10) UNSIGNED NOT NULL,
  `conteudo` varchar(255) NOT NULL,
  `idtipo_notificacao` int(10) UNSIGNED NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT current_timestamp(),
  `id_referencia` int(10) UNSIGNED DEFAULT NULL,
  `tipo_referencia` enum('postagem','comentario','curtida','mensagem','amizade','grupo') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacao_usuario`
--

CREATE TABLE `notificacao_usuario` (
  `idnotificacao_do_usuario` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `idnotificacao` int(10) UNSIGNED NOT NULL,
  `lida` tinyint(1) NOT NULL DEFAULT 0,
  `data_leitura` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `postagem`
--

CREATE TABLE `postagem` (
  `idpostagem` int(10) UNSIGNED NOT NULL,
  `idpostagem_pai` int(10) UNSIGNED DEFAULT NULL,
  `conteudo` text NOT NULL,
  `visibilidade` enum('publico','privado','amigos') NOT NULL DEFAULT 'publico',
  `tipo_postagem` enum('texto','imagem','video') NOT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `contador_comentario` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `url_amigavel` varchar(100) DEFAULT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `postagem`
--

INSERT INTO `postagem` (`idpostagem`, `idpostagem_pai`, `conteudo`, `visibilidade`, `tipo_postagem`, `media_url`, `contador_comentario`, `url_amigavel`, `idusuario`, `criado_em`, `atualizado_em`) VALUES
(1, NULL, 'Bem-vindos à nossa nova plataforma! Estamos felizes em tê-los conosco.', 'publico', 'texto', NULL, 0, NULL, 1, '2025-05-30 09:12:35', '2025-05-30 09:12:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_notificacao`
--

CREATE TABLE `tipo_notificacao` (
  `idtipo_notificacao` int(10) UNSIGNED NOT NULL,
  `nome_do_tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_notificacao`
--

INSERT INTO `tipo_notificacao` (`idtipo_notificacao`, `nome_do_tipo`) VALUES
(1, 'nova_curtida'),
(2, 'novo_comentario'),
(3, 'mensagem_recebida'),
(4, 'solicitacao_amizade'),
(5, 'atualizacao_grupo'),
(6, 'nova_postagem');

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
(10, '2023009', 19, NULL, 'aluno9@email.com', 'Ricardo Gomes', '$2y$10$ExemploDeHashPQR', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idcomentario`),
  ADD KEY `comentario_idusuario_foreign` (`idusuario`),
  ADD KEY `comentario_idcomentario_pai_foreign` (`idcomentario_pai`),
  ADD KEY `comentario_idpostagem_foreign` (`idpostagem`);

--
-- Índices de tabela `comentario_conversa`
--
ALTER TABLE `comentario_conversa`
  ADD PRIMARY KEY (`idcomentario_conversa`),
  ADD KEY `comentario_conversa_idconversa_foreign` (`idconversa`),
  ADD KEY `comentario_conversa_idautor_foreign` (`idautor`);

--
-- Índices de tabela `conversa`
--
ALTER TABLE `conversa`
  ADD PRIMARY KEY (`idconversa`),
  ADD KEY `conversa_idremetente_foreign` (`idremetente`);

--
-- Índices de tabela `curtidas`
--
ALTER TABLE `curtidas`
  ADD PRIMARY KEY (`idcurtida`),
  ADD KEY `curtidas_idusuario_foreign` (`idusuario`),
  ADD KEY `curtidas_idcomentario_foreign` (`idcomentario`),
  ADD KEY `curtidas_idpostagem_foreign` (`idpostagem`);

--
-- Índices de tabela `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idgrupo`),
  ADD UNIQUE KEY `grupo_idconversa_unique` (`idconversa`);

--
-- Índices de tabela `grupo_usuarios`
--
ALTER TABLE `grupo_usuarios`
  ADD PRIMARY KEY (`idgrupo_usuario`),
  ADD KEY `grupo_usuarios_idgrupo_foreign` (`idgrupo`),
  ADD KEY `grupo_usuarios_idusuario_foreign` (`idusuario`);

--
-- Índices de tabela `interesse`
--
ALTER TABLE `interesse`
  ADD PRIMARY KEY (`idinteresse`),
  ADD UNIQUE KEY `interesse_nome_unique` (`nome`);

--
-- Índices de tabela `interesse_usuario`
--
ALTER TABLE `interesse_usuario`
  ADD PRIMARY KEY (`idinteresse_usuario`),
  ADD KEY `interesse_usuario_idinteresse_foreign` (`idinteresse`),
  ADD KEY `interesse_usuario_idusuario_foreign` (`idusuario`);

--
-- Índices de tabela `notificacao`
--
ALTER TABLE `notificacao`
  ADD PRIMARY KEY (`idnotificacao`),
  ADD KEY `notificacao_idtipo_notificacao_foreign` (`idtipo_notificacao`);

--
-- Índices de tabela `notificacao_usuario`
--
ALTER TABLE `notificacao_usuario`
  ADD PRIMARY KEY (`idnotificacao_do_usuario`),
  ADD KEY `notificacao_usuario_idusuario_foreign` (`idusuario`),
  ADD KEY `notificacao_usuario_idnotificacao_foreign` (`idnotificacao`);

--
-- Índices de tabela `postagem`
--
ALTER TABLE `postagem`
  ADD PRIMARY KEY (`idpostagem`),
  ADD KEY `postagem_idpostagem_pai_foreign` (`idpostagem_pai`),
  ADD KEY `postagem_idusuario_foreign` (`idusuario`);

--
-- Índices de tabela `tipo_notificacao`
--
ALTER TABLE `tipo_notificacao`
  ADD PRIMARY KEY (`idtipo_notificacao`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `usuario_matricula_unique` (`matricula`),
  ADD UNIQUE KEY `usuario_email_unique` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idcomentario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `comentario_conversa`
--
ALTER TABLE `comentario_conversa`
  MODIFY `idcomentario_conversa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conversa`
--
ALTER TABLE `conversa`
  MODIFY `idconversa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curtidas`
--
ALTER TABLE `curtidas`
  MODIFY `idcurtida` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idgrupo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `grupo_usuarios`
--
ALTER TABLE `grupo_usuarios`
  MODIFY `idgrupo_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `interesse`
--
ALTER TABLE `interesse`
  MODIFY `idinteresse` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `interesse_usuario`
--
ALTER TABLE `interesse_usuario`
  MODIFY `idinteresse_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `notificacao`
--
ALTER TABLE `notificacao`
  MODIFY `idnotificacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacao_usuario`
--
ALTER TABLE `notificacao_usuario`
  MODIFY `idnotificacao_do_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `postagem`
--
ALTER TABLE `postagem`
  MODIFY `idpostagem` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tipo_notificacao`
--
ALTER TABLE `tipo_notificacao`
  MODIFY `idtipo_notificacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_idcomentario_pai_foreign` FOREIGN KEY (`idcomentario_pai`) REFERENCES `comentario` (`idcomentario`),
  ADD CONSTRAINT `comentario_idpostagem_foreign` FOREIGN KEY (`idpostagem`) REFERENCES `postagem` (`idpostagem`),
  ADD CONSTRAINT `comentario_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `comentario_conversa`
--
ALTER TABLE `comentario_conversa`
  ADD CONSTRAINT `comentario_conversa_idautor_foreign` FOREIGN KEY (`idautor`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `comentario_conversa_idconversa_foreign` FOREIGN KEY (`idconversa`) REFERENCES `conversa` (`idconversa`);

--
-- Restrições para tabelas `conversa`
--
ALTER TABLE `conversa`
  ADD CONSTRAINT `conversa_idremetente_foreign` FOREIGN KEY (`idremetente`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `curtidas`
--
ALTER TABLE `curtidas`
  ADD CONSTRAINT `curtidas_idcomentario_foreign` FOREIGN KEY (`idcomentario`) REFERENCES `comentario` (`idcomentario`),
  ADD CONSTRAINT `curtidas_idpostagem_foreign` FOREIGN KEY (`idpostagem`) REFERENCES `postagem` (`idpostagem`),
  ADD CONSTRAINT `curtidas_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_idconversa_foreign` FOREIGN KEY (`idconversa`) REFERENCES `conversa` (`idconversa`);

--
-- Restrições para tabelas `grupo_usuarios`
--
ALTER TABLE `grupo_usuarios`
  ADD CONSTRAINT `grupo_usuarios_idgrupo_foreign` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`),
  ADD CONSTRAINT `grupo_usuarios_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `interesse_usuario`
--
ALTER TABLE `interesse_usuario`
  ADD CONSTRAINT `interesse_usuario_idinteresse_foreign` FOREIGN KEY (`idinteresse`) REFERENCES `interesse` (`idinteresse`),
  ADD CONSTRAINT `interesse_usuario_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `notificacao`
--
ALTER TABLE `notificacao`
  ADD CONSTRAINT `notificacao_idtipo_notificacao_foreign` FOREIGN KEY (`idtipo_notificacao`) REFERENCES `tipo_notificacao` (`idtipo_notificacao`);

--
-- Restrições para tabelas `notificacao_usuario`
--
ALTER TABLE `notificacao_usuario`
  ADD CONSTRAINT `notificacao_usuario_idnotificacao_foreign` FOREIGN KEY (`idnotificacao`) REFERENCES `notificacao` (`idnotificacao`),
  ADD CONSTRAINT `notificacao_usuario_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `postagem`
--
ALTER TABLE `postagem`
  ADD CONSTRAINT `postagem_idpostagem_pai_foreign` FOREIGN KEY (`idpostagem_pai`) REFERENCES `postagem` (`idpostagem`),
  ADD CONSTRAINT `postagem_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
