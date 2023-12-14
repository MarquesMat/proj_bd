-- Visão 1: Exibe os dados mais importantes dos funcionários
create view dados_funcionarios
as select tipo, nome, cpf, dt_nasc, (select t.num from telefone_contato t where t.id_usuario = u.id limit 1) -- Considera apenas 1 dos números de telefone
from usuario u, nivel n
where u.id_nivel = n.id;

select * from dados_funcionarios;
