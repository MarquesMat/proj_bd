-- Visão 1: Exibe os dados mais importantes dos funcionários
create view dados_funcionarios
as select tipo, nome, cpf, dt_nasc, (select t.num from telefone_contato t where t.id_usuario = u.id limit 1) -- Considera apenas 1 dos números de telefone
from usuario u, nivel n
where u.id_nivel = n.id;

select * from dados_funcionarios;

-- Visão 2: Exibe a quantidade de cada tipo de equipamento no campus Gragoatá
create view equipamentos_gragoata
as select 
  count(case when c.mac_equipamento is not NULL then 1 end) as cameras,
  count(case when com.mac_equipamento is not NULL then 1 end) as computadores,
  count(case when d.mac_equipamento is not NULL then 1 end) as dvrs,
  count(case when s.mac_equipamento is not NULL then 1 end) as switches
from equipamento e left join localizacao l on e.id_localizacao = l.id
left join
  camera c ON e.mac = c.mac_equipamento
left join
  computador com ON e.mac = com.mac_equipamento
left join
  dvr d ON e.mac = d.mac_equipamento
left join
  switch s ON e.mac = s.mac_equipamento
where l.id_localizacao = (select id from localizacao where nome like 'Gragoatá');

select * from equipamentos_gragoata;
