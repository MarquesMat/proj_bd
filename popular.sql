-- Inserir dados na tabela 'localizacao'
INSERT INTO public.localizacao (id, nome, id_localizacao) VALUES
  (1, 'Sala 101', 5),
  (2, 'Sala 102', 5),
  (3, 'Sala 201', 5),
  (4, 'Sala 202', 5),
  (5, 'Praia Vermelha', null);
  
INSERT INTO public.localizacao (id, nome, id_localizacao) VALUES
  (6, 'Gragoata', null),
  (7, 'Sala 401', 6),
  (8, 'Sala 306', 6),
  (9, 'Sala 208', 6),
  (10, 'Praia Vermelha', null);

-- Inserir dados na tabela 'nivel'
INSERT INTO public.nivel (id, tipo, descricao) VALUES
  (1, 'Administrador', 'Gerenciar o banco de dados'),
  (2, 'Usuário', 'Abrir e fechar chamados'),
  (3, 'Supervisor', 'Supervisiona usuários'),
  (4, 'Gerente', 'Gerencia a equipe');

-- Inserir dados na tabela 'usuario'
INSERT INTO public.usuario (id, nome, cpf, dt_nasc, id_nivel) VALUES
  (1, 'João Silva', '123.456.789-01', '1990-01-15', 1),
  (2, 'Maria Santos', '987.654.321-01', '1985-05-20', 2),
  (3, 'Carlos Oliveira', '456.789.012-34', '1992-09-10', 3),
  (4, 'Ana Pereira', '876.543.210-98', '1980-03-25', 2),
  (5, 'Lucas Souza', '234.567.890-12', '1995-07-05', 1);

-- Inserir dados na tabela 'equipamento'
INSERT INTO public.equipamento (mac, marca, modelo, data_aquisicao, id_localizacao, ip) VALUES
  ('AA:BB:CC:DD:EE:01', 'Dell', 'Latitude', '2022-01-01', 1, '192.168.1.1'),
  ('AA:BB:CC:DD:EE:02', 'HP', 'Pavilion', '2022-02-15', 2, '192.168.1.2'),
  ('AA:BB:CC:DD:EE:03', 'Lenovo', 'ThinkPad', '2022-03-20', 2, '192.168.1.3'),
  ('AA:BB:CC:DD:EE:04', 'Asus', 'ZenBook', '2022-04-10', 4, '192.168.1.4'),
  ('AA:BB:CC:DD:EE:05', 'Acer', 'Aspire', '2022-05-05', 2, '192.168.1.5'),
  ('AA:BB:CC:DD:EE:11', 'Intelbras', 'MX180H', '2023-02-01', 7, '192.168.6.101'),
  ('AA:BB:CC:DD:EE:12', 'Intelbras', 'MX270G', '2023-03-04', 8, '192.168.6.102'),
  ('AA:BB:CC:DD:EE:13', 'Intelbras', 'MY430F', '2023-04-08', 9, '192.168.6.103'),
  ('AA:BB:CC:DD:EE:14', 'Intelbras', 'MY430F', '2023-05-02', 4, '192.168.6.104'),
  ('AA:BB:CC:DD:EE:15', 'Intelbras', 'MX180H', '2023-06-09', 2, '192.168.6.105'),
  ('AA:BB:CC:DD:EE:16', 'Aruba', 'G45D', '2023-02-15', 1, '172.20.210.40'),
  ('AA:BB:CC:DD:EE:17', 'Aruba', 'G45D', '2023-02-15', 3, '172.20.210.41'),
  ('AA:BB:CC:DD:EE:18', 'Aruba', 'G45D', '2023-02-15', 4, '172.20.210.42'),
  ('AA:BB:CC:DD:EE:19', 'Aruba', 'G45D', '2023-02-15', 7, '172.20.210.43'),
  ('AA:BB:CC:DD:EE:20', 'Aruba', 'G45D', '2023-02-15', 10, '172.20.210.44'),
  ('AA:BB:CC:DD:EE:21', 'Hikvision', 'J559', '2021-07-4', 2, '172.20.225.01'),
  ('AA:BB:CC:DD:EE:22', 'Hikvision', 'J559', '2021-07-4', 8, '172.20.225.02'),
  ('AA:BB:CC:DD:EE:23', 'Hikvision', 'J559', '2021-07-4', 1, '172.20.225.03'),
  ('AA:BB:CC:DD:EE:24', 'Teki', 'Speed Dome', '2008-06-20', 3, '172.20.120.11'),
  ('AA:BB:CC:DD:EE:25', 'Teki', 'Speed Dome', '2008-06-20', 9, '172.20.120.12');
  
INSERT INTO public.equipamento (mac, marca, modelo, data_aquisicao, id_localizacao, ip) VALUES
  ('AA:BB:CC:DD:EE:26', 'Hikvision', 'J760', '2021-10-5', 7, '172.20.130.10'),
  ('AA:BB:CC:DD:EE:27', 'Hikvision', 'J760', '2021-10-5', 7, '172.20.130.11'),
  ('AA:BB:CC:DD:EE:28', 'Hikvision', 'J760', '2021-10-5', 7, '172.20.130.12'),
  ('AA:BB:CC:DD:EE:29', 'Aruba', 'G45D', '2022-06-14', 9, '172.20.212.17'),
  ('AA:BB:CC:DD:EE:30', 'Acer', 'Aspire', '2019-05-05', 5, '192.168.0.8');
  
-- Inserir dados na tabela 'chamado'
INSERT INTO public.chamado (id, descricao, data, urgencia, id_localizacao, estado) VALUES
  (1, 'Problema na rede', '2023-01-10', 'Alta', 1, 'Aberto'),
  (2, 'Problema no sistema', '2023-02-15', 'Média', 1, 'Aberto'),
  (3, 'Hardware defeituoso', '2023-03-20', 'Baixa', 3, 'Fechado'),
  (4, 'Atualização de software', '2023-04-10', 'Alta', 4, 'Aberto'),
  (5, 'Erro no aplicativo', '2023-05-05', 'Média', 4, 'Fechado');
  
INSERT INTO public.chamado (id, descricao, data, urgencia, id_localizacao, estado) VALUES
  (6, 'Reposição de câmera', '2023-08-21', 'Alta', 7, 'Aberto'),
  (7, 'Reposição de câmera', '2023-08-21', 'Alta', 7, 'Aberto'),
  (8, 'Reposição de câmera', '2023-08-21', 'Alta', 7, 'Aberto'),
  (9, 'Conector com mal contato', '2023-02-07', 'Baixa', 9, 'Aberto'),
  (10, 'Arquivos faltando', '2022-09-02', 'Média', 5, 'Fechado');
  
-- Inserir dados na tabela 'solucao_chamado'
INSERT INTO public.solucao_chamado (id, id_chamado, mensagem) VALUES
  (1, 1, 'Reinicialização do roteador resolveu o problema'),
  (2, 2, 'Atualização do sistema operacional realizada com sucesso'),
  (3, 3, 'Substituição do hardware defeituoso'),
  (4, 4, 'Realizada a atualização para a versão mais recente'),
  (5, 5, 'Investigando e corrigindo o bug no código do aplicativo')
  (6, 10, 'O arquivos foram recuperados do último backup');
  
-- Inserir dados na tabela 'usuario_chamado'
INSERT INTO public.usuario_chamado (id_usuario, id_chamado, papel) VALUES
(1,1,'abriu'),
(1,2,'abriu'),
(2,3,'abriu'),
(4,3,'fechou'),
(3,4,'abriu'),
(3,5,'abriu'),
(4,5,'fechou');

-- Inserir dados na tabela 'chamado_ligado'
INSERT INTO public.chamado_ligado (id_chamado, id_chamado_ligado) VALUES
  (2, 1),
  (4, 1),
  (5, 1);

-- Inserir dados na tabela 'computador'
INSERT INTO public.computador (mac_equipamento, qtd_nucleos, qtd_ram, qtd_armazenamento) VALUES
  ('AA:BB:CC:DD:EE:01', 4, 8, 256),
  ('AA:BB:CC:DD:EE:02', 8, 16, 512),
  ('AA:BB:CC:DD:EE:03', 2, 4, 128),
  ('AA:BB:CC:DD:EE:04', 6, 12, 256),
  ('AA:BB:CC:DD:EE:05', 4, 8, 512);

-- Inserir dados na tabela 'dvr'
INSERT INTO public.dvr (mac_equipamento, nro_portas) VALUES
  ('AA:BB:CC:DD:EE:11', 16),
  ('AA:BB:CC:DD:EE:12', 8),
  ('AA:BB:CC:DD:EE:13', 32),
  ('AA:BB:CC:DD:EE:14', 24),
  ('AA:BB:CC:DD:EE:15', 16);

-- Inserir dados na tabela 'switch'
INSERT INTO public.switch (mac_equipamento, velocidade, nro_portas) VALUES
  ('AA:BB:CC:DD:EE:16', '1 Gbps', 24),
  ('AA:BB:CC:DD:EE:17', '10 Gbps', 48),
  ('AA:BB:CC:DD:EE:18', '1 Gbps', 24),
  ('AA:BB:CC:DD:EE:19', '100 Mbps', 16),
  ('AA:BB:CC:DD:EE:20', '1 Gbps', 24);

-- Inserir dados na tabela 'camera'
INSERT INTO public.camera (mac_equipamento, lente, megapixels) VALUES
  ('AA:BB:CC:DD:EE:21', 'Wide-angle', 12),
  ('AA:BB:CC:DD:EE:22', 'Zoom', 20),
  ('AA:BB:CC:DD:EE:23', 'Fish-eye', 8),
  ('AA:BB:CC:DD:EE:24', 'Night vision', 10),
  ('AA:BB:CC:DD:EE:25', 'Pan-tilt', 15);

-- Inserir dados na tabela 'telefone_contato'
INSERT INTO public.telefone_contato (id, num, id_usuario) VALUES
  (1, 123456789, 1),
  (2, 387234985, 1),
  (3, 987654321, 2),
  (4, 456789012, 3),
  (5, 876543210, 4),
  (6, 983725982, 4),
  (7, 234567890, 5);

-- Inserir dados na tabela 'responsavel_equipamento'
INSERT INTO public.responsavel_equipamento (id_usuario, mac_equipamento) VALUES
  (1, 'AA:BB:CC:DD:EE:05'),
  (2, 'AA:BB:CC:DD:EE:11'),
  (3, 'AA:BB:CC:DD:EE:16'),
  (2, 'AA:BB:CC:DD:EE:21'),
  (2, 'AA:BB:CC:DD:EE:25');
 
-- Inserir dados na tabela 'chamado_equipamento'
INSERT INTO public.chamado_equipamento (id_chamado, mac_equipamento) VALUES
  (2, 'AA:BB:CC:DD:EE:02'),
  (3, 'AA:BB:CC:DD:EE:02'),
  (4, 'AA:BB:CC:DD:EE:02'),
  (1, 'AA:BB:CC:DD:EE:24'),
  (1, 'AA:BB:CC:DD:EE:25'),
  (5, 'AA:BB:CC:DD:EE:14');
  
INSERT INTO public.chamado_equipamento (id_chamado, mac_equipamento) VALUES
  (6, 'AA:BB:CC:DD:EE:26'),
  (7, 'AA:BB:CC:DD:EE:27'),
  (8, 'AA:BB:CC:DD:EE:28'),
  (9, 'AA:BB:CC:DD:EE:29'),
  (10, 'AA:BB:CC:DD:EE:30');
