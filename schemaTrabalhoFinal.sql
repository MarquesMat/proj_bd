--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-12 22:36:02

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
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
-- TOC entry 4898 (class 0 OID 0)
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
-- TOC entry 4899 (class 0 OID 0)
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
-- TOC entry 4900 (class 0 OID 0)
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
-- TOC entry 4901 (class 0 OID 0)
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
-- TOC entry 4902 (class 0 OID 0)
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
    id_usuario_abriu integer NOT NULL,
    id_chamado integer NOT NULL,
    id_usuario_fechou integer
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
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4698 (class 2604 OID 17872)
-- Name: chamado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado ALTER COLUMN id SET DEFAULT nextval('public.chamado_id_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 17896)
-- Name: localizacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacao ALTER COLUMN id SET DEFAULT nextval('public.localizacao_id_seq'::regclass);


--
-- TOC entry 4695 (class 2604 OID 17846)
-- Name: nivel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nivel ALTER COLUMN id SET DEFAULT nextval('public.nivel_id_seq'::regclass);


--
-- TOC entry 4699 (class 2604 OID 17879)
-- Name: solucao_chamado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solucao_chamado ALTER COLUMN id SET DEFAULT nextval('public.solucao_chamado_id_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 17865)
-- Name: telefone_contato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone_contato ALTER COLUMN id SET DEFAULT nextval('public.telefone_id_seq'::regclass);


--
-- TOC entry 4696 (class 2604 OID 17853)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4722 (class 2606 OID 17918)
-- Name: camera camera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera
    ADD CONSTRAINT camera_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4730 (class 2606 OID 17953)
-- Name: chamado_equipamento chamado_equipamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT chamado_equipamento_pkey PRIMARY KEY (id_chamado, mac_equipamento);


--
-- TOC entry 4712 (class 2606 OID 17886)
-- Name: chamado_ligado chamado_ligado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT chamado_ligado_pkey PRIMARY KEY (id_chamado, id_chamado_ligado);


--
-- TOC entry 4708 (class 2606 OID 17874)
-- Name: chamado chamado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT chamado_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 17908)
-- Name: computador computador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computador
    ADD CONSTRAINT computador_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4726 (class 2606 OID 17938)
-- Name: dvr dvr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dvr
    ADD CONSTRAINT dvr_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4718 (class 2606 OID 17903)
-- Name: equipamento equipamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_pkey PRIMARY KEY (mac);


--
-- TOC entry 4716 (class 2606 OID 17898)
-- Name: localizacao localizacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT localizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 17848)
-- Name: nivel nivel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nivel
    ADD CONSTRAINT nivel_pkey PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 18110)
-- Name: usuario_chamado pk_usuario_chamado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT pk_usuario_chamado PRIMARY KEY (id_usuario_abriu, id_chamado);


--
-- TOC entry 4728 (class 2606 OID 17948)
-- Name: responsavel_equipamento responsavel_equipamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT responsavel_equipamento_pkey PRIMARY KEY (id_usuario, mac_equipamento);


--
-- TOC entry 4710 (class 2606 OID 17881)
-- Name: solucao_chamado solucao_chamado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solucao_chamado
    ADD CONSTRAINT solucao_chamado_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 17928)
-- Name: switch switch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch
    ADD CONSTRAINT switch_pkey PRIMARY KEY (mac_equipamento);


--
-- TOC entry 4706 (class 2606 OID 17867)
-- Name: telefone_contato telefone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone_contato
    ADD CONSTRAINT telefone_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 17855)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 17919)
-- Name: camera camera_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera
    ADD CONSTRAINT camera_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4741 (class 2606 OID 17909)
-- Name: computador computador_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computador
    ADD CONSTRAINT computador_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4744 (class 2606 OID 17939)
-- Name: dvr dvr_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dvr
    ADD CONSTRAINT dvr_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4732 (class 2606 OID 18099)
-- Name: telefone_contato fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone_contato
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 4734 (class 2606 OID 17959)
-- Name: chamado_ligado fk_idchamado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);


--
-- TOC entry 4736 (class 2606 OID 17979)
-- Name: usuario_chamado fk_idchamado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);


--
-- TOC entry 4747 (class 2606 OID 18014)
-- Name: chamado_equipamento fk_idchamado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);


--
-- TOC entry 4735 (class 2606 OID 17964)
-- Name: chamado_ligado fk_idchamadoligado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT fk_idchamadoligado FOREIGN KEY (id_chamado_ligado) REFERENCES public.chamado(id);


--
-- TOC entry 4733 (class 2606 OID 17954)
-- Name: chamado fk_idlocalizacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);


--
-- TOC entry 4739 (class 2606 OID 17984)
-- Name: localizacao fk_idlocalizacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);


--
-- TOC entry 4740 (class 2606 OID 17989)
-- Name: equipamento fk_idlocalizacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);


--
-- TOC entry 4745 (class 2606 OID 18004)
-- Name: responsavel_equipamento fk_idusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 4737 (class 2606 OID 17969)
-- Name: usuario_chamado fk_idusuarioabriu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idusuarioabriu FOREIGN KEY (id_usuario_abriu) REFERENCES public.usuario(id);


--
-- TOC entry 4738 (class 2606 OID 18104)
-- Name: usuario_chamado fk_idusuariofechou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idusuariofechou FOREIGN KEY (id_usuario_fechou) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4746 (class 2606 OID 18009)
-- Name: responsavel_equipamento fk_mac_equipamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT fk_mac_equipamento FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4748 (class 2606 OID 18019)
-- Name: chamado_equipamento fk_mac_equipamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT fk_mac_equipamento FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4743 (class 2606 OID 17929)
-- Name: switch switch_macequipamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch
    ADD CONSTRAINT switch_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);


--
-- TOC entry 4731 (class 2606 OID 17856)
-- Name: usuario usuario_idnivel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idnivel_fkey FOREIGN KEY (id_nivel) REFERENCES public.nivel(id);


-- Completed on 2023-12-12 22:36:03

--
-- PostgreSQL database dump complete
--

