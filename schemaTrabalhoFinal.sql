PGDMP                      {            TrabalhoFinalBD2    16.1    16.0 G               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    17841    TrabalhoFinalBD2    DATABASE     �   CREATE DATABASE "TrabalhoFinalBD2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 "   DROP DATABASE "TrabalhoFinalBD2";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            !           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    17914    camera    TABLE     �   CREATE TABLE public.camera (
    mac_equipamento character varying(40) NOT NULL,
    lente character varying(50),
    megapixels integer
);
    DROP TABLE public.camera;
       public         heap    postgres    false    4            �            1259    17869    chamado    TABLE     �   CREATE TABLE public.chamado (
    id integer NOT NULL,
    descricao character varying(200) NOT NULL,
    data date NOT NULL,
    urgencia character varying(50) NOT NULL,
    id_localizacao integer NOT NULL,
    estado character varying(100) NOT NULL
);
    DROP TABLE public.chamado;
       public         heap    postgres    false    4            �            1259    17949    chamado_equipamento    TABLE     �   CREATE TABLE public.chamado_equipamento (
    id_chamado integer NOT NULL,
    mac_equipamento character varying(40) NOT NULL
);
 '   DROP TABLE public.chamado_equipamento;
       public         heap    postgres    false    4            �            1259    17868    chamado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chamado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.chamado_id_seq;
       public          postgres    false    4    222            "           0    0    chamado_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.chamado_id_seq OWNED BY public.chamado.id;
          public          postgres    false    221            �            1259    17882    chamado_ligado    TABLE     p   CREATE TABLE public.chamado_ligado (
    id_chamado integer NOT NULL,
    id_chamado_ligado integer NOT NULL
);
 "   DROP TABLE public.chamado_ligado;
       public         heap    postgres    false    4            �            1259    17904 
   computador    TABLE     �   CREATE TABLE public.computador (
    mac_equipamento character varying(40) NOT NULL,
    qtd_nucleos integer,
    qtd_ram integer,
    qtd_armazenamento integer
);
    DROP TABLE public.computador;
       public         heap    postgres    false    4            �            1259    17934    dvr    TABLE     h   CREATE TABLE public.dvr (
    mac_equipamento character varying(40) NOT NULL,
    nro_portas integer
);
    DROP TABLE public.dvr;
       public         heap    postgres    false    4            �            1259    17899    equipamento    TABLE     �   CREATE TABLE public.equipamento (
    mac character varying(40) NOT NULL,
    marca character varying(50) NOT NULL,
    modelo character varying(50) NOT NULL,
    data_aquisicao date,
    id_localizacao integer,
    ip character varying(40)
);
    DROP TABLE public.equipamento;
       public         heap    postgres    false    4            �            1259    17893    localizacao    TABLE     �   CREATE TABLE public.localizacao (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    id_localizacao integer
);
    DROP TABLE public.localizacao;
       public         heap    postgres    false    4            �            1259    17892    localizacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.localizacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.localizacao_id_seq;
       public          postgres    false    228    4            #           0    0    localizacao_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.localizacao_id_seq OWNED BY public.localizacao.id;
          public          postgres    false    227            �            1259    17843    nivel    TABLE     �   CREATE TABLE public.nivel (
    id integer NOT NULL,
    tipo character varying(20) NOT NULL,
    descricao character varying(100) NOT NULL
);
    DROP TABLE public.nivel;
       public         heap    postgres    false    4            �            1259    17842    nivel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nivel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.nivel_id_seq;
       public          postgres    false    4    216            $           0    0    nivel_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.nivel_id_seq OWNED BY public.nivel.id;
          public          postgres    false    215            �            1259    17944    responsavel_equipamento    TABLE     �   CREATE TABLE public.responsavel_equipamento (
    id_usuario integer NOT NULL,
    mac_equipamento character varying(40) NOT NULL
);
 +   DROP TABLE public.responsavel_equipamento;
       public         heap    postgres    false    4            �            1259    17876    solucao_chamado    TABLE     �   CREATE TABLE public.solucao_chamado (
    id integer NOT NULL,
    id_chamado integer NOT NULL,
    mensagem character varying(200)
);
 #   DROP TABLE public.solucao_chamado;
       public         heap    postgres    false    4            �            1259    17875    solucao_chamado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.solucao_chamado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.solucao_chamado_id_seq;
       public          postgres    false    4    224            %           0    0    solucao_chamado_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.solucao_chamado_id_seq OWNED BY public.solucao_chamado.id;
          public          postgres    false    223            �            1259    17924    switch    TABLE     �   CREATE TABLE public.switch (
    mac_equipamento character varying(40) NOT NULL,
    velocidade character varying(20),
    nro_portas integer
);
    DROP TABLE public.switch;
       public         heap    postgres    false    4            �            1259    17862    telefone_contato    TABLE     \   CREATE TABLE public.telefone_contato (
    id integer NOT NULL,
    num integer NOT NULL
);
 $   DROP TABLE public.telefone_contato;
       public         heap    postgres    false    4            �            1259    17861    telefone_id_seq    SEQUENCE     �   CREATE SEQUENCE public.telefone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.telefone_id_seq;
       public          postgres    false    220    4            &           0    0    telefone_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.telefone_id_seq OWNED BY public.telefone_contato.id;
          public          postgres    false    219            �            1259    17850    usuario    TABLE     �   CREATE TABLE public.usuario (
    nome character varying(50) NOT NULL,
    id integer NOT NULL,
    cpf character varying(14) NOT NULL,
    dt_nasc date,
    id_nivel integer NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false    4            �            1259    17887    usuario_chamado    TABLE     �   CREATE TABLE public.usuario_chamado (
    id_usuario_abriu integer NOT NULL,
    id_chamado integer NOT NULL,
    id_usuario_fechou integer NOT NULL
);
 #   DROP TABLE public.usuario_chamado;
       public         heap    postgres    false    4            �            1259    17849    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    218    4            '           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    217            Z           2604    17872 
   chamado id    DEFAULT     h   ALTER TABLE ONLY public.chamado ALTER COLUMN id SET DEFAULT nextval('public.chamado_id_seq'::regclass);
 9   ALTER TABLE public.chamado ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            \           2604    17896    localizacao id    DEFAULT     p   ALTER TABLE ONLY public.localizacao ALTER COLUMN id SET DEFAULT nextval('public.localizacao_id_seq'::regclass);
 =   ALTER TABLE public.localizacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            W           2604    17846    nivel id    DEFAULT     d   ALTER TABLE ONLY public.nivel ALTER COLUMN id SET DEFAULT nextval('public.nivel_id_seq'::regclass);
 7   ALTER TABLE public.nivel ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            [           2604    17879    solucao_chamado id    DEFAULT     x   ALTER TABLE ONLY public.solucao_chamado ALTER COLUMN id SET DEFAULT nextval('public.solucao_chamado_id_seq'::regclass);
 A   ALTER TABLE public.solucao_chamado ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            Y           2604    17865    telefone_contato id    DEFAULT     r   ALTER TABLE ONLY public.telefone_contato ALTER COLUMN id SET DEFAULT nextval('public.telefone_id_seq'::regclass);
 B   ALTER TABLE public.telefone_contato ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            X           2604    17853 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            r           2606    17918    camera camera_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.camera
    ADD CONSTRAINT camera_pkey PRIMARY KEY (mac_equipamento);
 <   ALTER TABLE ONLY public.camera DROP CONSTRAINT camera_pkey;
       public            postgres    false    231            z           2606    17953 ,   chamado_equipamento chamado_equipamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT chamado_equipamento_pkey PRIMARY KEY (id_chamado, mac_equipamento);
 V   ALTER TABLE ONLY public.chamado_equipamento DROP CONSTRAINT chamado_equipamento_pkey;
       public            postgres    false    235    235            h           2606    17886 "   chamado_ligado chamado_ligado_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT chamado_ligado_pkey PRIMARY KEY (id_chamado, id_chamado_ligado);
 L   ALTER TABLE ONLY public.chamado_ligado DROP CONSTRAINT chamado_ligado_pkey;
       public            postgres    false    225    225            d           2606    17874    chamado chamado_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT chamado_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.chamado DROP CONSTRAINT chamado_pkey;
       public            postgres    false    222            p           2606    17908    computador computador_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.computador
    ADD CONSTRAINT computador_pkey PRIMARY KEY (mac_equipamento);
 D   ALTER TABLE ONLY public.computador DROP CONSTRAINT computador_pkey;
       public            postgres    false    230            v           2606    17938    dvr dvr_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.dvr
    ADD CONSTRAINT dvr_pkey PRIMARY KEY (mac_equipamento);
 6   ALTER TABLE ONLY public.dvr DROP CONSTRAINT dvr_pkey;
       public            postgres    false    233            n           2606    17903    equipamento equipamento_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_pkey PRIMARY KEY (mac);
 F   ALTER TABLE ONLY public.equipamento DROP CONSTRAINT equipamento_pkey;
       public            postgres    false    229            l           2606    17898    localizacao localizacao_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT localizacao_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.localizacao DROP CONSTRAINT localizacao_pkey;
       public            postgres    false    228            ^           2606    17848    nivel nivel_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.nivel
    ADD CONSTRAINT nivel_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.nivel DROP CONSTRAINT nivel_pkey;
       public            postgres    false    216            x           2606    17948 4   responsavel_equipamento responsavel_equipamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT responsavel_equipamento_pkey PRIMARY KEY (id_usuario, mac_equipamento);
 ^   ALTER TABLE ONLY public.responsavel_equipamento DROP CONSTRAINT responsavel_equipamento_pkey;
       public            postgres    false    234    234            f           2606    17881 $   solucao_chamado solucao_chamado_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.solucao_chamado
    ADD CONSTRAINT solucao_chamado_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.solucao_chamado DROP CONSTRAINT solucao_chamado_pkey;
       public            postgres    false    224            t           2606    17928    switch switch_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.switch
    ADD CONSTRAINT switch_pkey PRIMARY KEY (mac_equipamento);
 <   ALTER TABLE ONLY public.switch DROP CONSTRAINT switch_pkey;
       public            postgres    false    232            b           2606    17867    telefone_contato telefone_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.telefone_contato
    ADD CONSTRAINT telefone_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.telefone_contato DROP CONSTRAINT telefone_pkey;
       public            postgres    false    220            j           2606    17891 $   usuario_chamado usuario_chamado_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT usuario_chamado_pkey PRIMARY KEY (id_usuario_abriu, id_chamado, id_usuario_fechou);
 N   ALTER TABLE ONLY public.usuario_chamado DROP CONSTRAINT usuario_chamado_pkey;
       public            postgres    false    226    226    226            `           2606    17855    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    218            �           2606    17919 !   camera camera_macequipamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.camera
    ADD CONSTRAINT camera_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);
 K   ALTER TABLE ONLY public.camera DROP CONSTRAINT camera_macequipamento_fkey;
       public          postgres    false    231    229    4718            �           2606    17909 )   computador computador_macequipamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.computador
    ADD CONSTRAINT computador_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);
 S   ALTER TABLE ONLY public.computador DROP CONSTRAINT computador_macequipamento_fkey;
       public          postgres    false    229    230    4718            �           2606    17939    dvr dvr_macequipamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dvr
    ADD CONSTRAINT dvr_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);
 E   ALTER TABLE ONLY public.dvr DROP CONSTRAINT dvr_macequipamento_fkey;
       public          postgres    false    233    4718    229            }           2606    17959    chamado_ligado fk_idchamado    FK CONSTRAINT        ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);
 E   ALTER TABLE ONLY public.chamado_ligado DROP CONSTRAINT fk_idchamado;
       public          postgres    false    222    4708    225                       2606    17979    usuario_chamado fk_idchamado    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);
 F   ALTER TABLE ONLY public.usuario_chamado DROP CONSTRAINT fk_idchamado;
       public          postgres    false    226    222    4708            �           2606    18014     chamado_equipamento fk_idchamado    FK CONSTRAINT     �   ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT fk_idchamado FOREIGN KEY (id_chamado) REFERENCES public.chamado(id);
 J   ALTER TABLE ONLY public.chamado_equipamento DROP CONSTRAINT fk_idchamado;
       public          postgres    false    235    4708    222            ~           2606    17964 !   chamado_ligado fk_idchamadoligado    FK CONSTRAINT     �   ALTER TABLE ONLY public.chamado_ligado
    ADD CONSTRAINT fk_idchamadoligado FOREIGN KEY (id_chamado_ligado) REFERENCES public.chamado(id);
 K   ALTER TABLE ONLY public.chamado_ligado DROP CONSTRAINT fk_idchamadoligado;
       public          postgres    false    222    4708    225            |           2606    17954    chamado fk_idlocalizacao    FK CONSTRAINT     �   ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);
 B   ALTER TABLE ONLY public.chamado DROP CONSTRAINT fk_idlocalizacao;
       public          postgres    false    222    4716    228            �           2606    17984    localizacao fk_idlocalizacao    FK CONSTRAINT     �   ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);
 F   ALTER TABLE ONLY public.localizacao DROP CONSTRAINT fk_idlocalizacao;
       public          postgres    false    228    228    4716            �           2606    17989    equipamento fk_idlocalizacao    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT fk_idlocalizacao FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);
 F   ALTER TABLE ONLY public.equipamento DROP CONSTRAINT fk_idlocalizacao;
       public          postgres    false    4716    228    229            �           2606    18004 $   responsavel_equipamento fk_idusuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);
 N   ALTER TABLE ONLY public.responsavel_equipamento DROP CONSTRAINT fk_idusuario;
       public          postgres    false    218    234    4704            �           2606    17969 !   usuario_chamado fk_idusuarioabriu    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idusuarioabriu FOREIGN KEY (id_usuario_abriu) REFERENCES public.usuario(id);
 K   ALTER TABLE ONLY public.usuario_chamado DROP CONSTRAINT fk_idusuarioabriu;
       public          postgres    false    226    4704    218            �           2606    17974 "   usuario_chamado fk_idusuariofechou    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_chamado
    ADD CONSTRAINT fk_idusuariofechou FOREIGN KEY (id_usuario_fechou) REFERENCES public.usuario(id);
 L   ALTER TABLE ONLY public.usuario_chamado DROP CONSTRAINT fk_idusuariofechou;
       public          postgres    false    218    226    4704            �           2606    18009 *   responsavel_equipamento fk_mac_equipamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.responsavel_equipamento
    ADD CONSTRAINT fk_mac_equipamento FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);
 T   ALTER TABLE ONLY public.responsavel_equipamento DROP CONSTRAINT fk_mac_equipamento;
       public          postgres    false    234    4718    229            �           2606    18019 &   chamado_equipamento fk_mac_equipamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.chamado_equipamento
    ADD CONSTRAINT fk_mac_equipamento FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);
 P   ALTER TABLE ONLY public.chamado_equipamento DROP CONSTRAINT fk_mac_equipamento;
       public          postgres    false    235    4718    229            �           2606    17929 !   switch switch_macequipamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.switch
    ADD CONSTRAINT switch_macequipamento_fkey FOREIGN KEY (mac_equipamento) REFERENCES public.equipamento(mac);
 K   ALTER TABLE ONLY public.switch DROP CONSTRAINT switch_macequipamento_fkey;
       public          postgres    false    4718    232    229            {           2606    17856    usuario usuario_idnivel_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idnivel_fkey FOREIGN KEY (id_nivel) REFERENCES public.nivel(id);
 F   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idnivel_fkey;
       public          postgres    false    216    218    4702           