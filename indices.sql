-- usuario
create index
nomeUsuario
on usuario
using hash(nome);

create index
idxUsuario
on usuario
using hash(id);

-- telefone_contato
create index
usuarioTelefone
on telefone_contato
using hash(id_usuario);

-- chamado
create index
estadoChamado
on chamado
using hash(estado);

create index
idxChamado
on chamado
using hash(id);

create index
locChamado
on chamado
using hash(id_localizacao);

-- usuario_chamado
create index
chamadoIdUsuario
on usuario_chamado
using hash(id_usuario);

create index
chamadoIdChamado
on usuario_chamado
using hash(id_chamado);

-- equipamento
create index
idxEquipamento
on equipamento
using hash(mac);

-- responsavel_equipamento
create index
respEquipUsuario
on responsavel_equipamento
using hash(id_usuario);

create index
respEquipMac
on responsavel_equipamento
using hash(mac_equipamento);

-- chamado_equipamento
create index
chamEquipIdChamado
on chamado_equipamento
using hash(id_chamado);

create index
chamEquipMac
on chamado_equipamento
using hash(mac_equipamento);

-- localização
create index
nomeLoc
on localizacao
using hash(nome);

create index
idxLoc
on localizacao
using hash(id);

-- nivel
create index
tipoNivel
on nivel
using hash(tipo);

-- computador
create index
macComputador
on computador
using hash(mac_equipamento);
