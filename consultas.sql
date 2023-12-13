--- 1. Selecionar o nome, nível do usuário, e a quantidade de chamados fechados por cada usuário.
SELECT public.usuario.nome, public.usuario.id_nivel, COUNT(public.usuario_chamado.id_chamado) AS total
FROM public.usuario
INNER JOIN public.usuario_chamado ON public.usuario_chamado.id_usuario = public.usuario.id
WHERE usuario_chamado.papel = 'fechou'
GROUP BY public.usuario.id
ORDER BY total DESC

-- 2. Selecionar o nome, o id do usuário responsável pelos equipamentos localizados no Gragoatá, e a contagem de equipamentos
WITH	localizacao_maior AS (
	SELECT *
	FROM public.localizacao
	WHERE public.localizacao.nome = 'Gragoatá'
	)
SELECT public.usuario.id, public.usuario.nome, COUNT(public.equipamento.mac)
FROM public.usuario
INNER JOIN public.responsavel_equipamento ON public.responsavel_equipamento.id_usuario = public.usuario.id
INNER JOIN public.equipamento ON public.equipamento.mac = public.responsavel_equipamento.mac_equipamento
INNER JOIN public.localizacao ON public.localizacao.id = public.equipamento.id_localizacao
INNER JOIN localizacao_maior ON public.localizacao.id_localizacao = localizacao_maior.id
GROUP BY public.usuario.id

--- 3. Selecionar a marca com maior número de chamados agrupado por computador.
SELECT public.equipamento.marca, COUNT(public.chamado_equipamento.id_chamado)
FROM public.equipamento
INNER JOIN public.computador ON public.computador.mac_equipamento = public.equipamento.mac
INNER JOIN public.chamado_equipamento ON public.chamado_equipamento.mac_equipamento = public.equipamento.mac
GROUP BY public.equipamento.marca

--- 4. Selecionar o telefone e o nome dos usuários com o menor número de chamados fechados.
SELECT public.usuario.nome, public.telefone_contato.num, COUNT(public.usuario_chamado.id_chamado)
FROM public.usuario
INNER JOIN public.telefone_contato ON public.telefone_contato.id_usuario = public.usuario.id
INNER JOIN public.usuario_chamado ON public.usuario_chamado.id_usuario = public.usuario.id
INNER JOIN public.chamado ON public.chamado.id = public.usuario_chamado.id_chamado
WHERE public.chamado.estado = 'Fechado'
GROUP BY public.usuario.nome, public.telefone_contato.num

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

