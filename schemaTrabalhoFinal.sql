--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-13 20:18:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 236 (class 1255 OID 18116)
-- Name: alteraestadochamado(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.alteraestadochamado() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	update chamado set estado = 'Fechado' where id = new.id_chamado;
	return NULL;
end;
$$;


ALTER FUNCTION public.alteraestadochamado() OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 18128)
-- Name: chamadosabertos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.chamadosabertos() RETURNS TABLE(resultado text)
    LANGUAGE plpgsql
    AS $$
begin
	return query
	Select concat('Id Usuário: ',u.id,' |Nome: ',u.nome,
	' |Id Chamado: ',c.id,' |Descrição: ',c.descricao,' |Urgência: ',c.urgencia,' |Estado: ',c.estado,
	' |MAC: ',ce.mac_equipamento,' |Localização: ',l.nome)
	from usuario u inner join usuario_chamado uc on u.id = uc.id_usuario
	inner join chamado c on uc.id_chamado = c.id	
	inner join localizacao l on c.id_localizacao = l.id
	inner join chamado_equipamento ce on c.id = ce.id_chamado
	where c.estado = 'Aberto';
end;
$$;


ALTER FUNCTION public.chamadosabertos() OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 18125)
-- Name: contarequipamento(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.contarequipamento(tipo character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare qtd_equipamentos int;
begin
	if tipo = 'camera'
		then select count(mac_equipamento) into qtd_equipamentos from camera;
	elsif tipo = 'computador'
		then select count(mac_equipamento) into qtd_equipamentos from computador;
	elsif tipo = 'dvr'
		then select count(mac_equipamento) into qtd_equipamentos from dvr;
	elsif tipo = 'switch'
		then select count(mac_equipamento) into qtd_equipamentos from switch;
	end if;
	return qtd_equipamentos;
end;
$$;


ALTER FUNCTION public.contarequipamento(tipo character varying) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 18121)
-- Name: promoverusuario(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.promoverusuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare contador_fechados int;
begin
	select count(id_usuario) into contador_fechados from usuario_chamado where id_usuario = new.id_usuario and papel = 'fechou';
	
	if contador_fechados <= 3
		then update usuario set id_nivel = 2 where id = new.id_usuario;
		
	elsif  contador_fechados > 3 and contador_fechados < 6
		then update usuario set id_nivel = 4 where id = new.id_usuario;
		
	else update usuario set id_nivel = 3 where id = new.id_usuario;
	end if;
	return NULL;
end;
$$;


ALTER FUNCTION public.promoverusuario() OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 18133)
-- Name: tempovidaequipamento(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tempovidaequipamento(tipo character varying) RETURNS TABLE(texto text)
    LANGUAGE plpgsql
    AS $$
begin
	if tipo = 'camera'
		then return query
		select concat('Marca: ',marca,' | Modelo: ',modelo,' | Mac: ',mac,' |Tempo de Vida: ',age(current_date,data_aquisicao))
		from equipamento e
		inner join camera c on e.mac = c.mac_equipamento;
	elsif tipo = 'computador'
		then return query 
		select concat('Marca: ',marca,' | Modelo: ',modelo,' | Mac: ',mac,' |Tempo de Vida: ',age(current_date,data_aquisicao))
		from equipamento e
		inner join computador c on e.mac = c.mac_equipamento;
	elsif tipo = 'dvr'
		then return query 
		select concat('Marca: ',marca,' | Modelo: ',modelo,' | Mac: ',mac,' |Tempo de Vida: ',age(current_date,data_aquisicao))
		from equipamento e
		inner join dvr on e.mac = dvr.mac_equipamento;
	elsif tipo = 'switch'
		then return query 
		select concat('Marca: ',marca,' | Modelo: ',modelo,' | Mac: ',mac,' |Tempo de Vida: ',age(current_date,data_aquisicao))
		from equipamento e
		inner join switch s on e.mac = s.mac_equipamento;
	end if;
end;
$$;


ALTER FUNCTION public.tempovidaequipamento(tipo character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 231 (class 1259 OID 17914)
-- Name: camera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camera (
    mac_equipamento character varying(40) NOT NULL,
    lente character varying(50),
    megapixels integer
);


ALTER TABLE public.camera OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17869)
-- Name: chamado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chamado (
    id integer NOT NULL,
    descricao character varying(200) NOT NULL,
    data date NOT NULL,
    urgencia character varying(50) NOT NULL,
    id_localizacao integer NOT NULL,
    estado character varying(100) NOT NULL
);


ALTER TABLE public.chamado OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17949)
-- Name: chamado_equipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chamado_equipamento (
    id_chamado integer NOT NULL,
    mac_equipamento character varying(40) NOT NULL
);


ALTER TABLE public.chamado_equipamento OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17868)
-- Name: chamado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chamado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chamado_id_seq OWNER TO postgres;

--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 221
-- Name: chamado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chamado_id_seq OWNED BY public.chamado.id;


--
-- TOC entry 225 (class 1259 OID 17882)
-- Name: chamado_ligado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chamado_ligado (
    id_chamado integer NOT NULL,
    id_chamado_ligado integer NOT NULL
);


ALTER TABLE public.chamado_ligado OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17904)
-- Name: computador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.computador (
    mac_equipamento character varying(40) NOT NULL,
    qtd_nucleos integer,
    qtd_ram integer,
    qtd_armazenamento integer
);


ALTER TABLE public.computador OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17934)
-- Name: dvr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dvr (
    mac_equipamento character varying(40) NOT NULL,
    nro_portas integer
);


ALTER TABLE public.dvr OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17899)
-- Name: equipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamento (
    mac character varying(40) NOT NULL,
    marca character varying(50) NOT NULL,
    modelo character varying(50) NOT NULL,
    data_aquisicao date,
    id_localizacao integer,
    ip character varying(40)
);


ALTER TABLE public.equipamento OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17893)
-- Name: localizacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localizacao (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    id_localizacao integer
);


ALTER TABLE public.localizacao OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17892)
-- Name: localizacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.localizacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.localizacao_id_seq OWNER TO postgres;

--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 227
-- Name: localizacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.localizacao_id_seq OWNED BY public.localizacao.id;


--
-- TOC entry 216 (class 1259 OID 17843)
-- Name: nivel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nivel (
    id integer NOT NULL,
    tipo character varying(20) NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.nivel OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17842)
-- Name: nivel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nivel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nivel_id_seq OWNER TO postgres;

--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 215
-- Name: nivel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nivel_id_seq OWNED BY public.nivel.id;


--
-- TOC entry 234 (class 1259 OID 17944)
-- Name: responsavel_equipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsavel_equipamento (
    id_usuario integer NOT NULL,
    mac_equipamento character varying(40) NOT NULL
);


ALTER TABLE public.responsavel_equipamento OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17876)
-- Name: solucao_chamado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solucao_chamado (
    id integer NOT NULL,
    id_chamado integer NOT NULL,
    mensagem character varying(200)
);


ALTER TABLE public.solucao_chamado OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17875)
-- Name: solucao_chamado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solucao_chamado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solucao_chamado_id_seq OWNER TO postgres;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 223
-- Name: solucao_chamado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solucao_chamado_id_seq OWNED BY public.solucao_chamado.id;


--
-- TOC entry 232 (class 1259 OID 17924)
-- Name: switch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.switch (
    mac_equipamento character varying(40) NOT NULL,
    velocidade character varying(20),
    nro_portas integer
);


ALTER TABLE public.switch OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17862)
-- Name: telefone_contato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefone_contato (
    id integer NOT NULL,
    num integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.telefone_contato OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17861)
-- Name: telefone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telefone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.telefone_id_seq OWNER TO postgres;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 219
-- Name: telefone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telefone_id_seq OWNED BY public.telefone_contato.id;


--
-- TOC entry 218 (class 1259 OID 17850)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    nome character varying(50) NOT NULL,
    id integer NOT NULL,
    cpf character varying(14) NOT NULL,
    dt_nasc date,
    id_nivel integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17887)
-- Name: usuario_chamado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_chamado (
    id_usuario integer NOT NULL,
    id_chamado integer NOT NULL,
    papel character varying(20) NOT NULL
);


ALTER TABLE public.usuario_chamado OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17849)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4703 (class 2604 OID 17872)
-- Name: chamado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado ALTER COLUMN id SET DEFAULT nextval('public.chamado_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 17896)
-- Name: localizacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacao ALTER COLUMN id SET DEFAULT nextval('public.localizacao_id_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 17846)
-- Name: nivel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nivel ALTER COLUMN id SET DEFAULT nextval('public.nivel_id_seq'::regclass);


--
-- TOC entry 4704 (class 2604 OID 17879)
-- Name: solucao_chamado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solucao_chamado ALTER COLUMN id SET DEFAULT nextval('public.solucao_chamado_id_seq'::regclass);


--
-- TOC entry 4702 (class 2604 OID 17865)
-- Name: telefone_contato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone_contato ALTER COLUMN id SET DEFAULT nextval('public.telefone_id_seq'::regclass);


--
-- TOC entry 4701 (class 2604 OID 17853)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4727 (class 2606 OID 17918)
-- Name: camera camera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera
    ADD CONSTRAINT camera_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4735 (class 2606 OID 17953)
-- Name: chamado_equipamento chamado_equipamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT chamado_equipamento_pkey PRIMARY KEY (id_chamado, mac_equipamento);


--
-- TOC entry 4717 (class 2606 OID 17886)
-- Name: chamado_ligado chamado_ligado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT chamado_ligado_pkey PRIMARY KEY (id_chamado, id_chamado_ligado);


--
-- TOC entry 4713 (class 2606 OID 17874)
-- Name: chamado chamado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT chamado_pkey PRIMARY KEY (id);


--
-- TOC entry 4725 (class 2606 OID 17908)
-- Name: computador computador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computador
    ADD CONSTRAINT computador_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4731 (class 2606 OID 17938)
-- Name: dvr dvr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dvr
    ADD CONSTRAINT dvr_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4723 (class 2606 OID 17903)
-- Name: equipamento equipamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_pkey PRIMARY KEY (mac);


--
-- TOC entry 4721 (class 2606 OID 17898)
-- Name: localizacao localizacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT localizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 17848)
-- Name: nivel nivel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nivel
    ADD CONSTRAINT nivel_pkey PRIMARY KEY (id);


--
-- TOC entry 4719 (class 2606 OID 18114)
-- Name: usuario_chamado pk_usuario_chamado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT pk_usuario_chamado PRIMARY KEY (id_usuario, id_chamado, papel);


--
-- TOC entry 4733 (class 2606 OID 17948)
-- Name: responsavel_equipamento responsavel_equipamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT responsavel_equipamento_pkey PRIMARY KEY (id_usuario, mac_equipamento);


--
-- TOC entry 4715 (class 2606 OID 17881)
-- Name: solucao_chamado solucao_chamado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solucao_chamado
    ADD CONSTRAINT solucao_chamado_pkey PRIMARY KEY (id);


--
-- TOC entry 4729 (class 2606 OID 17928)
-- Name: switch switch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch
    ADD CONSTRAINT switch_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4711 (class 2606 OID 17867)
-- Name: telefone_contato telefone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone_contato
    ADD CONSTRAINT telefone_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 17855)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2620 OID 18122)
-- Name: usuario_chamado promover_trig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER promover_trig AFTER INSERT OR UPDATE ON public.usuario_chamado FOR EACH ROW EXECUTE FUNCTION public.promoverusuario();


--
-- TOC entry 4753 (class 2620 OID 18117)
-- Name: solucao_chamado solucao_trig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER solucao_trig AFTER INSERT OR UPDATE ON public.solucao_chamado FOR EACH ROW EXECUTE FUNCTION public.alteraestadochamado();


--
-- TOC entry 4746 (class 2606 OID 17919)
-- Name: camera camera_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera
    ADD CONSTRAINT camera_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4745 (class 2606 OID 17909)
-- Name: computador computador_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computador
    ADD CONSTRAINT computador_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4748 (class 2606 OID 17939)
-- Name: dvr dvr_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dvr
    ADD CONSTRAINT dvr_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4737 (class 2606 OID 18099)
-- Name: telefone_contato fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone_contato
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 4739 (class 2606 OID 17959)
-- Name: chamado_ligado fk_idchamado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);


--
-- TOC entry 4741 (class 2606 OID 17979)
-- Name: usuario_chamado fk_idchamado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);


--
-- TOC entry 4751 (class 2606 OID 18014)
-- Name: chamado_equipamento fk_idchamado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);


--
-- TOC entry 4740 (class 2606 OID 17964)
-- Name: chamado_ligado fk_idchamadoligado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT fk_idchamadoligado FOREIGN KEY (id_chamado_ligado) REFERENCES public.chamado(id);


--
-- TOC entry 4738 (class 2606 OID 17954)
-- Name: chamado fk_idlocalizacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);


--
-- TOC entry 4743 (class 2606 OID 17984)
-- Name: localizacao fk_idlocalizacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);


--
-- TOC entry 4744 (class 2606 OID 17989)
-- Name: equipamento fk_idlocalizacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);


--
-- TOC entry 4742 (class 2606 OID 17969)
-- Name: usuario_chamado fk_idusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 4749 (class 2606 OID 18004)
-- Name: responsavel_equipamento fk_idusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 4750 (class 2606 OID 18009)
-- Name: responsavel_equipamento fk_mac_equipamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT fk_mac_equipamento FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4752 (class 2606 OID 18019)
-- Name: chamado_equipamento fk_mac_equipamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT fk_mac_equipamento FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4747 (class 2606 OID 17929)
-- Name: switch switch_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch
    ADD CONSTRAINT switch_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4736 (class 2606 OID 17856)
-- Name: usuario usuario_idnivel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idnivel_fkey FOREIGN KEY (id_nivel) REFERENCES public.nivel(id);


-- Completed on 2023-12-13 20:18:39

--
-- PostgreSQL database dump complete
--

