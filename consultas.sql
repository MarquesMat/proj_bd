--- 5. Selecionar informações de pessoas nível Usuário responsáveis por mais equipamentos
select distinct u.id, nome, num as telefone, count(mac_equipamento) as total_equipamentos
from usuario u join telefone_contato t on u.id = t.id_usuario
left join responsavel_equipamento r on u.id=r.id_usuario
where id_nivel = (select id from nivel where tipo like 'Usuário')
group by u.id, nome, num;

--- 6. Calcular número de chamados em aberto por localização
select nome, count(*) as chamados_abertos from localizacao l, chamado c
where l.id = c.id_localizacao and estado like 'Aberto'
group by nome
order by chamados_abertos;

--- 7. Selecionar equipamentos com chamados de nível "urgência alta" ordenado por quantidade.
select count(c.id) as urgentes, ip from equipamento e join chamado_equipamento ce on e.mac = ce.mac_equipamento
left join chamado c on c.urgencia like 'Alta' and c.id = ce.id_chamado
group by ip
order by urgentes desc;

--- 8. Proporção de chamados em aberto no ano de 2023
select 
  extract(year from data) as ano,
  sum(case when estado = 'Aberto' then 1 else 0 end) as chamados_abertos,
  count(*) as total_chamados,
  case when count(*) > 0 then 
    (sum(case when estado = 'Aberto' then 1 else 0 end)::decimal / count(*)) 
  else 
    0 
  end as fracao_chamados_abertos
from public.chamado
where extract(year from data) = 2023
group by extract(year from data);

--- 9. Selecionar cpf, nome, telefone e nivel de usuário perto de se aposentar (nasceu antes 1965)
select cpf, nome, tipo as cargo from usuario u, nivel n
where u.id_nivel = n.id and extract(year from dt_nasc) < 1965
order by dt_nasc;

--- 10. Selecionar marcas com menor número de chamados
select marca, count(id_chamado) as total_chamados from equipamento left join chamado_equipamento
on mac = mac_equipamento -- O left join permite incluir os equipamentos sem chamados
group by marca
order by total_chamados;

