--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Debian 12.11-1.pgdg110+1)
-- Dumped by pg_dump version 12.11 (Debian 12.11-1.pgdg110+1)

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
-- Name: genera_correlativo_cert(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.genera_correlativo_cert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.correlativo := (SELECT LPAD(nextval('correlativo_cert_secuencia') :: TEXT, 5, '0') || '-' || date_part('year', now()));
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    creado_por character varying(20),
    modificado_por character varying(20),
    fecha_creacion timestamp with time zone,
    fecha_modificacion timestamp with time zone NOT NULL,
    persona_id integer
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: capacitacion_actaasistencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_actaasistencia (
    id integer NOT NULL,
    creado_por character varying(20),
    modificado_por character varying(20),
    fecha_creacion timestamp with time zone,
    fecha_modificacion timestamp with time zone NOT NULL,
    ruta_acta_pdf character varying(100),
    observacion character varying(250),
    modulo_id integer NOT NULL
);


--
-- Name: capacitacion_actaasistencia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_actaasistencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_actaasistencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_actaasistencia_id_seq OWNED BY public.capacitacion_actaasistencia.id;


--
-- Name: capacitacion_capacitacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_capacitacion (
    id integer NOT NULL,
    creado_por character varying(20),
    modificado_por character varying(20),
    fecha_creacion timestamp with time zone,
    fecha_modificacion timestamp with time zone NOT NULL,
    nombre character varying(400) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    descripcion_horario character varying(250),
    canal_reunion character varying(100),
    beneficiarios character varying(100),
    justificacion character varying(250),
    objetivo text,
    certificacion character varying(250),
    ruta_proyecto_pdf character varying(100),
    observacion character varying(250),
    observacion_revision character varying(250),
    tipo_emision_certificado character varying(45) NOT NULL,
    ambito character varying(25) NOT NULL,
    se_envio_correo boolean NOT NULL,
    estado character varying(25) NOT NULL,
    facultad_id integer
);


--
-- Name: capacitacion_capacitacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_capacitacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_capacitacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_capacitacion_id_seq OWNED BY public.capacitacion_capacitacion.id;


--
-- Name: capacitacion_certemitido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_certemitido (
    id integer NOT NULL,
    creado_por character varying(20),
    modificado_por character varying(20),
    fecha_creacion timestamp with time zone,
    fecha_modificacion timestamp with time zone NOT NULL,
    tipo character varying(45) NOT NULL,
    cargo character varying(25) NOT NULL,
    correlativo character varying(15) NOT NULL,
    estado character varying(25) NOT NULL,
    modulo_id integer NOT NULL,
    persona_id integer NOT NULL
);


--
-- Name: capacitacion_certemitido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_certemitido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_certemitido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_certemitido_id_seq OWNED BY public.capacitacion_certemitido.id;


--
-- Name: capacitacion_detalleasistencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_detalleasistencia (
    id integer NOT NULL,
    fecha date NOT NULL,
    estado character varying(10) NOT NULL,
    acta_asistencia_id integer NOT NULL,
    persona_id integer NOT NULL
);


--
-- Name: capacitacion_detalleasistencia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_detalleasistencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_detalleasistencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_detalleasistencia_id_seq OWNED BY public.capacitacion_detalleasistencia.id;


--
-- Name: capacitacion_equipoproyecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_equipoproyecto (
    id integer NOT NULL,
    cargo character varying(25) NOT NULL,
    capacitacion_id integer NOT NULL,
    persona_id integer NOT NULL
);


--
-- Name: capacitacion_equipoproyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_equipoproyecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_equipoproyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_equipoproyecto_id_seq OWNED BY public.capacitacion_equipoproyecto.id;


--
-- Name: capacitacion_evidencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_evidencia (
    id integer NOT NULL,
    ruta_evidencia_pdf character varying(100),
    descripcion character varying(250) NOT NULL,
    acta_asistencia_id integer NOT NULL
);


--
-- Name: capacitacion_evidencia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_evidencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_evidencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_evidencia_id_seq OWNED BY public.capacitacion_evidencia.id;


--
-- Name: capacitacion_historialrevision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_historialrevision (
    id integer NOT NULL,
    creado_por character varying(20),
    modificado_por character varying(20),
    fecha_creacion timestamp with time zone,
    fecha_modificacion timestamp with time zone NOT NULL,
    estado character varying(25) NOT NULL,
    observacion character varying(250) NOT NULL,
    capacitacion_id integer NOT NULL
);


--
-- Name: capacitacion_historialrevision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_historialrevision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_historialrevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_historialrevision_id_seq OWNED BY public.capacitacion_historialrevision.id;


--
-- Name: capacitacion_historialrevisionconsejo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_historialrevisionconsejo (
    id integer NOT NULL,
    ambito character varying(25) NOT NULL,
    cargo_miembro character varying(25) NOT NULL,
    facultad_id integer,
    persona_id integer NOT NULL,
    revision_id integer NOT NULL
);


--
-- Name: capacitacion_historialrevisionconsejo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_historialrevisionconsejo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_historialrevisionconsejo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_historialrevisionconsejo_id_seq OWNED BY public.capacitacion_historialrevisionconsejo.id;


--
-- Name: capacitacion_modulo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_modulo (
    id integer NOT NULL,
    nombre character varying(400),
    horas_academicas integer NOT NULL,
    temas text,
    se_envio_correo boolean NOT NULL,
    capacitacion_id integer NOT NULL,
    CONSTRAINT capacitacion_modulo_horas_academicas_check CHECK ((horas_academicas >= 0))
);


--
-- Name: capacitacion_modulo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_modulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_modulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_modulo_id_seq OWNED BY public.capacitacion_modulo.id;


--
-- Name: capacitacion_notaparticipante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_notaparticipante (
    id integer NOT NULL,
    resultado character varying(25),
    acta_asistencia_id integer NOT NULL,
    persona_id integer NOT NULL
);


--
-- Name: capacitacion_notaparticipante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_notaparticipante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_notaparticipante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_notaparticipante_id_seq OWNED BY public.capacitacion_notaparticipante.id;


--
-- Name: capacitacion_responsablefirma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capacitacion_responsablefirma (
    id integer NOT NULL,
    tipo_firma character varying(45) NOT NULL,
    capacitacion_id integer NOT NULL,
    firmante_id integer NOT NULL
);


--
-- Name: capacitacion_responsablefirma_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capacitacion_responsablefirma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capacitacion_responsablefirma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capacitacion_responsablefirma_id_seq OWNED BY public.capacitacion_responsablefirma.id;


--
-- Name: correlativo_cert_secuencia; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.correlativo_cert_secuencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: persona_facultad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.persona_facultad (
    id integer NOT NULL,
    codigo character varying(45) NOT NULL,
    nombre character varying(250) NOT NULL
);


--
-- Name: persona_facultad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.persona_facultad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: persona_facultad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.persona_facultad_id_seq OWNED BY public.persona_facultad.id;


--
-- Name: persona_firmante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.persona_firmante (
    id integer NOT NULL,
    ambito character varying(25) NOT NULL,
    firma text NOT NULL,
    facultad_id integer,
    persona_id integer NOT NULL
);


--
-- Name: persona_firmante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.persona_firmante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: persona_firmante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.persona_firmante_id_seq OWNED BY public.persona_firmante.id;


--
-- Name: persona_persona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.persona_persona (
    id integer NOT NULL,
    creado_por character varying(20),
    modificado_por character varying(20),
    fecha_creacion timestamp with time zone,
    fecha_modificacion timestamp with time zone NOT NULL,
    tipo_documento character varying(2) NOT NULL,
    numero_documento character varying(15) NOT NULL,
    sexo character varying(2) NOT NULL,
    nombres character varying(120),
    apellido_paterno character varying(120),
    apellido_materno character varying(120),
    celular character varying(50),
    email character varying(200),
    cargo_miembro character varying(25),
    tipo_persona character varying(25) NOT NULL,
    es_activo boolean NOT NULL,
    facultad_id integer,
    grado_academico character varying(25)
);


--
-- Name: persona_persona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.persona_persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: persona_persona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.persona_persona_id_seq OWNED BY public.persona_persona.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: capacitacion_actaasistencia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_actaasistencia ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_actaasistencia_id_seq'::regclass);


--
-- Name: capacitacion_capacitacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_capacitacion ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_capacitacion_id_seq'::regclass);


--
-- Name: capacitacion_certemitido id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_certemitido ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_certemitido_id_seq'::regclass);


--
-- Name: capacitacion_detalleasistencia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_detalleasistencia ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_detalleasistencia_id_seq'::regclass);


--
-- Name: capacitacion_equipoproyecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_equipoproyecto ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_equipoproyecto_id_seq'::regclass);


--
-- Name: capacitacion_evidencia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_evidencia ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_evidencia_id_seq'::regclass);


--
-- Name: capacitacion_historialrevision id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevision ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_historialrevision_id_seq'::regclass);


--
-- Name: capacitacion_historialrevisionconsejo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevisionconsejo ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_historialrevisionconsejo_id_seq'::regclass);


--
-- Name: capacitacion_modulo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_modulo ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_modulo_id_seq'::regclass);


--
-- Name: capacitacion_notaparticipante id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_notaparticipante ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_notaparticipante_id_seq'::regclass);


--
-- Name: capacitacion_responsablefirma id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_responsablefirma ALTER COLUMN id SET DEFAULT nextval('public.capacitacion_responsablefirma_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: persona_facultad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_facultad ALTER COLUMN id SET DEFAULT nextval('public.persona_facultad_id_seq'::regclass);


--
-- Name: persona_firmante id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_firmante ALTER COLUMN id SET DEFAULT nextval('public.persona_firmante_id_seq'::regclass);


--
-- Name: persona_persona id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_persona ALTER COLUMN id SET DEFAULT nextval('public.persona_persona_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Usuario	6	add_user
22	Can change Usuario	6	change_user
23	Can delete Usuario	6	delete_user
24	Can view Usuario	6	view_user
25	Can add facultad	7	add_facultad
26	Can change facultad	7	change_facultad
27	Can delete facultad	7	delete_facultad
28	Can view facultad	7	view_facultad
29	Can add persona	8	add_persona
30	Can change persona	8	change_persona
31	Can delete persona	8	delete_persona
32	Can view persona	8	view_persona
33	Can add firmante	9	add_firmante
34	Can change firmante	9	change_firmante
35	Can delete firmante	9	delete_firmante
36	Can view firmante	9	view_firmante
37	Can add acta asistencia	10	add_actaasistencia
38	Can change acta asistencia	10	change_actaasistencia
39	Can delete acta asistencia	10	delete_actaasistencia
40	Can view acta asistencia	10	view_actaasistencia
41	Can add capacitacion	11	add_capacitacion
42	Can change capacitacion	11	change_capacitacion
43	Can delete capacitacion	11	delete_capacitacion
44	Can view capacitacion	11	view_capacitacion
45	Can add historial revision	12	add_historialrevision
46	Can change historial revision	12	change_historialrevision
47	Can delete historial revision	12	delete_historialrevision
48	Can view historial revision	12	view_historialrevision
49	Can add modulo	13	add_modulo
50	Can change modulo	13	change_modulo
51	Can delete modulo	13	delete_modulo
52	Can view modulo	13	view_modulo
53	Can add historial revision consejo	14	add_historialrevisionconsejo
54	Can change historial revision consejo	14	change_historialrevisionconsejo
55	Can delete historial revision consejo	14	delete_historialrevisionconsejo
56	Can view historial revision consejo	14	view_historialrevisionconsejo
57	Can add evidencia	15	add_evidencia
58	Can change evidencia	15	change_evidencia
59	Can delete evidencia	15	delete_evidencia
60	Can view evidencia	15	view_evidencia
61	Can add cert emitido	16	add_certemitido
62	Can change cert emitido	16	change_certemitido
63	Can delete cert emitido	16	delete_certemitido
64	Can view cert emitido	16	view_certemitido
65	Can add responsable firma	17	add_responsablefirma
66	Can change responsable firma	17	change_responsablefirma
67	Can delete responsable firma	17	delete_responsablefirma
68	Can view responsable firma	17	view_responsablefirma
69	Can add nota participante	18	add_notaparticipante
70	Can change nota participante	18	change_notaparticipante
71	Can delete nota participante	18	delete_notaparticipante
72	Can view nota participante	18	view_notaparticipante
73	Can add equipo proyecto	19	add_equipoproyecto
74	Can change equipo proyecto	19	change_equipoproyecto
75	Can delete equipo proyecto	19	delete_equipoproyecto
76	Can view equipo proyecto	19	view_equipoproyecto
77	Can add detalle asistencia	20	add_detalleasistencia
78	Can change detalle asistencia	20	change_detalleasistencia
79	Can delete detalle asistencia	20	delete_detalleasistencia
80	Can view detalle asistencia	20	view_detalleasistencia
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, creado_por, modificado_por, fecha_creacion, fecha_modificacion, persona_id) FROM stdin;
1	pbkdf2_sha256$260000$jmcUjTGG3BcgAmhg4NIMPO$Wwj2GR7WRwj381GSf/wvhUHpKMUWLzW8aGZDwezxqBY=	\N	t	admin-ogcu				t	t	2022-07-16 17:37:52.831413+00	\N	\N	2022-07-16 17:37:53.299362+00	2022-07-16 17:37:53.299388+00	\N
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_actaasistencia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_actaasistencia (id, creado_por, modificado_por, fecha_creacion, fecha_modificacion, ruta_acta_pdf, observacion, modulo_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_capacitacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_capacitacion (id, creado_por, modificado_por, fecha_creacion, fecha_modificacion, nombre, fecha_inicio, fecha_fin, descripcion_horario, canal_reunion, beneficiarios, justificacion, objetivo, certificacion, ruta_proyecto_pdf, observacion, observacion_revision, tipo_emision_certificado, ambito, se_envio_correo, estado, facultad_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_certemitido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_certemitido (id, creado_por, modificado_por, fecha_creacion, fecha_modificacion, tipo, cargo, correlativo, estado, modulo_id, persona_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_detalleasistencia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_detalleasistencia (id, fecha, estado, acta_asistencia_id, persona_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_equipoproyecto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_equipoproyecto (id, cargo, capacitacion_id, persona_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_evidencia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_evidencia (id, ruta_evidencia_pdf, descripcion, acta_asistencia_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_historialrevision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_historialrevision (id, creado_por, modificado_por, fecha_creacion, fecha_modificacion, estado, observacion, capacitacion_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_historialrevisionconsejo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_historialrevisionconsejo (id, ambito, cargo_miembro, facultad_id, persona_id, revision_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_modulo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_modulo (id, nombre, horas_academicas, temas, se_envio_correo, capacitacion_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_notaparticipante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_notaparticipante (id, resultado, acta_asistencia_id, persona_id) FROM stdin;
\.


--
-- Data for Name: capacitacion_responsablefirma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.capacitacion_responsablefirma (id, tipo_firma, capacitacion_id, firmante_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	login	user
7	persona	facultad
8	persona	persona
9	persona	firmante
10	capacitacion	actaasistencia
11	capacitacion	capacitacion
12	capacitacion	historialrevision
13	capacitacion	modulo
14	capacitacion	historialrevisionconsejo
15	capacitacion	evidencia
16	capacitacion	certemitido
17	capacitacion	responsablefirma
18	capacitacion	notaparticipante
19	capacitacion	equipoproyecto
20	capacitacion	detalleasistencia
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	persona	0001_initial	2022-07-16 15:48:42.242791+00
2	contenttypes	0001_initial	2022-07-16 15:48:42.308611+00
3	contenttypes	0002_remove_content_type_name	2022-07-16 15:48:42.370311+00
4	auth	0001_initial	2022-07-16 15:48:42.58035+00
5	auth	0002_alter_permission_name_max_length	2022-07-16 15:48:42.605055+00
6	auth	0003_alter_user_email_max_length	2022-07-16 15:48:42.632015+00
7	auth	0004_alter_user_username_opts	2022-07-16 15:48:42.666167+00
8	auth	0005_alter_user_last_login_null	2022-07-16 15:48:42.702298+00
9	auth	0006_require_contenttypes_0002	2022-07-16 15:48:42.723723+00
10	auth	0007_alter_validators_add_error_messages	2022-07-16 15:48:42.764698+00
11	auth	0008_alter_user_username_max_length	2022-07-16 15:48:42.813931+00
12	auth	0009_alter_user_last_name_max_length	2022-07-16 15:48:42.846476+00
13	auth	0010_alter_group_name_max_length	2022-07-16 15:48:42.890287+00
14	auth	0011_update_proxy_permissions	2022-07-16 15:48:42.923102+00
15	auth	0012_alter_user_first_name_max_length	2022-07-16 15:48:42.957613+00
16	login	0001_initial	2022-07-16 15:48:43.309827+00
17	admin	0001_initial	2022-07-16 15:48:43.455325+00
18	admin	0002_logentry_remove_auto_add	2022-07-16 15:48:43.506921+00
19	admin	0003_logentry_add_action_flag_choices	2022-07-16 15:48:43.58056+00
20	capacitacion	0001_initial	2022-07-16 15:48:44.821129+00
21	capacitacion	0002_alter_responsablefirma_tipo_firma	2022-07-16 15:48:44.870494+00
22	capacitacion	0003_alter_modulo_nombre	2022-07-16 15:48:44.92658+00
23	capacitacion	0004_alter_modulo_nombre	2022-07-16 15:48:44.995163+00
24	capacitacion	0005_alter_capacitacion_nombre	2022-07-16 15:48:45.069583+00
25	capacitacion	0006_alter_modulo_temas	2022-07-16 15:48:45.131457+00
26	capacitacion	0007_alter_capacitacion_objetivo	2022-07-16 15:48:45.186161+00
27	persona	0002_persona_grado_academico	2022-07-16 15:48:45.242239+00
28	sessions	0001_initial	2022-07-16 15:48:45.313354+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: persona_facultad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.persona_facultad (id, codigo, nombre) FROM stdin;
1	FC	CIENCIAS
2	FCA	CIENCIAS AGRARIAS
3	FAT	ADMINISTRACION Y TURISMO
4	FIIA	INGENIERIA INDUSTRIAS ALIMENTARIAS
5	FCAM	CIENCIAS DEL AMBIENTE
6	FIMGM	INGENIERIA MINAS GEOLOGIA Y METALURGIA
7	FIC	INGENIERIA CIVIL
8	FCM	CIENCIAS MEDICAS
10	FDCCPP	DERECHO Y CIENCIAS POLITICAS
11	FCSEC	CIENCIAS SOCIALES, EDUCACION Y DE LA COMUNICACION
12	FEC	ECONOMIA Y CONTABILIDAD
\.


--
-- Data for Name: persona_firmante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.persona_firmante (id, ambito, firma, facultad_id, persona_id) FROM stdin;
\.


--
-- Data for Name: persona_persona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.persona_persona (id, creado_por, modificado_por, fecha_creacion, fecha_modificacion, tipo_documento, numero_documento, sexo, nombres, apellido_paterno, apellido_materno, celular, email, cargo_miembro, tipo_persona, es_activo, facultad_id, grado_academico) FROM stdin;
1	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31614036	1	CARLOS ANTONIO	REYES	PAREJA	995982209	creyesp@unasam.edu.pe	\N	participante	t	1	doctorado
2	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31621028	1	MARCO ANTONIO	SILVA	LINDO	970031833	msilval@unasam.edu.pe	\N	participante	t	7	doctorado
3	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678026	2	CONSUELO TERESA	VALENCIA	VERA	943621404	cvalenviav@unasam.edu.pe	\N	participante	t	8	doctorado
4	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44304901	2	REYNA EDELINA	ROBLES	ESPINOZA	954645128	rroblese@unasam.edu.pe	\N	participante	t	3	magister
5	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42142705	1	TELMO PABLO	LOLI	POMA	\N	plolip@hotmail.com	\N	participante	t	3	doctorado
6	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31934852	1	GUILLERMO NAPOLEON	PELAEZ	DIAZ	995119490	gpelaezd@unasam.edu.pe	\N	participante	t	3	magister
7	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40138473	1	WILLIAM RENE	DEXTRE	MARTINEZ	993007106	wdextrem@unasam.edu.pe	\N	participante	t	3	magister
8	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41401992	1	WILLIAN JOSUE	FERNANDEZ	CELESTINO	920671404	wfernandezc@unasam.edu.pe	\N	participante	t	3	doctorado
9	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17977591	1	LORENZO RAFAEL	VALDERRAMA	PLASENCIA	992267379	lvalderramap@unasam.edu.pe	\N	participante	t	3	doctorado
10	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31668274	1	EDWIN HERNAN	RAMIREZ	ASIS	949481470	ehramireza@unasam.edu.pe	\N	participante	t	3	doctorado
11	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17867018	1	DEMETRIO EDILBERTO	ROMERO	TAPIA	986000615	dromerot@unasam.edu.pe	\N	participante	t	3	bachiller
12	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08583186	2	LILIA ROSA	URIBE	POMACHAGUA	976571777	luribep@unasam.edu.pe	\N	participante	t	3	bachiller
13	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31670761	1	ARTURO JAROSLAV	RONDON	NEGLIA	910898891	arondonn@unasam.edu.pe	\N	participante	t	3	magister
14	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07252582	2	MILADY JESUS	CARBAJULCA	MILLA	981671617	mcarbajulcam@unasam.edu.pe	\N	participante	t	3	doctorado
15	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31615303	1	MARCOS ROSAMEL	ESPINOZA	MAGUIÑA	943699172	mespinozam@unasam.edu.pe	\N	participante	t	3	doctorado
16	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31676818	1	JUAN EMILIO	VILCHEZ	CARCAMO	943895663	jvilchezc@unasam.edu.pe	\N	participante	t	3	doctorado
17	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31677232	2	CECILIA BERTHA	ANAYA	LOPEZ	994708948	canayal@unasam.edu.pe	\N	participante	t	3	magister
18	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674656	2	LUZ	BLACIDO	ALVA	942180000	lblacidoa@unasam.edu.pe	\N	participante	t	3	magister
19	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31667280	1	LEOPOLDO ENRIQUE	NEGLIA	VALDERRAMA	992236633	lnegliav@unasam.edu.pe	\N	participante	t	3	magister
20	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31632085	2	EVA DELFINA	ZARZOSA	MARQUEZ	972803060	ezarzosam@unasam.edu.pe	\N	participante	t	3	magister
21	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17993162	1	LUIS AUGUSTO	VILLANUEVA	BENITES	948115243	lvillanuevab@unasam.edu.pe	\N	participante	t	3	doctorado
22	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17917872	1	JORGE LUIS	VIGO	MOYA	988616330	jvigom@unasam.edu.pe	\N	participante	t	3	doctorado
23	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17977546	1	JORGE LUIS	TANDAYPAN	SALAZAR	949419250	jtandaypans@unasam.edu.pe	\N	participante	t	3	doctorado
24	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31614989	2	ANTONIO MERCEDES	HERRERA	SUAREZ	995247357	aherreras@unasam.edu.pe.	\N	participante	t	3	doctorado
25	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31629391	1	FELIX ANTONIO	LIRIO	LOLI	051974500	aliriol@unasam.edu.pe	\N	participante	t	3	doctorado
26	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15625479	1	FRANCISCO JAVIER	CRISTOBAL	GAITAN	993047658	fcristobalg@unasam.edu.pe	\N	participante	t	3	magister
27	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672467	2	MARIA ELENA	GARCIA	FIGUEROA	943640356	mgarciaf@unasam.edu.pe	\N	participante	t	3	bachiller
28	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31649715	1	RICARDO ENRIQUE	TOLEDO	QUIÑONES	959466087	rtoledoq@unasam.edu.pe	\N	participante	t	3	doctorado
29	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31666798	1	JUAN ROOSEVELT	GONZALEZ	LUCERO	996858363	jgonzalezl@unasam.edu.pe	\N	participante	t	3	magister
30	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32035078	2	SILVIA ISABEL	FIGUEROA	QUITO	926595856	sfigueroaq@unasam.edu.pe	\N	participante	t	3	magister
31	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17856598	1	JOHN ALEX	DIAZ	LEDESMA	943247651	jdiazl@unasam.edu.pe	\N	participante	t	3	doctorado
32	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	06025539	1	JOSE JAIME EDMUNDO	DEL CARPIO	GARCIA	976397872	jdelcarpiog@unasam.edu.pe	\N	participante	t	3	magister
33	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31667593	1	ROBERT PERCY	JAMANCA	ANAYA	944487123	ejamancaa@unasam.edu.pe	\N	participante	t	3	magister
34	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17863438	1	CARLOS HUMBERTO	CHUNGA	ANTON	957848888	cchungaa@unasam.edu.pe	\N	participante	t	3	magister
35	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43225206	2	DORIS TATIANA	GONZALES	YANAC	949513131	dgonzalesy@unasam.edu.pe	\N	participante	t	3	magister
36	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31624565	1	HUGO	MENDOZA	VILCAHUAMAN	939265022	hmendozav@unasam.edu.pe	\N	participante	t	2	magister
37	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	09002072	1	EUSEBIO	REYES	HUAMAN	\N	ereyesh@unasam.edu.pe	\N	participante	t	2	bachiller
38	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31622892	1	JUAN FRANCISCO	BARRETO	RODRIGUEZ	943548426	jbarretor@unasam.edu.pe	\N	participante	t	2	doctorado
39	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663774	2	KARINA SOLEDAD	VILCA	MALLQUI	968135521	kvilcam@unasam.edu.pe	\N	participante	t	2	doctorado
40	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663683	1	WALTER	VASQUEZ	CRUZ	943860047	wvasquezc@unasam.edu.pe	\N	participante	t	2	doctorado
41	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32046488	1	CLAY EUSTERIO	PAJUELO	ROLDAN	943989482	cpajueloro@unasam.edu.pe	\N	participante	t	2	bachiller
42	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08432055	1	JUAN MOISES	ROQUE	GONZALEZ	995138836	jroqueg@unasam.edu.pe	\N	participante	t	2	doctorado
43	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31665424	2	XANDRA AMADA	SAAVEDRA	CONTRERAS	944438981	xsaavedrac@unasam.edu.pe	\N	participante	t	2	doctorado
44	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32037289	1	ALEJANDRO ZOROBABEL	TOSCANO	LEYVA	943987654	atoscanol@unasam.edu.pe	\N	participante	t	2	doctorado
45	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31629724	1	GUILLERMO	CASTILLO	ROMERO	932790700	gcastillor@unasam.edu.pe	\N	participante	t	2	doctorado
46	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45894502	2	SANDRA ELIZABETH	SORIA	ALBINAGORTA	948339873	ssoriaa@unasam.edu.pe	\N	participante	t	2	magister
47	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31626134	1	RAYMUNDO PEÑAFORTE	CAMONES	CARRILLO	943558141	rcamonesc@unasam.edu.pe	\N	participante	t	2	doctorado
48	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07332264	1	LUIS LIZARDO	OSCANOA	GAMARRA	992668543	loscanoag@unasam.edu.pe	\N	participante	t	2	doctorado
49	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	09177702	2	NELLY PILAR	CAYCHO	MEDRANO	943137552	ncaychom@unasam.edu.pe	\N	participante	t	2	doctorado
50	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15967865	1	CARLOS ALFONSO	LAOS	OSSA	999955489	claoso@unasam.edu.pe	\N	participante	t	2	doctorado
51	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	25813874	1	FREDY ANIBAL	ALVARADO	ZAMBRANO	943542280	falvaradoz@unasam.edu.pe	\N	participante	t	4	magister
52	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31610576	1	JULIO ARTURO	HENOSTROZA	TORRES	943126825	jhenostrozat@unasam.edu.pe	\N	participante	t	4	doctorado
53	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31651901	1	RAFAEL JAIME	CASTRO	RAMIREZ	942168317	rcastror@unasam.edu.pe	\N	participante	t	4	magister
54	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31620604	2	NORMA ELIZABETH	GAMARRA	RAMIREZ	944425643	ngamarrar@unasam.edu.pe	\N	participante	t	4	doctorado
55	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31671895	1	JUAN FLAVIO	NATIVIDAD	CERNA	948158993	jnatividadc@unasam.edu.pe	\N	participante	t	4	magister
56	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31662856	2	ROSARIO ESTHER	TARAZONA	MINAYA	980254406	etarazonam@unasam.edu.pe	\N	participante	t	4	magister
57	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31628842	2	ROSA ISABEL		ARAUJO	999019637	raraujo@unasam.edu.pe	\N	participante	t	4	bachiller
58	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31651246	1	OSCAR GENARO	RUIZ	CASIMIRO	943943366	oruizc@unasam.edu.pe	\N	participante	t	4	bachiller
59	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32738332	1	JORGE LUIS	MANTILLA	FLORES	\N	jmantillaf@unasam.edu.pe	\N	participante	t	4	magister
60	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08455274	2	YDANIA	ESPINOZA	BARDALES	991821202	yespinozab@unasam.edu.pe	\N	participante	t	4	doctorado
61	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31677906	2	NELLY RAQUEL	CASTRO	VICENTE	950915730	ncastrov@unasam.edu.pe	\N	participante	t	4	doctorado
62	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31615053	2	PAULA ELVIRA	FALCON	ROMERO	947594266	pfalconr@unasam.edu.pe	\N	participante	t	4	magister
63	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42016089	2	LISSET MILAGROS	SOLORZANO	LIRIO	996347943	lsolorzanol@unasam.edu.pe	\N	participante	t	4	magister
64	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31629485	2	EDITH JULIA	ROSALES	CHAVEZ	978943731	erosalesc@unasam.edu.pe	\N	participante	t	4	bachiller
65	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32405873	1	ELEODORO EMILIO	MENDEZ	LA TORRE	943165915	emendezt@unasam.edu.pe	\N	participante	t	4	magister
66	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31633795	1	JORGE ANTONIO	RAMIREZ	RODRIGUEZ	943458159	jramirezr@unasam.edu.pe	\N	participante	t	4	magister
67	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31677905	1	ANGEL NOE	QUISPE	TALLA	996552019	aquispet@unasam.edu.pe	\N	participante	t	4	doctorado
68	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673299	1	ALIPIO ARMANDO	TOLENTINO	GARCIA	945083500	atolentinog@unasam.edu.pe	\N	participante	t	4	magister
69	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	10521345	2	MARIA SALOME	GONZALEZ	LIZARME	970377777	sgonzalesl@unasam.edu.pe	\N	participante	t	4	bachiller
70	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673966	1	JULIO CONSTANTINO	INTI	BARRETO	942961121	jintib@unasam.edu.pe	\N	participante	t	4	magister
71	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17937577	2	FLORMILA VIOLETA	VICUÑA	PEREZ	943614591	fvicunap@unasam.edu.pe	\N	participante	t	1	magister
72	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18028023	1	WILSON EDUARDO	CAMACHO	MAMANI	949822304	wcamachom@unasam.edu.pe	\N	participante	t	1	bachiller
73	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31660089	1	EDSON GILMAR	YUPANQUI	TORRES	999035935	eyupanquit@unasam.edu.pe	\N	participante	t	1	doctorado
74	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18888601	1	WILFREDO JAVIER	VALDIVIA	ROJAS	998277303	wvaldiviar@unasam.edu.pe	\N	participante	t	1	magister
75	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32641515	1	VICTOR MARCELINO	MARTINEZ	MONTES	954029540	vmartinezm@unasam.edu.pe	\N	participante	t	1	magister
76	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17976305	1	RUBEN DARIO	GUZMAN	ALOR	910768321	rguzmana@unasam.edu.pe	\N	participante	t	1	magister
77	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31631824	1	JAIME LUCIANO	SALAZAR	VARGAS	965021313	jsalazarv@unasam.edu.pe	\N	participante	t	1	magister
78	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18037851	1	JULIO EDUARDO	CABRERA	SALVATIERRA	967916543	jcabreras@unasam.edu.pe	\N	participante	t	1	magister
79	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32934418	1	BRANDER LITER	GOMEZ	LEANDRO	\N	bgomezl@unasam.edu.pe	\N	participante	t	1	magister
80	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31649342	2	MYRIAM SOLEDAD	FIGUEROA	CRUZ	942139383	mfigueroac@unasam.edu.pe	\N	participante	t	1	doctorado
81	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17931157	1	SEGUNDO MANUEL	ALVAREZ	CASTILLO	972343520	salvarezc@unasam.edu.pe	\N	participante	t	1	bachiller
82	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	06159567	1	EDGAR PEDRO	OLIVERA	DE LA CRUZ	984998556	eoliverac@unasam.edu.pe	\N	participante	t	1	doctorado
83	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	33343198	2	CARMEN DEL ROSARIO	TAMARIZ	ANGELES	943064166	ctamariz@unasam.edu.pe	\N	participante	t	1	doctorado
84	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17831938	1	FRANCISCO CONSTANTE	FLORES	ROSSO	948960991	flores10francisco@gmail.com	\N	participante	t	1	bachiller
85	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31637915	1	WALTER PERCY	GIRALDO	RAMIREZ	999033081	wgiraldor@unasam.edu.pe	\N	participante	t	1	doctorado
86	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41829056	2	VERONICA CLAUDIA	BRICEÑO	LUNA	\N	vbricenol@unasam.edu.pe	\N	participante	t	1	magister
87	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17872527	1	EINER GUSTAVO	ESPINOZA	MUÑOZ	943422263	eespinozam@unasam.edu.pe	\N	participante	t	1	doctorado
88	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663747	2	IRMA NORMA	MANDUJANO	AYLAS	969278083	imandujanoa@unasam.edu.pe	\N	participante	t	1	magister
89	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32888980	1	ELEUTERIO	RAMIREZ	APOLINARIO	956077669	eramireza@unasam.edu.pe	\N	participante	t	1	doctorado
90	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31633209	1	MAXIMILIANO	CHOY	WONG	954834812	mchoyw@unasam.edu.pe	\N	participante	t	1	magister
91	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672437	1	ALEJANDRO	BARBA	REGALADO	\N	alejonap11@gmail.com	\N	participante	t	1	doctorado
92	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17876092	1	LUIS ALBERTO	MORENO	RUBIÑOS	979626528	lmorenor@unasam.edu.pe	\N	participante	t	1	doctorado
93	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17817265	1	ELMER	GUTIERREZ	LATOCHE	969255385	egutierrezl@unasam.edu.pe	\N	participante	t	1	doctorado
94	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18118654	1	AUSBERTO WILSON	URQUIAGA	VASQUEZ	925946103	aurquiagav@unasam.edu.pe	\N	participante	t	1	magister
95	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31660225	2	EDELL DORIZA	ALIAGA	ZEGARRA	944929658	ealiagaz@unasam.edu.pe	\N	participante	t	1	doctorado
96	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18037620	1	HEBER ELCANO	CHANDUCAS	TANTALEAN	992166990	hchanducast@unasam.edu.pe	\N	participante	t	1	magister
97	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663062	1	MIGUEL ANGEL	RAMIREZ	GUZMAN	986113409	mramirezg@unasam.edu.pe	\N	participante	t	1	doctorado
98	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17815436	1	JOSE ALFREDO	GARCIA	PERALTA	927680702	jgarciap@unasam.edu.pe	\N	participante	t	1	bachiller
99	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31651043	1	PERCY EDUARDO	OLIVERA	GONZALES	945122293	poliverag@unasam.edu.pe	\N	participante	t	1	doctorado
100	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	16502484	2	ANA ESTELA	CARBONEL	NECIOSUP	984548484	acarboneln@unasam.edu.pe	\N	participante	t	1	magister
101	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31649411	1	PABLO EDWIN	CABELLO	CHAVEZ	943784923	pcabelloc@unasam.edu.pe	\N	participante	t	1	magister
102	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32647148	1	FRANCISCO CLAUDIO	LEON	HUERTA	975343434	fleonh@unasam.edu.pe	\N	participante	t	5	bachiller
103	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43848700	1	NINO FRANKLIN	ARAUJO	JAMANCA	990198765	naraujoj@unasam.edu.pe	\N	participante	t	5	bachiller
104	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31671118	1	PRUDENCIO CELSO	HIDALGO	CAMARENA	943203136	phidalgoc@unasam.edu.pe	\N	participante	t	5	doctorado
105	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41748909	1	MIGUEL ANGEL	QUISPE	BARRETO	941936082	mquispeb@unasam.edu.pe	\N	participante	t	5	bachiller
106	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31679040	2	YOLAINA MALI	MACEDO	ROJAS	952219114	ymacedor@unasam.edu.pe	\N	participante	t	5	magister
107	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40800312	2	SILVIA ZENAIDA	ALEGRE	MEZA	962374497	salegrem@unasam.edu.pe	\N	participante	t	5	bachiller
108	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08297522	1	ALFREDO WALTER	REYES	NOLASCO	943869269	areyesnq@unasam.edu.pe	\N	participante	t	5	doctorado
109	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41743942	2	LICETT HEIDY	LEON	CAMONES	930583669	hleonc@unasam.edu.pe	\N	participante	t	5	magister
110	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44511931	1	IVAN  ANTONIO	JARA	ENRIQUEZ	943939846	ijarae@unasam.edu.pe	\N	participante	t	5	magister
111	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31633755	2	FRIDA MONICA	CABALLERO	BEDRIÑANA	980161238	fcaballerob@unasam.edu.pe	\N	participante	t	5	bachiller
112	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31662708	2	YRMA SOLEDAD	MINAYA	SALINAS	981956491	yminayas@unasam.edu.pe	\N	participante	t	5	magister
113	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31650831	1	GREGORIO SANTIAGO	SAENZ	POHL	945957078	gsaenzp@unasam.edu.pe	\N	participante	t	5	magister
114	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44909386	1	EDWIN ANIBAL	LOARTE	CADENAS	\N	eloartec@unasam.edu.pe	\N	participante	t	5	magister
115	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32043297	1	HERACLIO FERNANDO	CASTILLO	PICON	943692464	fcastillp@unasam.edu.pe	\N	participante	t	5	doctorado
116	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	72513051	1	VLADIMIR ALFONSO	LEON	MENACHO	962996042	vladimir.leon@unasam.edu.pe	\N	participante	t	5	magister
117	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31650485	1	PEDRO LIBERATO	VALLADARES	JARA	941923264	pvalladaresj@unasam.edu.pe	\N	participante	t	5	doctorado
118	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31656793	1	CARLOS BORROMEO	POMA	VILLAFUERTE	\N	cpomav@unasam.edu.pe	\N	participante	t	5	magister
119	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44779016	1	MARTIN MIGUEL	HUAMAN	CARRANZA	944970284	mhuamanc@unasam.edu.pe	\N	participante	t	5	magister
120	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32295136	1	MAXIMILIANO	LOARTE	RUBINA	952647082	mloarter@unasam.edu.pe	\N	participante	t	5	doctorado
121	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	06269590	1	MARIO VLADIMIR	LEYVA	COLLAS	955918241	mleyvac@unasam.edu.pe	\N	participante	t	5	magister
122	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31662349	2	ROSARIO ADRIANA	POLO	SALAZAR	971240105	rosario_polo@hotmail.com	\N	participante	t	5	magister
123	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31661054	2	BHENY JANETT	TUYA	CERNA	943100065	btuyac@unasam.edu.pe	\N	participante	t	5	doctorado
124	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32646306	1	ELADIO GUILLERMO	TUYA	CASTILLO	943567202	etuyac@unasam.edu.pe	\N	participante	t	5	doctorado
125	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31656292	1	VICTOR	MANRIQUE	JERONIMO	916266587	gvictorm@unasam.edu.pe	\N	participante	t	5	doctorado
126	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674598	1	EDWIN JULIO	PALOMINO	CADENAS	966550970	epalominoc@unasam.edu.pe	\N	participante	t	5	doctorado
127	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	73143722	2	CHRISTIE CIBELES	DURAN	GARCIA	941275237	cdurang@unasam.edu.pe	\N	participante	t	5	magister
128	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32661682	1	ELVIS JESUS	ESPIRITU	ESPIRITU	945331794	eespiritu@unasam.edu.pe	\N	participante	t	5	magister
129	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31670461	1	RICARDO RAY	VILLANUEVA	RAMIREZ	964547003	rvillanuevar@unasam.edu.pe	\N	participante	t	5	bachiller
130	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31612011	1	ARNULFO	SERNA	ROMAN	996371925	asernar@unasam.edu.pe	\N	participante	t	5	bachiller
131	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31621486	2	ROSA DEIFILIA	RODRIGUEZ	ANAYA	943631542	rrodrigueza@unasam.edu.pe	\N	participante	t	5	magister
132	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40034758	2	JUDITH ISABEL	FLORES	ALBORNOZ	964467006	jfloresa@unasam.edu.pe	\N	participante	t	5	doctorado
133	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40252305	2	PATRICIA LAURA	GAMARRA	TAHUA	975840787	pgamarrat@unasam.edu.pe	\N	participante	t	5	magister
134	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31631504	1	CESAR MANUEL GREGORIO	DAVILA	PAREDES	943082961	cdavilap@unasam.edu.pe	\N	participante	t	5	doctorado
135	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663735	1	KIKO FELIX	DEPAZ	CELI	952223855	kdepazc@unasam.edu.pe	\N	participante	t	5	magister
136	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44720968	1	YONY EDWIN	RODRIGUEZ	MINAYA	959169434	yrodriguezm@unasam.edu.pe	\N	participante	t	5	magister
137	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44752984	2	KATY DAMACIA	MEDINA	MARCOS	995769386	kmedinam@unasam.edu.pe	\N	participante	t	5	magister
275	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31632610	1	LEONEL ALEXANDER	MENACHO	LOPEZ	\N	lealexande5@yahoo.es	\N	participante	t	11	magister
138	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674583	1	CARLOS ARNULFO	DE LA CRUZ	MEJIA	990058090	cdelacruzm@unasam.edu.pe	\N	participante	t	11	bachiller
139	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18160672	1	JUAN CARLO RAFAEL	VASQUEZ	NOVOA	949294780	jvasquezn@unasam.edu.pe	\N	participante	t	11	magister
140	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32983833	1	JORGE AUGUSTO ROGELIO	BARRETO	PAJARES	921177853	abarretop@unasam.edu.pe	\N	participante	t	11	magister
141	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672274	1	GUILLERMO JACINTO	GOMERO	CAMONES	943699439	ggomeroc@unasam.edu.pe	\N	participante	t	11	doctorado
142	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07484147	1	GORI TUMI	ECHEVARRIA	LOPEZ	990217120	gechevarrial@unasam.edu.pe	\N	participante	t	11	magister
143	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45620291	2	DIANA	DIANA DEL CARMEN	PACCHIONI	940797809	dcramirezp@unasam.edu.pe	\N	participante	t	11	magister
144	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	22505255	2	MARIA ANGELICA	MENDEZ	ESPINOZA	947771757	mmendeze@unasam.edu.pe	\N	participante	t	11	magister
145	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17825952	1	MANUEL JESUS	LEZAMA	LEZAMA	976435426	mlezamal@unasam.edu.pe	\N	participante	t	11	magister
146	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40015014	1	EDGAR	HERRERA	TUYA	939975015	eherrerat@unasam.edu.pe	\N	participante	t	11	magister
147	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31612747	1	ERNESTO FILOMENO	NARVAEZ	POMIANO	962669454	enarvaezp@unasam.edu.pe	\N	participante	t	11	bachiller
148	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42126513	1	EDGAR LEONARDO	VASQUEZ	ACOSTA	\N	evasquez@unasam.edu.pe	\N	participante	t	11	magister
149	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15591781	1	LUIS FERNANDO	QUINTEROS	NICHO	970427179	lquinterosn@unasam.edu.pe	\N	participante	t	11	bachiller
150	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40855791	1	FREDY OSWALDO	LOLI	NATIVIDAD	943646157	flolin@unasam.edu.pe	\N	participante	t	11	magister
151	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605447	1	FELIX MARCELINO	MILLA	HUANE	941960077	fmillah@unasam.edu.pe	\N	participante	t	11	magister
152	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31654941	1	JAIME TEODORICO	DEXTRE	RODRIGUEZ	943668466	jdextrer@unasam.edu.pe	\N	participante	t	11	magister
153	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18220262	1	JORGE ANTONIO	GAMBOA	VELASQUEZ	991992454	jgamboav@unasam.edu.pe	\N	participante	t	11	magister
154	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32972750	1	JOSE	YOVERA	SALDARRIAGA	968121077	jyoveras@unasam.edu.pe	\N	participante	t	11	doctorado
155	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31611924	1	FRANCISCO ISMAEL	NEYRA	ROJAS	943220370	fneyrar@unasam.edu.pe	\N	participante	t	11	magister
156	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31681128	1	JIM LEOPOLDO	MONTALVO	CARDENAS	943649285	jmontalvoc@unasam.edu.pe	\N	participante	t	11	magister
157	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42211756	1	ILDER	CRUZ	MOSTACERO	948345399	icruzm@unasam.edu.pe	\N	participante	t	11	magister
158	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43626476	1	EFRAIN	VIDAL	ESPINOZA	947466199	evidale@unasam.edu.pe	\N	participante	t	11	magister
159	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32805955	1	ARNALDO JUSTO	CASTILLO	GARCIA	944617752	jcastillog@unasam.edu.pe	\N	participante	t	11	magister
160	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17811356	1	CESAR AUGUSTO	SERNA	LAMAS	959051777	csernal@unasam.edu.pe	\N	participante	t	11	magister
161	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	10268692	1	SEGUNDO	ARMAS	CASTAÑEDA	969135397	sarmasc@unasam.edu.pe	\N	participante	t	11	magister
162	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40322672	1	LUIS GUSTAVO	MORACHIMO	MONTES	953857903	lmorachimom@unasam.edu.pe	\N	participante	t	11	doctorado
163	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663640	1	EDGAR REINALDO	MENA	SANCHEZ	966673519	emenas@unasam.edu.pe	\N	participante	t	11	magister
164	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40779126	1	ADIB ISMAEL	VILLAR	CARDENAS	\N	ismaelvillar1980@gmail.com	\N	participante	t	11	bachiller
165	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15676742	1	JOSE REYNALDO	SALVATIERRA	ROSALES	986818054	jsalvatierrar@unasam.edu.pe	\N	participante	t	12	bachiller
166	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31650730	1	SATURNINO ALBERTO	MINAYA	CHAVEZ	949490612	sminayac@unasam.edu.pe	\N	participante	t	12	doctorado
167	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31624699	1	CERAFIN PRIMITIVO	TOLEDO	CENA	995651368	ctoledoc@unasam.edu.pe	\N	participante	t	12	doctorado
168	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40581758	2	JUSTINA MARITZA	SAENZ	MELGAREJO	931388803	msaenzm@unasam.edu.pe	\N	participante	t	12	magister
169	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31657913	1	ALEJANDRO EUSTAQUIO	MACEDO	HURTADO	943972731	amacedoh@unasam.edu.pe	\N	participante	t	12	doctorado
170	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41515856	2	MIRIAM NAYDA	PALACIOS	PALACIOS	\N	miriamnayda@gmail.com	\N	participante	t	12	magister
171	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40526835	1	OSCAR GUILLERMO	ELLACURIAGA	SAN MARTIN	 96713915	oellacuriagasam@unasam.edu.pe	\N	participante	t	12	doctorado
172	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15853797	1	JUAN ALEJANDRO	MURGA	ORTIZ	992927713	jmurgao@unasam.edu.pe	\N	participante	t	12	doctorado
173	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32387892	1	JAVIER PEDRO	HIDALGO	MEJIA	943677447	jhidalgom@unasam.edu.pe	\N	participante	t	12	doctorado
174	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08696327	2	JOSE ROSARIO	RUIZ	VERA	943892613	jruizv@unasam.edu.pe	\N	participante	t	12	doctorado
175	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31624938	1	ABRAHAN	CASTILLO	ROMERO	990240203	acastillor@unasam.edu.pe	\N	participante	t	12	doctorado
176	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17828605	1	WILLIAM ZACARIAS	OJEDA	PEREDA	943407581	wojedap@unasam.edu.pe	\N	participante	t	12	doctorado
177	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673265	1	WALTER	MEDRANO	ACUÑA	973468459	wmedranoa@unasam.edu.pe	\N	participante	t	12	doctorado
178	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31675474	1	MIRKO VLADIMIR	CACHA	ALVARADO	962923539	mcachaa@unasam.edu.pe	\N	participante	t	12	doctorado
179	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31601913	1	LEONCIO FLORENTINO	COCHACHIN	SANCHEZ	\N	lcochachins@unasam.edu.pe	\N	participante	t	12	magister
180	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41163457	1	YENG DENNIS	CASTILLO	TORRE	985769275	ycastillot@unasam.edu.pe	\N	participante	t	12	magister
181	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41082001	2	WENDY JULY	ALLAUCA	CASTILLO	975466236	wallaucac@unasam.edu.pe	\N	participante	t	12	doctorado
182	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31604193	1	JORGE ALEXANDER	ROJAS	VEGA	943346393	jrojas@unasam.edu.pe	\N	participante	t	12	doctorado
183	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32641486	1	LUCIANO FERMIN	TINOCO	PALACIOS	941967016	ltinocop@unasam.edu.pe	\N	participante	t	12	doctorado
184	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32128791	2	ROSA IMELDA	RODRIGUEZ	RODRIGUEZ	943280271	rrodriguezr@unasam.edu.pe	\N	participante	t	12	magister
185	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31614557	2	DOMINGA	AYVAR	CUELLAR	942190248	dayvarc@unasam.edu.pe	\N	participante	t	12	doctorado
186	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40055999	2	URSULA ROSALIA	ANICETO	NORABUENA	943801665	uaniceton@unasam.edu.pe	\N	participante	t	10	magister
187	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31657673	1	SERAPIO PETERSON	ROSALES	LEON	958813847	srosalesl@unasam.edu.pe	\N	participante	t	10	magister
188	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31658643	1	LUIS WILFREDO	ROBLES	TREJO	943631567	lrobles@unasam.edu.pe	\N	participante	t	10	doctorado
189	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	09229497	1	SEGUNDO	PENAS	SANDOVAL	\N	segpensan@hotmail.com	\N	participante	t	10	magister
190	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42724409	1	ARMANDO	CORAL	RODRIGUEZ	998563379	acoralr@unasam.edu.pe	\N	participante	t	10	magister
191	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40942217	2	JACKELINE JENNIFER	ESTELITA	SALAZAR	932463043	jjestelitas@unasam.edu.pe	\N	participante	t	10	magister
192	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41127687	1	YUL ALEXANDER	NEIRE	ROBLES	953653688	yneirer@unasam.edu.pe	\N	participante	t	10	magister
193	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42946564	1	PEDRO	RIMAC	MENDEZ	953921681	primacm@unasam.edu.pe	\N	participante	t	10	magister
194	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31664942	2	GINA HAYDEE	GONZALES	LUNA	943806541	ggonzalesl@unasam.edu.pe	\N	participante	t	10	magister
195	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31667497	1	DEMETRIO MOISES	ORDEANO	VARGAS	959029006	dordeanov@unasam.edu.pe	\N	participante	t	10	magister
196	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31612177	2	LUCIA	BULEJE	AYALA	988544550	lbulejea@unasam.edu.pe	\N	participante	t	10	magister
197	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31608353	1	JESUS EDMUNDO	HENOSTROZA	SUAREZ	979031022	jhenostrozas@unasam.edu.pe	\N	participante	t	10	bachiller
198	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31653214	1	RICARDO ROBINSON	SANCHEZ	ESPINOZA	928392755	rsanchezesp@unasam.edu.pe	\N	participante	t	10	doctorado
199	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43525613	2	KATHERINE MONICA	CASTRO	MENACHO	950061184	kcastrom@unasam.edu.pe	\N	participante	t	10	magister
200	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31624792	1	ARMANDO	CORAL	ALEGRE	943972820	acorala@unasam.edu.pe	\N	participante	t	10	bachiller
201	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31652633	2	LOLA AURORA	SOLORZANO	VIDAL	943030073	lsolorzanov@unasam.edu.pe	\N	participante	t	10	magister
202	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32265056	1	VICTOR EFRAIN	FLORES	LEIVA	943797690	vflorel@unasam.edu.pe	\N	participante	t	10	magister
203	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672889	1	FIDEL MISAEL	REYES	NORABUENA	943488400	freyesn@unasam.edu.pe	\N	participante	t	10	magister
204	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	70119403	1	FABEL BERNABE	ROBLES	ESPINOZA	962092200	froblese@unasam.edu.pe	\N	participante	t	10	doctorado
205	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08539143	1	PEPE ZENOBIO	MELGAREJO	BARRETO	943624440	pmelgarejob@unasam.edu.pe	\N	participante	t	10	magister
206	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18147605	2	FANY SOLEDAD	VERA	GUTIERREZ	979570238	fverag@unasam.edu.pe	\N	participante	t	10	bachiller
207	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673886	1	JOSE ANTONIO	BECERRA	RUIZ	975353136	jbeccerrar@unasam.edu.pe	\N	participante	t	10	doctorado
208	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32040402	1	JULIO CESAR	PALA	GARCIA	944492021	jpalag@unasam.edu.pe	\N	participante	t	10	magister
209	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674266	1	ELMER	ROBLES	BLACIDO	940226692	eroblesb@unasam.edu.pe	\N	participante	t	10	doctorado
210	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08606896	1	ELEAZAR MANUEL	ESPINOZA	VALVERDE	938211995	eespinozav@unasam.edu.pe	\N	participante	t	10	magister
211	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31632815	1	FLORENTINO	OBREGON	OBREGON	948334490	fobregono@unasam.edu.pe	\N	participante	t	10	magister
212	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41715034	1	RONALD REGAN	LOPEZ	JULCA	961668022	rlopezj@unasam.edu.pe	\N	participante	t	10	magister
213	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673831	2	PATRICIA AMALIA	GAMARRA	BENITES	944694776	pgamarrab@unasam.edu.pe	\N	participante	t	10	bachiller
214	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672735	1	FELIX CLAUDIO	JULCA	GUERRERO	938347062	fjulca@unasam.edu.pe	\N	participante	t	10	doctorado
215	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672815	1	CARLOS ENRIQUE	FERNANDEZ	LOPEZ	969029052	cfernandezl@unasam.edu.pe	\N	participante	t	12	doctorado
216	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32645194	1	OSCAR	DEXTRE	AGUILAR	966840320	odextrea@unasam.edu.pe	\N	participante	t	12	bachiller
217	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605570	1	JORGE TEOFILO	MANRIQUE	CACERES	943933446	jmanriquec@unasam.edu.pe	\N	participante	t	12	doctorado
218	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07241747	1	DARIO	VARGAS	ARCE	975422725	tvargasa@unasam.edu.pe	\N	participante	t	12	bachiller
219	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17998368	1	ANGEL HEBERT	PELAEZ	CRUZADO	943677685	angelpc@unasam.edu.pe	\N	participante	t	12	doctorado
220	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15735435	1	EDGAR RUBEN	BARZOLA	LA CRUZ	943089034	ebarzolac@unasam.edu.pe	\N	participante	t	12	magister
221	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41309454	2	KARINA DEL PILAR	BELTRAN	CASTILLO	996824812	kbeltranc@unasam.edu.pe	\N	participante	t	12	magister
222	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42065936	1	ADRIAN EUGENIO	PALMADERA	MILLA	949652427	apalmaderam@unasam.edu.pe	\N	participante	t	12	magister
223	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31621889	1	OSCAR GUILLERMO	CAMONES	ROMERO	959072985	ocamonesr@unasam.edu.pe	\N	participante	t	12	doctorado
224	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31653568	1	ANTONIO PEREGRINO	HUAMAN	OSORIO	900609881	ahuamano@unasam.edu.pe	\N	participante	t	12	magister
225	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45748572	1	SEBASTIAN ROLANDO	AYALA	BEAS	930979718	ayalabeas@gmail.com	\N	participante	t	12	magister
226	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31677424	1	LUIS ENRIQUE	NATIVIDAD	CERNA	945905456	lnatividadc@unasam.edu.pe	\N	participante	t	12	doctorado
227	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605727	1	ARMANDO	PASCO	AMES	996130096	apascoa@unasam.edu.pe	\N	participante	t	12	doctorado
228	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31602879	1	JUAN ALEJANDRO	CASTRO	SOTELO	943559748	jcastros@unasam.edu.pe	\N	participante	t	12	doctorado
229	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663393	1	MILTON CESAR	GIRALDO	MENDEZ	938269632	mgiraldom@unasam.edu.pe	\N	participante	t	12	magister
230	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41092036	1	JOHN JOSEPH	TARAZONA	JIMENEZ	943403647	jtarazonaj@unasam.edu.pe	\N	participante	t	12	magister
231	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31615317	1	FRANCISCO ENRIQUE	HUERTA	BERRIOS	994504161	fhuertab@unasam.edu.pe	\N	participante	t	12	doctorado
232	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31682533	1	LALO LEONARDO	HUAMAN	MAGUIÑA	943626897	lhuamanm@unasam.edu.pe	\N	participante	t	12	magister
233	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17808985	1	JOSE LUIS	RODRIGUEZ	HERRERA	965468398	jrodriguezh@unasam.edu.pe	\N	participante	t	12	bachiller
234	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31633935	1	EDGARD	BRITO	GONZALES	949824875	ebrito@unasam.edu.pe	\N	participante	t	12	doctorado
235	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32021885	1	JORGE MARCEL	CASTILLO	PICON	976409693	jcastillop@unasam.edu.pe	\N	participante	t	12	doctorado
236	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31615750	1	JOSE ENRIQUE	SIFUENTES	STRATTI	\N	jsifuentess@unasam.edu.pe	\N	participante	t	12	magister
237	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674254	1	RICHARD DEMETRIO	PASCO	AMES	943161713	pascorichard@hotmail.com	\N	participante	t	12	doctorado
238	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45802401	1	JAMES MANOLO	ALVARADO	TOLENTINO	944464967	j.alvarado@outlook.com.pe	\N	participante	t	12	bachiller
239	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	47651769	2	PIERINA CATHERINE	NORABUENA	TREJO	964994761	pnorabuenat@unasam.edu.pe	\N	participante	t	12	magister
240	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	70115588	2	INGRID GERALDINE	FIGUEROA	DELGADO	947602519	ifigueroad@unasam.edu.pe	\N	participante	t	12	magister
241	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31656388	1	ROGER MANUEL	RURUSH	ASENCIO	943693374	rrurusha@unasam.edu.pe	\N	participante	t	12	doctorado
242	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	00120205	1	ROMEL ALMANZOR	ROJAS	MELGAREJO	948296960	rrojasm@unasam.edu.pe	\N	participante	t	12	bachiller
243	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41035111	2	GESELLA KARIN	DE LA CRUZ	INCHICAQUI	969247060	gesdelacruz@gmail.com	\N	participante	t	12	magister
244	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17828136	1	VICTOR RUFINO	FLORES	VALVERDE	949493735	vfloresv@unasam.edu.pe	\N	participante	t	12	magister
245	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40659884	1	WUALTER ALFREDO	NEIRA	JIMENEZ	972845709	wneiraj@unasam.edu.pe	\N	participante	t	12	magister
246	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43020912	2	BETSABE MAGALI	YAÑAC	HUERTA	949648136	byanach@unasam.edu.pe	\N	participante	t	11	magister
247	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31661584	1	NOE EUSEBIO	MENACHO	JAVIER	921220592	nmenachoj@unasam.edu.pe	\N	participante	t	11	bachiller
248	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40544154	2	YVETT NATHALY	GONZALES	ORTIZ	968456399	ygonzaleso@unasam.edu.pe	\N	participante	t	11	magister
249	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42234160	1	ALEX	ROSALES	BEAS	942668108	arosalesb@unasam.edu.pe	\N	participante	t	11	magister
250	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15299200	1	BEDER ORESTES	ROSALES	LIBIA	980273521	brosalesl@unasam.edu.pe	\N	participante	t	11	magister
251	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31760096	1	CESAR	BRITO	MALLQUI	976039429	cbritom@unasam.edu.pe	\N	participante	t	11	magister
252	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44601011	2	MADELEY JANET	KAQUI	VALENZUELA	\N	mkaquiv@unasam.edu.pe	\N	participante	t	11	magister
253	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31652707	1	ALBERTO	HUAMANI	GALLO	943686082	ahuamanig@unasam.edu.pe	\N	participante	t	11	doctorado
254	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31657994	1	VIDAL NOLBERT	GUERRERO	TAMARA	996521530	vguerrerot@unasam.edu.pe	\N	participante	t	11	magister
255	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674517	2	GLORIA BEATRIZ	CASTRO	PALMA	943823448	gcastrop@unasam.edu.pe	\N	participante	t	11	magister
256	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32647927	1	TIMOTEO	HUERTA	BERRIOS	924486568	thuertab@unasam.edu.pe	\N	participante	t	11	bachiller
257	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31668523	2	FIORELLA	DEL CASTILLO	PALACIOS	943030631	fdelcastillop@unasam.edu.pe	\N	participante	t	11	magister
258	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31662476	1	JULIO CESAR	BUSTAMANTE	CABELLO	971159848	jcbustamantec@unasam.edu.pe	\N	participante	t	11	doctorado
259	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673912	1	ROLANDO PATRICIO	ROCA	ZARZOZA	938386070	rrocaz@unasam.edu.pe	\N	participante	t	11	magister
260	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31618186	1	CARLOS JULIAN	TOLEDO	QUIÑONES	948567368	ctoledoq@unasam.edu.pe	\N	participante	t	11	magister
261	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31676536	2	LAURA ROSA	NIVIN	VARGAS	941860618	lnivin@unasam.edu.pe	\N	participante	t	11	doctorado
262	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41172013	2	SALLY CHRIS	CHAVEZ	GARCIA	965466657	scchavezg@unasam.edu.pe	\N	participante	t	11	magister
263	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678144	1	RUDECINDO ALBINO	PENADILLO	LIRIO	980537877	rpenadillol@unasam.edu.pe	\N	participante	t	11	doctorado
264	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45028012	1	ALEJANDRO GIANCARLO	MAUTINO	GUILLEN	932995754	amautinog@unasam.edu.pe	\N	participante	t	11	bachiller
265	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17867114	1	FELIX JULIAN	VALERIO	HARO	923368293	fvalerioh@unasam.edu.pe	\N	participante	t	11	magister
266	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31622977	2	RUBY ORIETTA	HUERTA	GUEVARA	979831004	rhuertag@unasam.edu.pe	\N	participante	t	11	magister
267	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	16174469	2	RUDY	MEDINA	BEDON	980486667	rmedinabe@unasam.edu.pe	\N	participante	t	11	magister
268	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43902755	1	DANTE RODRIGO	BARRAZA	URBANO	970305996	dbarrazau@unasam.edu.pe	\N	participante	t	11	magister
269	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	09606017	1	EDINSON	MARQUEZ	TREJO	958848748	emarquezt@unasam.edu.pe	\N	participante	t	11	magister
270	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44655181	1	MERLIN	DE LA CRUZ	HUAYANAY	945542009	mdelacruzh@unasam.edu.pe	\N	participante	t	11	magister
271	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31667800	2	MARIA ROSARIO	MENDOZA	ALVA	943782227	rmendozaa@unasam.edu.pe	\N	participante	t	11	magister
272	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32762465	1	VICTOR MISAEL	ZEGARRA	CHAUCA	943844466	vzegarrac@unasam.edu.pe	\N	participante	t	11	magister
273	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31656844	1	ISAAC JONATAN	MORALES	CERNA	966184141	imoralesc@unasam.edu.pe	\N	participante	t	11	bachiller
274	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674253	1	WILDER AGUSTIN	CAURURO	SANCHEZ	938735247	wcaururos@unasam.edu.pe	\N	participante	t	11	bachiller
276	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17997596	1	SEGUNDO ANTONIO	CASTRO	GARCIA	941678490	scastrog@unasam.edu.pe	\N	participante	t	11	bachiller
277	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31619094	1	OSCAR ESTEBAN	ROLDAN	ROSALES	969391340	oroldanr@unasam.edu.pe	\N	participante	t	11	magister
278	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40718549	1	ELING LEVINGSTONE	CAMONES	BAZAN	957893431	ecamonesb@unasam.edu.pe	\N	participante	t	11	magister
279	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31768910	1	VIRGILIO EUSEBIO	ONCOY	LUNA	976204418	voncoyl@unasam.edu.pe	\N	participante	t	11	magister
280	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31612440	2	DANY MARITZA	PAREDES	AYRAC	948507574	dparedesa@unasam.edu.pe	\N	participante	t	11	doctorado
281	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42393524	2	LIZETH ELIANA	TERRY	TORRES	902711039	eterryt@unasam.edu.pe	\N	participante	t	11	doctorado
282	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17906039	2	RUFA	OLORTEGUI	MARIÑO	949456004	rolorteguim@unasam.edu.pe	\N	participante	t	11	magister
283	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31630894	1	MACEDONIO CLEMENTE	VILLAFAN	BRONCANO	949456000	mvillafanb@unasam.edu.pe	\N	participante	t	11	magister
284	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31624324	1	JUAN DE SAHAGUN	HILARIO	GARCIA	948775049	jhilariog@unasam.edu.pe	\N	participante	t	11	doctorado
285	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15845434	1	JESUS MANUEL	MORE	LOPEZ	945809081	jmorel@unasam.edu.pe	\N	participante	t	11	doctorado
286	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	27249209	2	VILMA ELIZABETH	HUAMAN	JULON	950128989	vhuamanj@unasam.edu.pe	\N	participante	t	11	magister
287	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	33264294	2	BERTHA	GUZMAN	AVALOS	924248937	bguzmana@unasam.edu.pe	\N	participante	t	11	magister
288	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31675145	1	WALTER ALFREDO	ZANABRIA	PEREZ	948774012	wzanabriap@unasam.edu.pe	\N	participante	t	11	magister
289	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31628429	2	BERTHA	LOPEZ	CRUZ	951681044	blopeza@unasam.edu.pe	\N	participante	t	11	magister
290	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678789	1	ENRIQUE CAMILO	HUAMAN	CELMI	978299740	ehuamanc@unasam.edu.pe	\N	participante	t	11	doctorado
291	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31620546	2	JULIA ISABEL	ZAMBRANO	GUIMARAY	948901632	jzambranog@unasam.edu.pe	\N	participante	t	8	doctorado
292	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15643170	2	URSULA	LEZAMETA	BLAS	987550712	ulezametab@unasam.edu.pe	\N	participante	t	8	doctorado
293	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17917008	2	SILVIA ELIZABET	REYES	NARVAEZ	961941969	sreyesn@unasam.edu.pe	\N	participante	t	8	doctorado
294	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678229	2	VERONICA SHIRLEY	ALBERTO	VERAMENDI	954669575	valbertov@unasam.edu.pe	\N	participante	t	8	magister
295	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	26690330	2	VIRGINIA FELICINDA	GALLARDO	GARCIA	930568703	vgallardog@unasam.edu.pe	\N	participante	t	8	magister
296	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	09902720	2	NELI ROSARIO	REGALADO	OLIVARES	949790390	nregaladoo@unasam.edu.pe	\N	participante	t	8	magister
297	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	26678730	1	EMILIO ALEJANDRO	GUILLERMO	FELIPE	953525057	eguillermof@unasam.edu.pe	\N	participante	t	8	bachiller
298	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31655871	2	RUTH LYDA	LUGO	VILLAFANA	\N	ruthlugovi@hotmail.com	\N	participante	t	8	magister
299	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43725102	2	OLGA	RUPAY	NOLASCO	943040805	orupayn@unasam.edu.pe	\N	participante	t	8	magister
300	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31629117	2	SOLEDAD	RAMOS	SOTO	957941155	sramoss@unasam.edu.pe	\N	participante	t	8	magister
301	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31682699	1	ANIBAL EDWIN	MINAYA	SERNA	943619235	aminayas@unasam.edu.pe	\N	participante	t	8	magister
302	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08498044	2	EUFRASIA	ORIUNDO	RAMOS	956696008	eoriundor@unasam.edu.pe	\N	participante	t	8	doctorado
303	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	22243915	2	ELSA GABRIELA	GONZALES	TAPIA	967668227	egonzalest@unasam.edu.pe	\N	participante	t	8	magister
304	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40033774	2	GINA DOMINGA	MENDOZA	RAMIREZ	951485827	gmendozar@unasam.edu.pe	\N	participante	t	8	magister
305	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40206523	2	ROCIO DEL PILAR MERCEDES	PAJUELO	VILLARREAL	937504152	rpajuelov@unasam.edu.pe	\N	participante	t	8	doctorado
306	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32404125	1	JESUS VICTOR	ZUÑIGA	HUERTA	954458260	jzunigah@unasam.edu.pe	\N	participante	t	8	doctorado
307	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674771	2	BIBIANA MARIA	LEON	HUERTA	939671731	bleonh@unasam.edu.pe	\N	participante	t	8	doctorado
308	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42796261	2	SOLEDAD VERONICA	PATRICIO	AYALA	985433038	spatricioa@unasam.edu.pe	\N	participante	t	8	magister
309	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673035	2	ROSA DEL PILAR EFIGENIA	ATOCHE	BENAVIDES	987706201	ratocheb@unasam.edu.pe	\N	participante	t	8	magister
310	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40471447	2	KARINN	JAIMES	NEGLIA	965823289	kjaimesn@unasam.edu.pe	\N	participante	t	8	magister
311	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31661132	2	MAGALY NACY	CAMINO	SANCHEZ	953913934	mcaminos@unasam.edu.pe	\N	participante	t	8	bachiller
312	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15676817	2	MARTINA ODILIA	JULCA	LAZARO	976168007	mjulcal@unasam.edu.pe	\N	participante	t	8	magister
313	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08675980	2	LLERME	NUÑEZ	ZARAZU	932267978	llnunezz@unasam.edu.pe	\N	participante	t	8	doctorado
314	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31676331	1	HERNAN ROLANDO	VEGA	MEJIA	943835608	hvegam@unasam.edu.pe	\N	participante	t	1	magister
315	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	46121900	1	ALEX	DE LA CRUZ	HUAYANAY	926785558	adelacruzh@unasam.edu.pe	\N	participante	t	1	magister
316	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31659531	1	HUGO WALTER	MALDONADO	LEYVA	943888398	hmaldonadol@unasam.edu.pe	\N	participante	t	1	magister
317	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18117012	1	WALTER ALEJANDRO	VARELA	ROJAS	943333089	wvarelar@unasam.edu.pe	\N	participante	t	1	doctorado
318	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17848381	1	JORGE LUIS	LLANOS	TIZNADO	953521336	jllanost@unasam.edu.pe	\N	participante	t	1	magister
319	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45877543	2	ELIZABETH FLOR	ZAMBRANO	LAZARO	996591373	ezambranol@unasam.edu.pe	\N	participante	t	1	magister
320	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17877521	1	LUIS ELMER	ANGULO	CABANILLAS	942165306	languloc@unasam.edu.pe	\N	participante	t	1	doctorado
321	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	80194557	1	EDWIN JOHNY	ASNATE	SALAZAR	970942865	edwin_johny@unasam.edu.pe	\N	participante	t	1	doctorado
322	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07350313	1	FERNANDO RAUL	ARCE	ZUÑIGA	942972007	farcez@unasam.edu.pe	\N	participante	t	1	magister
323	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41155549	2	LOURDES LIZ	HUAMAN	ROMERO	943803626	lhuamanr@unasam.edu.pe	\N	participante	t	1	magister
324	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18106108	2	MARIA LUISA	MEDINA	GUTIERREZ	966935446	mmedinag@unasam.edu.pe	\N	participante	t	1	magister
325	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17824554	1	ANGEL	MENDOZA	LOPEZ	943225752	amendozal@unasam.edu.pe	\N	participante	t	1	doctorado
326	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605888	1	MARIO CIRILO	VILLAFUERTE	VICENCIO	943489947	mvillafuertev@unasam.edu.pe	\N	participante	t	1	doctorado
327	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45259683	1	EMERSON DAMIAN	NORABUENA	FIGUEROA	900922986	enorabuenaf@unasam.edu.pe	\N	participante	t	1	magister
328	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41493243	1	ROGER PEDRO	NORABUENA	FIGUEROA	968850116	rnorabuenaf@unasam.edu.pe	\N	participante	t	1	doctorado
329	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17851842	1	DANTE ELMER	SANCHEZ	RODRIGUEZ	935219303	dsanchezr@unasam.edu.pe	\N	participante	t	1	doctorado
330	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18879677	2	ROSA	VILCHEZ	VASQUEZ	943603221	rvilchezv@unasam.edu.pe	\N	participante	t	1	doctorado
331	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42289816	1	DENIS LEONOR	MENDOZA	RIVAS	973969010	dmendozar@unasam.edu.pe	\N	participante	t	1	magister
332	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31655520	1	PEDRO ALEJANDRO	TINOCO	GONZALEZ	943660282	ptinocog@unasam.edu.pe	\N	participante	t	2	bachiller
333	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31650585	1	EUGENIO JULIAN	MEJIA	ZUÑIGA	945390430	emejiaz@unasam.edu.pe	\N	participante	t	2	magister
334	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32030567	1	PEDRO ALEJANDRO	COLONIA	CERNA	943790444	pcoloniac@unasam.edu.pe	\N	participante	t	2	doctorado
335	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31609928	1	TORIBIO MARCOS	REYES	RODRIGUEZ	950457248	treyesr@unasam.edu.pe	\N	participante	t	2	doctorado
336	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31680721	1	REMO CRISANTO	BAYONA	ANTUNEZ	943913411	rbayonaa@unasam.edu.pe	\N	participante	t	2	magister
337	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672306	1	FIDEL GREGORIO	APARICIO	ROQUE	945122204	fgar_58@hotmail.com	\N	participante	t	2	doctorado
338	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31622449	1	JOSE ALEJANDRO	NARVAEZ	SOTO	943121637	jnarvaezs@unasam.edu.pe	\N	participante	t	2	doctorado
339	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31609342	1	ABELARDO MANRIQUE	DIAZ	SALAS	\N	adiazs@unasam.edu.pe	\N	participante	t	2	doctorado
340	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	46513585	1	GERARDO MAXIMO	REVELO	SANCHEZ	957577578	grevelos@unasam.edu.pe	\N	participante	t	2	magister
341	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	70009225	2	YENICA CIRILA	PACHAC	HUERTA	976117223	ypachach@unasam.edu.pe	\N	participante	t	2	magister
342	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	16531729	1	SEGUNDO MESIAS	HURTADO	RUBIO	943893565	shurtador@unasam.edu.pe	\N	participante	t	2	doctorado
343	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31613572	1	TEOFANES	MEJIA	ANAYA	942116303	tmejiaa@unasam.edu.pe	\N	participante	t	2	doctorado
344	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41899529	1	NELLS FABIO	ANAYA	COLONIA	921170194	nanayac@unasam.edu.pe	\N	participante	t	2	magister
345	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31612286	1	JAVIER ALBERTO	COTOS	VERA	949731884	jcotosv@unasam.edu.pe	\N	participante	t	2	magister
346	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678002	1	LORENZO MOISES	AYORA	GARAGATE	943165050	layorag@unasam.edu.pe	\N	participante	t	2	doctorado
347	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673428	1	FRANCISCO	ESPINOZA	MANCISIDOR	\N	fespinozama@unasam.edu.pe	\N	participante	t	2	bachiller
348	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31648615	1	TITO MONER	TINOCO	MEYHUAY	944426060	ttinocom@unasam.edu.pe	\N	participante	t	2	doctorado
349	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663077	1	ARTURO	MAZA	RUBINA	943764488	amazar@unasam.edu.pe	\N	participante	t	2	doctorado
350	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	09897355	1	CESAR AUGUSTO	LLANA	YUFRA	949634408	cllanay@unasam.edu.pe	\N	participante	t	2	magister
351	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31620358	1	VICTOR MANUEL	MENACHO	LOPEZ	943765868	vmenachol@unasam.edu.pe	\N	participante	t	2	doctorado
352	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40732347	2	FLOR ANGELA	JARA	REMIGIO	970028109	fjarar@unasam.edu.pe	\N	participante	t	2	magister
353	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31608095	1	ESTEBAN PEDRO	REYES	ROQUE	943162030	ereyesr@unasam.edu.pe	\N	participante	t	2	magister
354	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	16568826	1	VICTOR ANTONIO	VASQUEZ	NIÑO	943736918	vvasquezn@unasam.edu.pe	\N	participante	t	7	bachiller
355	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31628965	1	JOHN FRAYLUIS	BARRETO	PALMA	943048865	jbarretop@unasam.edu.pe	\N	participante	t	7	bachiller
356	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31677309	1	GUSTAVO GREGORIO	DE LA CRUZ	DUEÑAS	969929767	gdelacruzd@unasam.edu.pe	\N	participante	t	7	bachiller
357	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	47208128	1	RICHARD HANS	LOLI	GUTIERREZ	974117879	rlolig@unasam.edu.pe	\N	participante	t	7	bachiller
358	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07439492	2	ELIZABETH CLOTILDE	PANANA	HOLGADO	943516823	epananah@unasam.edu.pe	\N	participante	t	7	bachiller
359	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45589645	1	RUBEN DARIO	ARANDA	LEIVA	991488853	darandal@unasam.edu.pe	\N	participante	t	7	magister
360	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31649695	1	LUIS ARMANDO	TERRY	VASCONES	966951344	lterryv@unasam.edu.pe	\N	participante	t	7	bachiller
361	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31633291	1	CARLOS HUGO	OLAZA	HENOSTROZA	951869351	colazah@unasam.edu.pe	\N	participante	t	7	magister
362	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31671951	1	RICHARD ALBERTO	DEPAZ	BLACIDO	994538887	rdepazb@unasam.edu.pe	\N	participante	t	7	magister
363	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	47045002	2	ELVA SOFIA	LOPEZ	MORI	938629510	eslopezm@unasam.edu.pe	\N	participante	t	7	magister
364	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40563939	2	SHEILA LILIANA	ACEVEDO	COLINA	\N	arqsheilaacevedo@gmail.com	\N	participante	t	7	bachiller
365	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	47143389	2	CINTHIA JIMENA	DE LA CRUZ	PEÑARES	902058301	cdelacruzp@unasam.edu.pe	\N	participante	t	7	bachiller
366	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	71592601	2	CAROLINA STHEFANY	LEON	OJEDA	943180528	cleono@unasam.edu.pe	\N	participante	t	7	magister
367	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31671051	1	DANILO ENRIQUE	MONTORO	VERGARA	992867892	dmontorov@unasam.edu.pe	\N	participante	t	7	bachiller
368	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45996001	1	FERNANDO JAVIER	DEPAZ	HIDALGO	947599102	fdepazh@unasam.edu.pe	\N	participante	t	7	magister
369	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41342758	2	CARLA GRISELLE	POMA	GONZALEZ	\N	cpomag@unasam.edu.pe	\N	participante	t	7	magister
370	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31617642	1	LUIS ALBERTO	ITA	ROBLES	999135024	litar@unasam.edu.pe	\N	participante	t	7	magister
371	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42159232	2	ESTELA KAREM	SAMANE	ZEGARRA	945702908	esamamez@unasam.edu.pe	\N	participante	t	7	magister
372	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605837	1	WALTHER TEOFILO	MAGUIÑA	SALAZAR	969571012	wmaguinas@unasam.edu.pe	\N	participante	t	7	magister
373	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	72522979	2	MARIA MERCEDES	CUENTAS	GONZALES	968335387	marh.cg@gmail.com	\N	participante	t	7	bachiller
374	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31666463	1	CALANCIO FRANCISCO	ROSALES	SANCHEZ	943916784	crosaless@unasam.edu.pe	\N	participante	t	7	bachiller
375	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17935160	1	ELENCIO MELCHOR	MEJIA	ONCOY	952640447	emejiao@unasam.edu.pe	\N	participante	t	7	magister
376	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07416950	1	RAMON TEODORO	URTECHO	CASIMIRO	975127823	rurtechoc@unasam.edu.pe	\N	participante	t	7	bachiller
377	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44755316	2	LEYDY NATALY	ZAMORA	TERRONES	972843189	lzamorat@unasam.edu.pe	\N	participante	t	7	magister
378	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31633343	1	OSCAR FREDY	ALVA	VILLACORTA	943608693	oalvav@unasam.edu.pe	\N	participante	t	7	magister
379	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	06407853	1	RAUL ERNESTO	NUÑEZ	VILCHEZ	992672611	rnunezv@unasam.edu.pe	\N	participante	t	7	doctorado
380	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31615059	1	JOAQUIN SAMUEL	TAMARA	RODRIGUEZ	988059250	jtamarar@unasam.edu.pe	\N	participante	t	7	doctorado
381	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31632120	1	FELISMERO	SALINAS	FERNANDEZ	943682815	fsalinasf@unasam.edu.pe	\N	participante	t	7	bachiller
382	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42722601	1	DAVID	MINAYA	HUERTA	939290055	dminayah@unasam.edu.pe	\N	participante	t	7	doctorado
383	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	80121835	1	JAIME WALTER	BLAS	CANO	\N	wblasc@unasam.edu.pe	\N	participante	t	7	doctorado
384	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41621293	1	ALLENDE ELIAS	GOMEZ	RAMIREZ	990174140	agomezr@unasam.edu.pe	\N	participante	t	7	magister
385	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44010778	1	JESUS JOHAN	HUANEY	CARRANZA	949930070	jhuaneyc@unasam.edu.pe	\N	participante	t	7	magister
386	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	73888207	2	KATYA MIRTHA	CASTILLO	TREJO	948878186	kcastillot@unasam.edu.pe	\N	participante	t	7	bachiller
387	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31635025	1	LUIS TEODOSIO	JAVIER	CABANA	949578035	ljavierc@unasam.edu.pe	\N	participante	t	7	bachiller
388	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31650233	1	JULIO CESAR	CORAL	JAMANCA	941461726	jcoralj@unasam.edu.pe	\N	participante	t	7	bachiller
389	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43107045	2	DIANA ESTHER	SALDAÑA	SARACHAGA	\N	desarachaga@gmail.com	\N	participante	t	7	magister
390	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31613150	1	RAUL EDGAR	CASTILLEJO	MELGAREJO	947847957	rcastilllejom@unasam.edu.pe	\N	participante	t	7	magister
391	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31666048	1	MIGUEL RONALD	CORRALES	PICARDO	971761275	mcorralesp@unasam.edu.pe	\N	participante	t	7	doctorado
392	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	74124170	1	ALVARO JESUS	MONTAÑEZ	ZARZOSA	\N	alvarojesus1994@gmail.com	\N	participante	t	7	bachiller
393	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31666219	1	ELIO ALEJANDRO	MILLA	VERGARA	944931238	emillav@unasam.edu.pe	\N	participante	t	7	doctorado
394	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31626594	1	MARCO ANTONIO	LOLI	SILVA	943488818	mlolis@unasam.edu.pe	\N	participante	t	7	magister
395	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45768987	2	KELLY RAQUEL	PAZOS	SEDANO	\N	kpazoss@unasam.edu.pe	\N	participante	t	7	magister
396	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44088274	2	CINTHIA KATHERINE	TORRES	DOMINGUEZ	\N	ctorres@unasam.edu.pe	\N	participante	t	7	magister
397	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07848615	1	JOSE PAUL	VILLAR	MAGUIÑO	\N	arq-pvm@hotmail.com	\N	participante	t	7	bachiller
398	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31680387	1	JORGE LUIS	VARGAS	GARCIA	939290525	jvargasga@unasam.edu.pe	\N	participante	t	7	bachiller
399	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31669858	1	VICTOR HUGO	CANTU	PRADO	949808164	vcantup@unasam.edu.pe	\N	participante	t	7	magister
400	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18011202	2	ANA MARIA	VASCONES	PORTILLA	951511455	avasconesp@unasam.edu.pe	\N	participante	t	7	bachiller
401	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31676521	1	JULIO CELEDONIO	SALAS	CUADROS	943074238	jsalasc@unasam.edu.pe	\N	participante	t	7	magister
402	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31637904	1	ANTONIO MARIANO	DOMINGUEZ	FLORES	942681062	adominguezf@unasam.edu.pe	\N	participante	t	6	magister
403	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31660457	1	RICARDO CAYO	CASTILLEJO	MELGAREJO	923525045	rcastillejom@unasam.edu.pe	\N	participante	t	6	magister
404	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32653972	1	JUAN PELE	VILLARREAL	SALOME	976610086	jvillarreals@unasam.edu.pe	\N	participante	t	6	magister
405	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08085204	1	LUIS ALBERTO	TORRES	YUPANQUI	959985879	ltorresy@unasam.edu.pe	\N	participante	t	6	magister
406	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678801	1	FLAVIO AUGUSTO	RAMOS	AQUIÑO	950833927	framosa@unasam.edu.pe	\N	participante	t	6	doctorado
407	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672592	1	ARNALDO ALEJANDRO	RUIZ	CASTRO	942143587	aruic@unasam.edu.pe	\N	participante	t	6	magister
408	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672151	1	JACINTO CORNELIO	ISIDRO	GIRALDO	944641112	jisidrog@unasam.edu.pe	\N	participante	t	6	doctorado
409	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	10117064	1	JULIAN	PEREZ	FALCON	914676602	jperezf@unasam.edu.pe	\N	participante	t	6	doctorado
410	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605733	1	MANUEL TEODORO	RASHTA	LOCK	942650073	mrashtal@unasam.edu.pe	\N	participante	t	6	bachiller
411	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32645242	1	GUSTAVO ROBERTO	BOJORQUEZ	HUERTA	964090138	gbojorquezh@unasam.edu.pe	\N	participante	t	6	doctorado
412	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32040772	1	WALTER NICOLAW	ROMERO	VEGA	967785823	wromerov@unasam.edu.pe	\N	participante	t	6	magister
413	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32642091	1	JUAN ROGER	QUIÑONES	POMA	943232794	jquinonesp@unasam.edu.pe	\N	participante	t	6	doctorado
414	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31601882	1	JAVIER ENRRIQUE	SOTELO	MONTES	943606331	jsotelom@unasam.edu.pe	\N	participante	t	6	doctorado
415	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605756	1	ALDO DANTE	TARAZONA	MINAYA	981679267	atarazonam@unasam.edu.pe	\N	participante	t	6	doctorado
416	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674354	1	JULIO GREGORIO	POTERICO	HUAMAYALLI	943618630	juliopoterico@unasam.edu.pe	\N	participante	t	6	doctorado
417	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31603054	1	JESUS GERARDO	VIZCARRA	ARANA	\N	jvizcarraa@unasam.edu.pe	\N	participante	t	6	magister
418	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07208374	1	MIGUEL ANGEL	TEJADA	ZAFRA	949257775	mtejadaz@unasam.edu.pe	\N	participante	t	6	magister
419	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31626286	1	CESAR AUGUSTO	NARRO	CACHAY	962373506	cnarroc@unasam.edu.pe	\N	participante	t	1	magister
420	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	09745771	1	MARCO ANTONIO	JAMANCA	RAMIREZ	949800636	ajamancar@unasam.edu.pe	\N	participante	t	1	magister
421	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07587674	1	LUIS RUPERTO	ALVARADO	CACERES	943975749	lalvaradoc@unasam.edu.pe	\N	participante	t	1	doctorado
422	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	03664700	1	MIGUEL ANGEL	SILVA	ZAPATA	\N	msilvaz@unasam.edu.pe	\N	participante	t	1	magister
423	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	46022813	1	JOSEPH DARWIN	ALVARADO	TOLENTINO	943970821	jalvaradot@unasam.edu.pe	\N	participante	t	1	magister
424	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07765726	1	DANTE ENRIQUE	ROMERO	AGUILAR	927628407	dromeroa@unasam.edu.pe	\N	participante	t	1	magister
425	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	70115549	1	WILFREDO MANUEL	TREJO	FLORES	\N	wtrejof@unasam.edu.pe	\N	participante	t	1	magister
426	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31608116	1	ALBERTO MARTIN	MEDINA	VILLACORTA	943622002	amedinav@unasam.edu.pe	\N	participante	t	1	doctorado
427	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31618744	2	ELIZABETH GLADYS	ARIAS	LAZARTE	934956729	eariasl@unasam.edu.pe	\N	participante	t	1	magister
428	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	33263751	1	ESTEBAN JULIO	MEDINA	RAFAILE	910335019	emedinar@unasam.edu.pe	\N	participante	t	1	magister
429	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31663343	1	ROLANDO ROBERTO	SALAZAR	CACERES	943515005	rsalazarc@unasam.edu.pe	\N	participante	t	1	doctorado
430	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41669511	1	NOE MELQUIADES	VASQUEZ	RAMIREZ	939963041	nvasquezr@unasam.edu.pe	\N	participante	t	1	magister
431	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	16703164	1	JOHNNY	CUEVA	VALDIVIA	969954107	jcuevav@unasam.edu.pe	\N	participante	t	1	doctorado
432	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07964931	1	ERICK GIOVANNY	FLORES	CHACON	956963007	efloresc@unasam.edu.pe	\N	participante	t	1	magister
433	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32912682	1	JESUS DANIEL	OCAÑA	VELASQUEZ	943885035	jocanav@unasam.edu.pe	\N	participante	t	1	doctorado
434	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	10312182	1	JAIME YLIAM	MINAYA	GONZALEZ	948665051	jminayag@unasam.edu.pe	\N	participante	t	1	bachiller
435	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18887375	1	ELI	MONZON	BRICEÑO	943637207	emonzonb@unasam.edu.pe	\N	participante	t	1	magister
436	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18164314	1	JORGE WILSON	LEIVA	GONZALES	959126679	jleivag@unasam.edu.pe	\N	participante	t	1	magister
437	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32646765	1	NEMECIO SEGUNDO	CASTILLO	TUYA	948128348	ncastillot@unasam.edu.pe	\N	participante	t	1	magister
438	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32800493	1	HENRY ANGEL	GARRIDO	ANGULO	943691437	hgarridoa@unasam.edu.pe	\N	participante	t	1	magister
439	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40563862	1	RUBEN MARIO	LEIVA	BERNUY	943569081	rleiva@unasam.edu.pe	\N	participante	t	1	magister
440	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17870805	2	PILAR SARA	NUÑEZ	BLAS	943594918	pnunezb@unasam.edu.pe	\N	participante	t	1	doctorado
441	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	29551778	2	ANDREA LUISA	PARI	SOTO	943855915	aparis@unasam.edu.pe	\N	participante	t	1	magister
442	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41231912	1	VICTOR ALBERTO	POCOY	YAURI	956842375	vpocoyy@unasam.edu.pe	\N	participante	t	1	magister
443	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40223139	1	VLADIMIR GIOVANNI	RODRIGUEZ	SABINO	961082526	vrodriguezs@unasam.edu.pe	\N	participante	t	1	magister
444	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	06908215	1	BIBIANO MARTIN	CERNA	MAGUIÑA	943756087	bcernam@unasam.edu.pe	\N	participante	t	1	doctorado
445	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32805212	1	MARIANO ANTONIO	BEDON	SALINAS	957669871	mbedons@unasam.edu.pe	\N	participante	t	1	magister
446	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	10763091	1	MAXIMILIANO EPIFANIO	ASIS	LOPEZ	945375233	masisl@unasam.edu.pe	\N	participante	t	1	doctorado
447	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32126034	1	HEVER LUIS	HINOSTROZA	ENCARNACION	992479574	hhinostrozae@unasam.edu.pe	\N	participante	t	1	magister
448	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678338	1	KLEBER	TRINIDAD	GARGATE	971000099	ktrinidadg@unasam.edu.pe	\N	participante	t	1	magister
449	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	29551777	2	ANDREA ROSARIO	PARI	SOTO	945758837	arparisoto@unasam.edu.pe	\N	participante	t	1	magister
450	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18883920	1	ESMELIN	NIQUIN	ALAYO	943965921	eniquin@unasam.edu.pe	\N	participante	t	1	doctorado
451	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18056493	1	LORENZO	ATOCHE	CACERES	\N	atochec@unasam.edu.pe	\N	participante	t	1	magister
452	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31629062	1	MARIO	NINAQUISPE	CASTILLO	945465600	mninaquispec@unasam.edu.pe	\N	participante	t	1	magister
453	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	16407673	1	CESAR AUGUSTO	GONZALES	CHICLAYO	935868526	cgonzalesc@unasam.edu.pe	\N	participante	t	1	magister
454	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42682732	1	JONHY SATURNINO	GARAY	SANTISTEBAN	956848512	jgarays@unasam.edu.pe	\N	participante	t	1	doctorado
455	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	16492448	1	FRANKLIN	PUELLES	GONZALES	992498773	fpuellesg@unasam.edu.pe	\N	participante	t	1	magister
456	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	29349919	1	JAIME BRAULIO	CAHUANA	FLORES	\N	jcahuanaf@unasam.edu.pe	\N	participante	t	1	bachiller
457	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08578145	2	NELIDA ESPERANZA	BUSTAMANTE	MALAVER	948172644	nbustamantem@unasam.edu.pe	\N	participante	t	1	magister
458	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32958759	1	JAKSON	GARCIA	MUÑOZ	990008588	jgarciam@unasam.edu.pe	\N	participante	t	1	bachiller
459	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31627082	2	ABENCIA	SOTO	GONZALEZ	\N	asotog@unasam.edu.pe	\N	participante	t	1	bachiller
460	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41175727	1	SEGUNDO OSCAR	MINAYA	SALINAS	943797654	sminayas@unasam.edu.pe	\N	participante	t	1	bachiller
461	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32904225	1	EDGAR ELI	HERNANDEZ	MEDINA	943848813	ehernandezm@unasam.edu.pe	\N	participante	t	1	magister
462	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674688	2	PERPETUA MARIA	ALAYO	MEREGILDO	978899419	palayod@unasam.edu.pe	\N	participante	t	1	magister
463	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18092381	1	ALEXANDER	PACHECO	CASTILLO	942603329	apachecoc@unasam.edu.pe	\N	participante	t	1	doctorado
464	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32968629	1	MERLYNG ISAIAS	ZAVALETA	MEDINA	943405382	mzavaletam@unasam.edu.pe	\N	participante	t	1	magister
465	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40358097	2	GIOVANNA	CORAL	SUAREZ	945885262	gcorals@unasam.edu.pe	\N	participante	t	1	magister
466	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31605186	1	JUAN MODESTO	OLIVERA	SANCHEZ	943715526	joliveras@unasam.edu.pe	\N	participante	t	1	magister
467	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42213770	1	ORLANDO JAVIER	JAVIER	ROSAS	961508457	ojavierr@unasam.edu.pe	\N	participante	t	1	bachiller
468	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42747811	1	LUCIO ROMEL	PALMA	LEON	949193935	lpalmal@unasam.edu.pe	\N	participante	t	1	bachiller
469	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17981051	1	ROGER HYONI	FLORIAN	SALDAÑA	926932360	rflorians@unasam.edu.pe	\N	participante	t	1	magister
470	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43706582	1	DIK DANI	LUJERIO	GARCIA	965699765	dlujeriog@unasam.edu.pe	\N	participante	t	1	magister
471	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672257	1	JUBE CIRO	PORTALATINO	ZEVALLOS	\N	jportalatinoz@unasam.edu.pe	\N	participante	t	1	doctorado
472	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44872754	1	JAVIER RUBEN	SABINO	NORABUENA	998745702	jsabinon@unasam.edu.pe	\N	participante	t	1	magister
473	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672767	2	GILMA ALY	ROJAS	TELLO	943230517	grojast@unasam.edu.pe	\N	participante	t	8	magister
474	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07285410	1	MARCELO IDO	AROTOMA	ORE	943423767	marotomao@unasam.edu.pe	\N	participante	t	8	doctorado
475	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42410733	2	SANDRA CELICA	CRUZ	VILLACHICA	\N	sandracruz2303@hotmail.com	\N	participante	t	8	magister
476	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32958422	2	LINDA ROCIO	ACOSTA	YPARRAGUIRRE	943377092	lacostay@unasam.edu.pe	\N	participante	t	8	doctorado
477	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40731520	2	YULIANA MERCEDES	DE LA CRUZ	RAMIREZ	943434022	ydelacruzr@unasam.edu.pe	\N	participante	t	8	doctorado
478	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	28223999	2	CELEDONIA NORMA	DIAZ	ROJAS	944951890	cdiazr@unasam.edu.pe	\N	participante	t	8	magister
479	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32043531	2	FLORA	FLORES	TIZNADO	944950218	ffloresd@unasam.edu.pe	\N	participante	t	8	magister
480	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678589	2	NELLY NANCY	ROSAS	ONCOY	952864001	nellyros14@hotmail.com	\N	participante	t	8	magister
481	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31652983	2	REYNA	HUARCA	LOPEZ	\N	rhuarcal@unasam.edu.pe	\N	participante	t	8	bachiller
482	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	33243411	2	ELIZABETH	VELEZ	SALAZAR	958551006	evelezs@unasam.edu.pe	\N	participante	t	8	doctorado
483	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42296587	2	IRMA PATRICIA	MENDOZA	ALBORNOZ	981724455	imendozaa@unasam.edu.pe	\N	participante	t	8	magister
484	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	15956778	2	LEILA ROCIO	MONTANE	LOPEZ	966687075	lmontanel@unasam.edu.pe	\N	participante	t	8	magister
485	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44770722	2	ELIZABETH JACQUELINE	QUITO	LEON	\N	equitol@unasam.edu.pe	\N	participante	t	8	magister
486	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31672208	2	LAURA ESTHER	NUÑEZ	ARAOS	943885854	lalyesther@hotmail.com	\N	participante	t	8	magister
487	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	06905249	2	ADA EUDOCIA	RODRIGUEZ	FIGUEROA	945129235	arodriguezf@unasam.edu.pe	\N	participante	t	8	doctorado
488	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40324426	2	ROSA MARIA	RIOS	SALINAS	943898051	rrioss@unasam.edu.pe	\N	participante	t	8	magister
489	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45816858	1	JUNIOR DUBERLI	SANCHEZ	BRONCANO	974292805	jsanchezb@unasam.edu.pe	\N	participante	t	8	doctorado
490	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31674147	1	AUGUSTO FELIX	OLAZA	MAGUIÑA	943631850	aolazam@unasam.edu.pe	\N	participante	t	8	doctorado
491	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673977	2	MAXIMILIANA	QUISPE	GOMEZ	948986948	mquispeg@unasam.edu.pe	\N	participante	t	8	doctorado
492	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41618489	2	JOVANNA HASEL	OLIVARES	CORDOVA	921089293	jolivaresc@unasam.edu.pe	\N	participante	t	8	magister
493	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43536106	2	RUTH JAKELYN	MENACHO	ZORRILLA	942586908	rmenachoz@unasam.edu.pe	\N	participante	t	8	magister
494	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	07926508	2	ROSARIO MARGARITA	YSLADO	MENDEZ	949867626	rysladom@unasam.edu.pe	\N	participante	t	8	doctorado
495	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08607324	1	JULIO CESAR	MENACHO	LOPEZ	943613515	jmenachol@unasam.edu.pe	\N	participante	t	8	doctorado
496	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31678998	1	ARTURO	TUYA	ORDOÑEZ	913194208	atuyao@unasam.edu.pe	\N	participante	t	8	magister
497	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31650309	1	RAFAEL MARCOS	NORABUENA	PENADILLO	957472802	rnorabuenap@unasam.edu.pe	\N	participante	t	8	doctorado
498	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32956305	1	DANIEL ALBERTO	PAIRAZAMAN	OLIVEROS	943786837	dpairazamano@unasam.edu.pe	\N	participante	t	8	magister
499	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18828272	1	RICHARD EDWARD	BOBADILLA	CHAVEZ	947888805	rbobadillac@unasam.edu.pe	\N	participante	t	8	magister
500	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	19912041	1	WILLY EDGARDO	CORDOVA	CASSIA	943030075	wcordovac@unasam.edu.pe	\N	participante	t	8	bachiller
501	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31673337	2	MARGARITA AMELIA	PAJUELO	VERA	943677377	mpajuelov@unasam.edu.pe	\N	participante	t	8	magister
502	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31661950	2	LILIANA ROSANA	DE LA CRUZ	DIAZ	\N	ldelacruzd@unasam.edu.pe	\N	participante	t	8	magister
503	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40736241	1	WILDER JAIR	VIDAL	MACEDO	942999177	wvidalm@unasam.edu.pe	\N	participante	t	8	magister
504	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41992865	1	JEISON EZEQUIEL	ALEGRE	SANCHEZ	\N	ejemplo@unasam.edu.pe	\N	participante	t	8	bachiller
505	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	06163549	2	VIVIANA PATRICIA	AGUIRRE	ZENDER	991601269	vaguirrez@unasam.edu.pe	\N	participante	t	8	doctorado
506	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18174121	1	ANDRES AVELINO	ALEGRIA	CHAVEZ	948049607	aalegriac@unasam.edu.pe	\N	participante	t	11	magister
507	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18113152	2	ANGELA PAOLA	CABREJOS	RUBIO	949857136	acabrejosr@unasam.edu.pe	\N	participante	t	11	magister
508	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	33263572	2	IVONNE RUTH	ARROYO	ROSALES	943819780	iarroyor@unasam.edu.pe	\N	participante	t	11	magister
509	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40656466	2	CESIBEL MILENA	CASTILLO	VALDIVIANO	948771776	ccesibel@hotmail.com	\N	participante	t	8	magister
510	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43686856	1	KAREN YERALIN	CHUNQUE	ZAMORA	956468682	kchunquez@unasam.edu.pe	\N	participante	t	11	magister
511	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	44812496	1	DANTE ALEGUERE	SOLORZANO	HUAMAN	954066536	dsolorzanoh@unasam.edu.pe	\N	participante	t	10	magister
512	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31761757	1	DAVID ALFREDO	BRITO	MALLQUI	945275437	dbritom@unasam.edu.pe	\N	participante	t	11	magister
513	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31656219	1	EDDY	VALDERRAMA	ESPINOZA	943852040	evalderramae@unasam.edu.pe	\N	participante	t	11	magister
514	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	32855895	2	MAGNA	GUZMAN	AVALOS	\N	mguzmana@unasam.edu.pe	\N	participante	t	8	doctorado
515	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18183294	2	IRMA AIDE	PLASENCIA	DIAZ	987044506	iplasenciad@unasam.edu.pe	\N	participante	t	11	magister
516	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18148758	1	DAVID JORGE	RIOS	GONZALES	931849775	jriosg@unasam.edu.pe	\N	participante	t	11	magister
517	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	45562669	1	JOSE ELIAS	CARRANZA	ALVARADO	977126026	jcarranzaa@unasam.edu.pe	\N	participante	t	11	magister
518	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18070959	2	NANCY ROCIO	VIDAL	DE PORTELLA	987426329	nvidalp@unasam.edu.pe	\N	participante	t	11	magister
519	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	08209167	1	CARLOS SIMON	RODRIGUEZ	RAMIREZ	991013043	crodriguezr@unasam.edu.pe	\N	participante	t	10	magister
520	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18141305	1	ELI BEQUER	RODRIGUEZ	VIDAL	991013043	brodriguezv@unasam.edu.pe	\N	participante	t	11	magister
521	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42229551	1	ALEX	NERI	GUTIERREZ	933455371	anerig@unasam.edu.pe	\N	participante	t	1	magister
522	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41504819	2	GISSELA CRISTINA	GONZALES	PAUCAR	943859891	cgonzalesp@unasam.edu.pe	\N	participante	t	1	magister
523	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31619483	2	ROSARIO TRINIDAD	BARRA	ZEGARRA	943550295	tbarraz@unasam.edu.pe	\N	participante	t	1	magister
524	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	31680888	1	ANGEL JOFRE	GONZALES	CABRERA	998651194	agonzalesc@unasam.edu.pe	\N	participante	t	1	magister
525	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	46074450	1	CESAR AUGUSTO	HILARIO	POMA	986140638	chilariop@unasam.edu.pe	\N	participante	t	1	magister
526	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41268400	1	JOSE LUIS	LIÑAN	HERRERA	959726559	jlinanh@unasam.edu.pe	\N	participante	t	1	magister
527	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41982355	1	MANUEL TEODORO	VILLANUEVA	CHAUCA	998712732	mvillanuevac@unasam.edu.pe	\N	participante	t	1	magister
528	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	42953649	1	WALTER JUNIOR	MEDINA	LOPEZ	940323220	wmedinal@unasam.edu.pe	\N	participante	t	1	magister
529	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	40558464	2	PATRICIA MILAGROS	HUAMAN	ROMERO	944944550	phuamanr@unasam.edu.pe	\N	participante	t	1	magister
530	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	46871908	1	SAUL FELIPE	RAMIREZ	HUARAC	979919814	sramirezh@unasam.edu.pe	\N	participante	t	1	magister
531	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	41387671	1	CESAR ASUNCION	SOPLAPUCO	SARMIENTO	963648212	csoplapucos@unasam.edu.pe	\N	participante	t	1	magister
532	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	18033644	1	JONHSON DIOMEDES	VALDERRAMA	ARTEAGA	942490011	jvalderramaa@unasam.edu.pe	\N	participante	t	1	doctorado
533	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	43599506	1	VICTOR HUGO	LOPEZ	SOLIS	\N	vlopezs@unasam.edu.pe	\N	participante	t	1	doctorado
534	admin	\N	2022-06-28 16:47:09.544653+00	2022-06-28 16:47:09.544653+00	01	17821024	1	ROOSEVELT BENEL	VILLALOBOS	DIAZ	\N	rvillalobosd@hotmail.com	\N	participante	t	1	doctorado
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: capacitacion_actaasistencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_actaasistencia_id_seq', 1, false);


--
-- Name: capacitacion_capacitacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_capacitacion_id_seq', 1, false);


--
-- Name: capacitacion_certemitido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_certemitido_id_seq', 1, false);


--
-- Name: capacitacion_detalleasistencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_detalleasistencia_id_seq', 1, false);


--
-- Name: capacitacion_equipoproyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_equipoproyecto_id_seq', 1, false);


--
-- Name: capacitacion_evidencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_evidencia_id_seq', 1, false);


--
-- Name: capacitacion_historialrevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_historialrevision_id_seq', 1, false);


--
-- Name: capacitacion_historialrevisionconsejo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_historialrevisionconsejo_id_seq', 1, false);


--
-- Name: capacitacion_modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_modulo_id_seq', 1, false);


--
-- Name: capacitacion_notaparticipante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_notaparticipante_id_seq', 1, false);


--
-- Name: capacitacion_responsablefirma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.capacitacion_responsablefirma_id_seq', 1, false);


--
-- Name: correlativo_cert_secuencia; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.correlativo_cert_secuencia', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: persona_facultad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.persona_facultad_id_seq', 12, true);


--
-- Name: persona_firmante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.persona_firmante_id_seq', 1, false);


--
-- Name: persona_persona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.persona_persona_id_seq', 534, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_persona_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_persona_id_key UNIQUE (persona_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: capacitacion_actaasistencia capacitacion_actaasistencia_modulo_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_actaasistencia
    ADD CONSTRAINT capacitacion_actaasistencia_modulo_id_key UNIQUE (modulo_id);


--
-- Name: capacitacion_actaasistencia capacitacion_actaasistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_actaasistencia
    ADD CONSTRAINT capacitacion_actaasistencia_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_capacitacion capacitacion_capacitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_capacitacion
    ADD CONSTRAINT capacitacion_capacitacion_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_certemitido capacitacion_certemitido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_certemitido
    ADD CONSTRAINT capacitacion_certemitido_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_detalleasistencia capacitacion_detalleasis_fecha_persona_id_acta_as_e5c000d0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_detalleasistencia
    ADD CONSTRAINT capacitacion_detalleasis_fecha_persona_id_acta_as_e5c000d0_uniq UNIQUE (fecha, persona_id, acta_asistencia_id);


--
-- Name: capacitacion_detalleasistencia capacitacion_detalleasistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_detalleasistencia
    ADD CONSTRAINT capacitacion_detalleasistencia_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_equipoproyecto capacitacion_equipoproye_cargo_persona_id_capacit_fd803e40_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_equipoproyecto
    ADD CONSTRAINT capacitacion_equipoproye_cargo_persona_id_capacit_fd803e40_uniq UNIQUE (cargo, persona_id, capacitacion_id);


--
-- Name: capacitacion_equipoproyecto capacitacion_equipoproyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_equipoproyecto
    ADD CONSTRAINT capacitacion_equipoproyecto_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_evidencia capacitacion_evidencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_evidencia
    ADD CONSTRAINT capacitacion_evidencia_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_historialrevision capacitacion_historialrevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevision
    ADD CONSTRAINT capacitacion_historialrevision_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_historialrevisionconsejo capacitacion_historialrevisionconsejo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevisionconsejo
    ADD CONSTRAINT capacitacion_historialrevisionconsejo_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_modulo capacitacion_modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_modulo
    ADD CONSTRAINT capacitacion_modulo_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_notaparticipante capacitacion_notapartici_acta_asistencia_id_perso_a3afd7dd_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_notaparticipante
    ADD CONSTRAINT capacitacion_notapartici_acta_asistencia_id_perso_a3afd7dd_uniq UNIQUE (acta_asistencia_id, persona_id);


--
-- Name: capacitacion_notaparticipante capacitacion_notaparticipante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_notaparticipante
    ADD CONSTRAINT capacitacion_notaparticipante_pkey PRIMARY KEY (id);


--
-- Name: capacitacion_responsablefirma capacitacion_responsable_tipo_firma_firmante_id_c_9534d42a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_responsablefirma
    ADD CONSTRAINT capacitacion_responsable_tipo_firma_firmante_id_c_9534d42a_uniq UNIQUE (tipo_firma, firmante_id, capacitacion_id);


--
-- Name: capacitacion_responsablefirma capacitacion_responsablefirma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_responsablefirma
    ADD CONSTRAINT capacitacion_responsablefirma_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: persona_facultad persona_facultad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_facultad
    ADD CONSTRAINT persona_facultad_pkey PRIMARY KEY (id);


--
-- Name: persona_firmante persona_firmante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_firmante
    ADD CONSTRAINT persona_firmante_pkey PRIMARY KEY (id);


--
-- Name: persona_persona persona_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_persona
    ADD CONSTRAINT persona_persona_pkey PRIMARY KEY (id);


--
-- Name: persona_persona persona_persona_tipo_documento_numero_documento_f2c3b28c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_persona
    ADD CONSTRAINT persona_persona_tipo_documento_numero_documento_f2c3b28c_uniq UNIQUE (tipo_documento, numero_documento);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: capacitacion_capacitacion_facultad_id_e80f0577; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_capacitacion_facultad_id_e80f0577 ON public.capacitacion_capacitacion USING btree (facultad_id);


--
-- Name: capacitacion_certemitido_modulo_id_1efe4bb3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_certemitido_modulo_id_1efe4bb3 ON public.capacitacion_certemitido USING btree (modulo_id);


--
-- Name: capacitacion_certemitido_persona_id_327e870c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_certemitido_persona_id_327e870c ON public.capacitacion_certemitido USING btree (persona_id);


--
-- Name: capacitacion_detalleasistencia_acta_asistencia_id_c3b67575; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_detalleasistencia_acta_asistencia_id_c3b67575 ON public.capacitacion_detalleasistencia USING btree (acta_asistencia_id);


--
-- Name: capacitacion_detalleasistencia_persona_id_5a8d0e5b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_detalleasistencia_persona_id_5a8d0e5b ON public.capacitacion_detalleasistencia USING btree (persona_id);


--
-- Name: capacitacion_equipoproyecto_capacitacion_id_8ef0476f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_equipoproyecto_capacitacion_id_8ef0476f ON public.capacitacion_equipoproyecto USING btree (capacitacion_id);


--
-- Name: capacitacion_equipoproyecto_persona_id_dbbb2251; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_equipoproyecto_persona_id_dbbb2251 ON public.capacitacion_equipoproyecto USING btree (persona_id);


--
-- Name: capacitacion_evidencia_acta_asistencia_id_61aa8fc6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_evidencia_acta_asistencia_id_61aa8fc6 ON public.capacitacion_evidencia USING btree (acta_asistencia_id);


--
-- Name: capacitacion_historialrevision_capacitacion_id_4acde864; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_historialrevision_capacitacion_id_4acde864 ON public.capacitacion_historialrevision USING btree (capacitacion_id);


--
-- Name: capacitacion_historialrevisionconsejo_facultad_id_9943f7ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_historialrevisionconsejo_facultad_id_9943f7ef ON public.capacitacion_historialrevisionconsejo USING btree (facultad_id);


--
-- Name: capacitacion_historialrevisionconsejo_persona_id_e82813f5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_historialrevisionconsejo_persona_id_e82813f5 ON public.capacitacion_historialrevisionconsejo USING btree (persona_id);


--
-- Name: capacitacion_historialrevisionconsejo_revision_id_e65339be; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_historialrevisionconsejo_revision_id_e65339be ON public.capacitacion_historialrevisionconsejo USING btree (revision_id);


--
-- Name: capacitacion_modulo_capacitacion_id_ca628fa8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_modulo_capacitacion_id_ca628fa8 ON public.capacitacion_modulo USING btree (capacitacion_id);


--
-- Name: capacitacion_notaparticipante_acta_asistencia_id_4c4e76d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_notaparticipante_acta_asistencia_id_4c4e76d6 ON public.capacitacion_notaparticipante USING btree (acta_asistencia_id);


--
-- Name: capacitacion_notaparticipante_persona_id_ab08b2f2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_notaparticipante_persona_id_ab08b2f2 ON public.capacitacion_notaparticipante USING btree (persona_id);


--
-- Name: capacitacion_responsablefirma_capacitacion_id_3d6f083a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_responsablefirma_capacitacion_id_3d6f083a ON public.capacitacion_responsablefirma USING btree (capacitacion_id);


--
-- Name: capacitacion_responsablefirma_firmante_id_655c93aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX capacitacion_responsablefirma_firmante_id_655c93aa ON public.capacitacion_responsablefirma USING btree (firmante_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: persona_firmante_facultad_id_2ca08842; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX persona_firmante_facultad_id_2ca08842 ON public.persona_firmante USING btree (facultad_id);


--
-- Name: persona_firmante_persona_id_14ef7f8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX persona_firmante_persona_id_14ef7f8b ON public.persona_firmante USING btree (persona_id);


--
-- Name: persona_persona_facultad_id_583be290; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX persona_persona_facultad_id_583be290 ON public.persona_persona USING btree (facultad_id);


--
-- Name: capacitacion_certemitido trg_correlativo_cert; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_correlativo_cert BEFORE INSERT ON public.capacitacion_certemitido FOR EACH ROW EXECUTE FUNCTION public.genera_correlativo_cert();


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user auth_user_persona_id_e1c485a1_fk_persona_persona_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_persona_id_e1c485a1_fk_persona_persona_id FOREIGN KEY (persona_id) REFERENCES public.persona_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_actaasistencia capacitacion_actaasi_modulo_id_2aa17dc6_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_actaasistencia
    ADD CONSTRAINT capacitacion_actaasi_modulo_id_2aa17dc6_fk_capacitac FOREIGN KEY (modulo_id) REFERENCES public.capacitacion_modulo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_capacitacion capacitacion_capacit_facultad_id_e80f0577_fk_persona_f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_capacitacion
    ADD CONSTRAINT capacitacion_capacit_facultad_id_e80f0577_fk_persona_f FOREIGN KEY (facultad_id) REFERENCES public.persona_facultad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_certemitido capacitacion_certemi_modulo_id_1efe4bb3_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_certemitido
    ADD CONSTRAINT capacitacion_certemi_modulo_id_1efe4bb3_fk_capacitac FOREIGN KEY (modulo_id) REFERENCES public.capacitacion_modulo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_certemitido capacitacion_certemi_persona_id_327e870c_fk_persona_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_certemitido
    ADD CONSTRAINT capacitacion_certemi_persona_id_327e870c_fk_persona_p FOREIGN KEY (persona_id) REFERENCES public.persona_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_detalleasistencia capacitacion_detalle_acta_asistencia_id_c3b67575_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_detalleasistencia
    ADD CONSTRAINT capacitacion_detalle_acta_asistencia_id_c3b67575_fk_capacitac FOREIGN KEY (acta_asistencia_id) REFERENCES public.capacitacion_actaasistencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_detalleasistencia capacitacion_detalle_persona_id_5a8d0e5b_fk_persona_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_detalleasistencia
    ADD CONSTRAINT capacitacion_detalle_persona_id_5a8d0e5b_fk_persona_p FOREIGN KEY (persona_id) REFERENCES public.persona_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_equipoproyecto capacitacion_equipop_capacitacion_id_8ef0476f_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_equipoproyecto
    ADD CONSTRAINT capacitacion_equipop_capacitacion_id_8ef0476f_fk_capacitac FOREIGN KEY (capacitacion_id) REFERENCES public.capacitacion_capacitacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_equipoproyecto capacitacion_equipop_persona_id_dbbb2251_fk_persona_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_equipoproyecto
    ADD CONSTRAINT capacitacion_equipop_persona_id_dbbb2251_fk_persona_p FOREIGN KEY (persona_id) REFERENCES public.persona_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_evidencia capacitacion_evidenc_acta_asistencia_id_61aa8fc6_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_evidencia
    ADD CONSTRAINT capacitacion_evidenc_acta_asistencia_id_61aa8fc6_fk_capacitac FOREIGN KEY (acta_asistencia_id) REFERENCES public.capacitacion_actaasistencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_historialrevision capacitacion_histori_capacitacion_id_4acde864_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevision
    ADD CONSTRAINT capacitacion_histori_capacitacion_id_4acde864_fk_capacitac FOREIGN KEY (capacitacion_id) REFERENCES public.capacitacion_capacitacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_historialrevisionconsejo capacitacion_histori_facultad_id_9943f7ef_fk_persona_f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevisionconsejo
    ADD CONSTRAINT capacitacion_histori_facultad_id_9943f7ef_fk_persona_f FOREIGN KEY (facultad_id) REFERENCES public.persona_facultad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_historialrevisionconsejo capacitacion_histori_persona_id_e82813f5_fk_persona_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevisionconsejo
    ADD CONSTRAINT capacitacion_histori_persona_id_e82813f5_fk_persona_p FOREIGN KEY (persona_id) REFERENCES public.persona_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_historialrevisionconsejo capacitacion_histori_revision_id_e65339be_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_historialrevisionconsejo
    ADD CONSTRAINT capacitacion_histori_revision_id_e65339be_fk_capacitac FOREIGN KEY (revision_id) REFERENCES public.capacitacion_historialrevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_modulo capacitacion_modulo_capacitacion_id_ca628fa8_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_modulo
    ADD CONSTRAINT capacitacion_modulo_capacitacion_id_ca628fa8_fk_capacitac FOREIGN KEY (capacitacion_id) REFERENCES public.capacitacion_capacitacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_notaparticipante capacitacion_notapar_acta_asistencia_id_4c4e76d6_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_notaparticipante
    ADD CONSTRAINT capacitacion_notapar_acta_asistencia_id_4c4e76d6_fk_capacitac FOREIGN KEY (acta_asistencia_id) REFERENCES public.capacitacion_actaasistencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_notaparticipante capacitacion_notapar_persona_id_ab08b2f2_fk_persona_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_notaparticipante
    ADD CONSTRAINT capacitacion_notapar_persona_id_ab08b2f2_fk_persona_p FOREIGN KEY (persona_id) REFERENCES public.persona_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_responsablefirma capacitacion_respons_capacitacion_id_3d6f083a_fk_capacitac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_responsablefirma
    ADD CONSTRAINT capacitacion_respons_capacitacion_id_3d6f083a_fk_capacitac FOREIGN KEY (capacitacion_id) REFERENCES public.capacitacion_capacitacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: capacitacion_responsablefirma capacitacion_respons_firmante_id_655c93aa_fk_persona_f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capacitacion_responsablefirma
    ADD CONSTRAINT capacitacion_respons_firmante_id_655c93aa_fk_persona_f FOREIGN KEY (firmante_id) REFERENCES public.persona_firmante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: persona_firmante persona_firmante_facultad_id_2ca08842_fk_persona_facultad_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_firmante
    ADD CONSTRAINT persona_firmante_facultad_id_2ca08842_fk_persona_facultad_id FOREIGN KEY (facultad_id) REFERENCES public.persona_facultad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: persona_firmante persona_firmante_persona_id_14ef7f8b_fk_persona_persona_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_firmante
    ADD CONSTRAINT persona_firmante_persona_id_14ef7f8b_fk_persona_persona_id FOREIGN KEY (persona_id) REFERENCES public.persona_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: persona_persona persona_persona_facultad_id_583be290_fk_persona_facultad_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_persona
    ADD CONSTRAINT persona_persona_facultad_id_583be290_fk_persona_facultad_id FOREIGN KEY (facultad_id) REFERENCES public.persona_facultad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

