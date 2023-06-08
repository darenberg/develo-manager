--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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

ALTER TABLE ONLY public.plans DROP CONSTRAINT fk_rails_ede8c0cb94;
ALTER TABLE ONLY public.user_tasks DROP CONSTRAINT fk_rails_e4209a9ba9;
ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT fk_rails_c3b3935057;
ALTER TABLE ONLY public.dots DROP CONSTRAINT fk_rails_b03837ecce;
ALTER TABLE ONLY public.project_users DROP CONSTRAINT fk_rails_996d73fecd;
ALTER TABLE ONLY public.active_storage_variant_records DROP CONSTRAINT fk_rails_993965df05;
ALTER TABLE ONLY public.user_tasks DROP CONSTRAINT fk_rails_5a3f03c742;
ALTER TABLE ONLY public.tasks DROP CONSTRAINT fk_rails_576732370e;
ALTER TABLE ONLY public.tags DROP CONSTRAINT fk_rails_28d586d22f;
ALTER TABLE ONLY public.projects DROP CONSTRAINT fk_rails_219ef9bf7d;
ALTER TABLE ONLY public.project_users DROP CONSTRAINT fk_rails_1bf16ed5d0;
ALTER TABLE ONLY public.floors DROP CONSTRAINT fk_rails_0e508c64ca;
DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_user_tasks_on_user_id;
DROP INDEX public.index_user_tasks_on_task_id;
DROP INDEX public.index_tasks_on_dot_id;
DROP INDEX public.index_tags_on_task_id;
DROP INDEX public.index_projects_on_owner_id;
DROP INDEX public.index_project_users_on_user_id;
DROP INDEX public.index_project_users_on_project_id;
DROP INDEX public.index_plans_on_floor_id;
DROP INDEX public.index_floors_on_project_id;
DROP INDEX public.index_dots_on_plan_id;
DROP INDEX public.index_active_storage_variant_records_uniqueness;
DROP INDEX public.index_active_storage_blobs_on_key;
DROP INDEX public.index_active_storage_attachments_uniqueness;
DROP INDEX public.index_active_storage_attachments_on_blob_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.user_tasks DROP CONSTRAINT user_tasks_pkey;
ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
ALTER TABLE ONLY public.project_users DROP CONSTRAINT project_users_pkey;
ALTER TABLE ONLY public.plans DROP CONSTRAINT plans_pkey;
ALTER TABLE ONLY public.floors DROP CONSTRAINT floors_pkey;
ALTER TABLE ONLY public.dots DROP CONSTRAINT dots_pkey;
ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
ALTER TABLE ONLY public.active_storage_variant_records DROP CONSTRAINT active_storage_variant_records_pkey;
ALTER TABLE ONLY public.active_storage_blobs DROP CONSTRAINT active_storage_blobs_pkey;
ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT active_storage_attachments_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.user_tasks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.project_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.plans ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.floors ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dots ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_variant_records ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.user_tasks_id_seq;
DROP TABLE public.user_tasks;
DROP SEQUENCE public.tasks_id_seq;
DROP TABLE public.tasks;
DROP SEQUENCE public.tags_id_seq;
DROP TABLE public.tags;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.projects_id_seq;
DROP TABLE public.projects;
DROP SEQUENCE public.project_users_id_seq;
DROP TABLE public.project_users;
DROP SEQUENCE public.plans_id_seq;
DROP TABLE public.plans;
DROP SEQUENCE public.floors_id_seq;
DROP TABLE public.floors;
DROP SEQUENCE public.dots_id_seq;
DROP TABLE public.dots;
DROP TABLE public.ar_internal_metadata;
DROP SEQUENCE public.active_storage_variant_records_id_seq;
DROP TABLE public.active_storage_variant_records;
DROP SEQUENCE public.active_storage_blobs_id_seq;
DROP TABLE public.active_storage_blobs;
DROP SEQUENCE public.active_storage_attachments_id_seq;
DROP TABLE public.active_storage_attachments;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: dots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dots (
    id bigint NOT NULL,
    plan_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    x_position double precision DEFAULT 0.0,
    y_position double precision DEFAULT 0.0
);


--
-- Name: dots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dots_id_seq OWNED BY public.dots.id;


--
-- Name: floors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.floors (
    id bigint NOT NULL,
    number integer,
    project_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    fieldname integer
);


--
-- Name: floors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.floors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: floors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.floors_id_seq OWNED BY public.floors.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plans (
    id bigint NOT NULL,
    floor_id bigint NOT NULL,
    stage character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: project_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_users (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: project_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_users_id_seq OWNED BY public.project_users.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    owner_id bigint
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    tag_name character varying,
    task_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    content character varying,
    title character varying,
    dot_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    done boolean DEFAULT false
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: user_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_tasks (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    recommendation text
);


--
-- Name: user_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_tasks_id_seq OWNED BY public.user_tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    admin boolean DEFAULT false NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: dots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dots ALTER COLUMN id SET DEFAULT nextval('public.dots_id_seq'::regclass);


--
-- Name: floors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.floors ALTER COLUMN id SET DEFAULT nextval('public.floors_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: project_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_users ALTER COLUMN id SET DEFAULT nextval('public.project_users_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: user_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tasks ALTER COLUMN id SET DEFAULT nextval('public.user_tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
4	photo	Plan	1	4	2023-03-30 18:32:43.627568
6	photo	Plan	3	6	2023-03-30 18:47:15.370344
13	photo	Task	40	13	2023-04-07 15:17:46.783865
17	photo	Plan	31	17	2023-04-07 15:46:17.719736
18	photo	Plan	37	18	2023-04-07 15:46:31.381738
19	photo	Task	1	19	2023-04-07 16:12:27.03546
21	photo	Task	3	21	2023-04-07 16:38:24.152653
22	photo	Task	2	22	2023-04-07 16:42:47.267801
23	photo	Task	4	23	2023-04-07 16:47:21.824462
24	photo	Task	6	24	2023-04-07 17:04:56.898717
25	photo	Task	41	25	2023-04-07 17:11:02.545758
26	photo	Task	8	26	2023-04-07 17:14:38.423199
27	photo	Task	7	27	2023-04-07 17:16:32.521242
28	photo	Plan	2	28	2023-04-07 17:17:26.428099
29	photo	Task	9	29	2023-04-07 17:21:07.985736
30	photo	Task	11	30	2023-04-07 17:29:29.750246
31	photo	Task	10	31	2023-04-07 17:37:06.243909
32	photo	Task	39	32	2023-04-07 17:40:54.191756
33	photo	Task	42	33	2023-04-07 17:49:06.960996
34	photo	Task	43	34	2023-04-07 17:53:33.857495
35	photo	Task	5	35	2023-04-07 17:58:09.926501
36	photo	Task	44	36	2023-04-07 18:05:05.351531
38	photo	Task	13	38	2023-04-07 18:11:29.910594
39	photo	Task	45	39	2023-04-07 18:17:35.928057
40	photo	Task	47	40	2023-04-07 18:32:50.800356
41	photo	Task	48	41	2023-04-07 18:36:09.799717
42	photo	Task	46	42	2023-04-07 18:38:45.115031
43	photo	Task	49	43	2023-04-07 18:44:12.977482
44	photo	Plan	39	44	2023-04-07 18:45:13.380821
45	photo	Plan	38	45	2023-04-07 18:45:26.513145
46	photo	Task	50	46	2023-04-07 18:51:12.08032
47	photo	Task	51	47	2023-04-07 18:52:09.888273
55	photo	Plan	22	55	2023-04-07 19:05:19.184781
56	photo	Task	52	56	2023-04-07 19:08:55.533092
57	photo	Task	53	57	2023-04-07 19:13:35.414675
58	photo	Task	54	58	2023-04-07 19:16:50.327433
60	photo	Plan	23	60	2023-04-07 19:24:30.983894
61	photo	Task	55	61	2023-04-07 19:29:31.051579
63	photo	Plan	43	63	2023-04-07 19:59:28.153495
64	photo	Plan	24	64	2023-04-07 20:36:43.137735
65	photo	Task	56	65	2023-04-07 20:41:42.450881
66	photo	Plan	40	66	2023-04-07 20:43:37.937288
67	photo	Task	57	67	2023-04-07 20:47:55.635505
69	photo	Plan	41	69	2023-04-07 20:51:11.370641
70	photo	Plan	42	70	2023-04-07 20:51:30.738221
71	photo	Task	58	71	2023-04-07 20:56:54.106262
76	photo	Plan	48	76	2023-04-07 21:09:06.271005
79	photo	Plan	46	79	2023-04-07 21:35:42.419664
80	photo	Plan	47	80	2023-04-07 21:36:35.259889
81	photo	Task	59	81	2023-04-07 21:39:21.130256
82	photo	Task	60	82	2023-04-07 21:43:43.904362
83	photo	Task	62	83	2023-04-07 22:35:58.730654
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
4	m45wsgtijmubpjo2faktw63i2se1	IMG_9989.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	549741	N0aMCg58Val3mVrXs/cbZg==	2023-03-30 18:32:43.624431
6	hgj9t079hxq9663j34q4rpzizhog	IMG_9989.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	549741	N0aMCg58Val3mVrXs/cbZg==	2023-03-30 18:47:15.367302
21	r9vnsklynt942kgyd0ac8csdtl3d	BSI041_Photo_09.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	31767	0mJkDkA9cBm/BwrDxyrYnA==	2023-04-07 16:38:24.148762
33	kewctk4ykefbl3ila90jnenz1lnt	685b5584c323b6ecb44faba97f82c0f5.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	29149	m///ZBia8qk9wJylygvtXQ==	2023-04-07 17:49:06.958615
22	823v432ua5xbi5v273c05vz5b7y0	opener_stoneyard-boston-blend-foundation_gn.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	298999	1SNRzzxeQ3fLlgDvjNua1A==	2023-04-07 16:42:47.26534
55	ih59jpkc7w7n2grevs1lca4ptc8q	Screenshot 2023-04-07 at 13.03.30.png	image/png	{"identified":true,"analyzed":true}	cloudinary	556012	wm6IK8T36Rg8zcAGMX2wEA==	2023-04-07 19:05:19.183319
13	3qnphlho7emho2r26yugqjur0rgt	Screenshot 2023-04-07 at 09.14.25.png	image/png	{"identified":true,"analyzed":true}	cloudinary	101350	fy+Ic03ZJ1ux6vtiWiz2yg==	2023-04-07 15:17:46.780576
23	auanh071gpg3aep3cm6l53zh4zoa	RemovingLinoleum-c2cf304bbe694fa987b068304485d0ac-2.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	80566	GF63dz+m9CiM36AOhJQCrQ==	2023-04-07 16:47:21.821503
17	8w8luzgdur8yckffflndrx03afjt	First_Floor_Glebe_House.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	550530	168z5pAZf4kaaKDhY1MbPQ==	2023-04-07 15:46:17.716832
18	0o0pnltlyxcktv4onpcmrtw0jfjm	Garden_Glebe_House.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1985686	CXYxAsZ2+uTwC6LKl8etSg==	2023-04-07 15:46:31.380179
19	q67pvk8euvidb7kg478oq196bxlv	Foundation-Repair.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	1040337	y9NT6yI4rWpZDmqtMw47oQ==	2023-04-07 16:12:27.023715
24	qzeaxnxdr9u4olrkrndstjpc9sqm	hole.wall.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	24030	e7zxIzwcgBtp5/N6jH6zNQ==	2023-04-07 17:04:56.895904
25	7jss5jeau1debr7emurwai11ym52	WINDOW-REPAIR-3.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	196199	akC0+I+PFVZFl4nOsJaFng==	2023-04-07 17:11:02.542939
26	wpzffftnauhxy0j4qoc2dlfi6k2c	Rising-Damp-Internal-Wall-tidemark.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	80152	hgEtT3YDsDQgWvGSUU0M9w==	2023-04-07 17:14:38.420132
27	3pvl6nh4eu6ijwygsdkzglk80ruo	MVIMG_20180211_131220.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	258874	5dy0OAeJs0SLee8ohy8hHw==	2023-04-07 17:16:32.518856
28	20agnegkvbbsu7crlmf8nazcz2rg	Ground_Floor_Glebe_House.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	549741	N0aMCg58Val3mVrXs/cbZg==	2023-04-07 17:17:26.426128
29	s1dib35y4ubf7bvvo22f6h2688fn	01mlfvid85wc.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	795205	ycMAeGwdHmCpzRoS0F7vUw==	2023-04-07 17:21:07.983609
30	6redq7fdbuto85pb684phwqgp82c	d331091e50db6613f8fc2053d3f63e9f.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	171193	dMdupvvmrhEWjaeXkQMNAQ==	2023-04-07 17:29:29.746725
31	8kaxhn0quucwrg16iik5a6evofc5	main-qimg-943a367bf3b7f74c773dfa9121752372-lq.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	79522	P0yiP6ibaoo7ORZdgfLASQ==	2023-04-07 17:37:06.241315
32	5pkdaliqctv94a2v9io8z48t90rs	s-l1600.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1275619	jjyiz5zLXlJdq8ZpaY1btQ==	2023-04-07 17:40:54.18852
34	5sltschhgykz2ydmokug8mpf6s3i	Screenshot 2023-04-07 at 11.53.13.png	image/png	{"identified":true,"analyzed":true}	cloudinary	4616247	/r123/9hxyc7jRQd1ixrzg==	2023-04-07 17:53:33.856276
35	px74ili0n3pfj99nssczs43zovjs	4986-d85e22acb89f05ed42e2165218bb7ff4.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	40794	SMPmPQ9alqKxWQEDrHkg7Q==	2023-04-07 17:58:09.920398
36	ds2thqlij2crnivwx95jx91eeugy	Screenshot 2023-04-07 at 12.04.52.png	image/png	{"identified":true,"analyzed":true}	cloudinary	4663419	ge597RWTx5OD0sbjE+3nSA==	2023-04-07 18:05:05.350283
40	w8nb0as1unwam2o6vcvm53m3qezo	Paint-Trim-and-Crown-Molding-901x423-2.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	121711	hLe7knu4KIQjWPSp4r7luQ==	2023-04-07 18:32:50.798262
38	u1tzufkgu7qdq1yilpkh93mmebd6	Screenshot 2023-04-07 at 12.11.19.png	image/png	{"identified":true,"analyzed":true}	cloudinary	2319957	YS/pNdSCKnXDsj76fC+c8Q==	2023-04-07 18:11:29.908862
39	w28ztfgayc76aiu2xfhppq29b3jo	Screenshot 2023-04-07 at 12.16.19.png	image/png	{"identified":true,"analyzed":true}	cloudinary	2550778	rwZ5JRLLOlDV3fEr0MkTSg==	2023-04-07 18:17:35.926397
41	5sq305xw16c8ccsgxls7jpgcg5si	1.+BB+Mirror+'Avarice'.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	243265	buveQn6Bv2pD4cRVEvJFtw==	2023-04-07 18:36:09.797818
42	tstnzei134l0l3uix9i704putk4a	Screenshot 2023-04-07 at 12.38.32.png	image/png	{"identified":true,"analyzed":true}	cloudinary	4189165	eYPfGLQqPz9tEXMROgouBQ==	2023-04-07 18:38:45.113718
43	dsmn4y2b32wfxrph3bl41p58a134	2497114a8b7d20560d9148a578121c82--steel-windows-steel-doors.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	49716	JPunUl+zCdYX6SG1xlOvAg==	2023-04-07 18:44:12.975465
44	hvmk6eqlsel8025gpp65ef4geldt	Garden_Glebe_House.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1985686	CXYxAsZ2+uTwC6LKl8etSg==	2023-04-07 18:45:13.378895
45	g22lw2m6jw8f4l05rjuuoi2wq6m8	Garden_Glebe_House.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1985686	CXYxAsZ2+uTwC6LKl8etSg==	2023-04-07 18:45:26.511371
46	ku6obixphznpbzwqxhmjq00rpi54	0_JTRtreeschoppeddown251120_04jpeg.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	264362	vNmpqi3u5h819iM7TPnJ4A==	2023-04-07 18:51:12.077932
47	wi2m4bkp6xh4poc9ir20e1khgzte	TELEMMGLPICT000193434602_trans_NvBQzQNjv4BqrpfQw2hJyG_yckwxPAr0go9KzD8cVu9iguqnaKUswZA.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	620259	dyJr8U96hZDa4enl/JtFOQ==	2023-04-07 18:52:09.885701
56	zo8oa2ldkevz7n0iwc3ih19kszg1	Screenshot 2023-04-07 at 13.08.16.png	image/png	{"identified":true,"analyzed":true}	cloudinary	9484	nbJuMpkiu5ntT7DBhNhEFg==	2023-04-07 19:08:55.530588
57	4bcn8ytgowy3p1fnsio2xmxbgp8w	Screenshot 2023-04-07 at 13.11.32.png	image/png	{"identified":true,"analyzed":true}	cloudinary	30319	31C3m58y9scHaxgujtJR0w==	2023-04-07 19:13:35.411004
58	9bq75mtxtoum2ijx03f7s3i7iis4	Screenshot 2023-04-07 at 13.16.40.png	image/png	{"identified":true,"analyzed":true}	cloudinary	7989	3N6vaC3GqPfxgidu1wTdug==	2023-04-07 19:16:50.321151
60	uekkj5885qwzwzzxxgfvo000pst0	Screenshot 2023-04-07 at 13.23.20.png	image/png	{"identified":true,"analyzed":true}	cloudinary	546245	tKSgqqzBSDS4T4k9QsHB9g==	2023-04-07 19:24:30.975765
61	egvmt8ddq60ncml7lq5eme8yax82	Screenshot 2023-04-07 at 13.28.14.png	image/png	{"identified":true,"analyzed":true}	cloudinary	28152	CDfbv3KUrkGTrTHme61iUQ==	2023-04-07 19:29:31.049344
63	i0llthfgqqqqsk7tb5x3q5oa90mo	IMG_8788.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	668343	YeMcXo/sxsWCkBIxWd3V8Q==	2023-04-07 19:59:28.151777
64	9fu1ni1s8qnl0xagoql3wtxea5ls	Screenshot 2023-04-07 at 14.35.49.png	image/png	{"identified":true,"analyzed":true}	cloudinary	642598	Ol7BnJJQEQYoX/fiSvq3kg==	2023-04-07 20:36:43.133955
65	xv4bsdk6ogt86dqajiqu2y2lwqof	Screenshot 2023-04-07 at 14.40.40.png	image/png	{"identified":true,"analyzed":true}	cloudinary	94476	fJZIPCEBdfUCIFtQFDXkpw==	2023-04-07 20:41:42.448849
66	nyz8hhquqgv8mcu414yxvp3jqfor	Screenshot 2023-04-07 at 14.42.22.png	image/png	{"identified":true,"analyzed":true}	cloudinary	490119	6vy6i1x0Hq5JWCMAQGFPqA==	2023-04-07 20:43:37.934623
67	mkzwfbp20yjknb0wfb88qats6stu	Screenshot 2023-04-07 at 14.47.26.png	image/png	{"identified":true,"analyzed":true}	cloudinary	46307	KK5g8ShxfgeTbA2zMt/yMQ==	2023-04-07 20:47:55.633646
69	0b4ezqzyvpw1jj78qymbahwdpb50	Screenshot 2023-04-07 at 14.49.50.png	image/png	{"identified":true,"analyzed":true}	cloudinary	261177	x8YLlHFlSEyCU4Dcv+7+nQ==	2023-04-07 20:51:11.367769
70	tjn34g32emtdjy60kbi9tqex9503	Screenshot 2023-04-07 at 14.49.50.png	image/png	{"identified":true,"analyzed":true}	cloudinary	261177	x8YLlHFlSEyCU4Dcv+7+nQ==	2023-04-07 20:51:30.733857
71	k3jblvca8yvbh27mse8uox6kmnw9	Screenshot 2023-04-07 at 14.56.17.png	image/png	{"identified":true,"analyzed":true}	cloudinary	69624	W6b1i61r+6m1WMvzU2I/bA==	2023-04-07 20:56:54.104215
76	kdnnq0o83lvgbpm8zmdyuk8oycpv	Screenshot 2023-04-07 at 15.02.01.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1011099	AUYjquBHyMh2f+c/n8d09g==	2023-04-07 21:09:06.26903
79	058hpxt30el4gxxssc3tmpsupfse	Screenshot 2023-04-07 at 15.35.33.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1119334	wKY76Z+2uXaaG0ILEctaKg==	2023-04-07 21:35:42.417872
80	ac02isj2t3sry0v26yq2gur8x54s	Screenshot 2023-04-07 at 15.36.22.png	image/png	{"identified":true,"analyzed":true}	cloudinary	688466	Pl9vLwAhj6rxCWZ37+D4xg==	2023-04-07 21:36:35.25604
81	uycn7ncrjwjofwblv5n0b4fidm34	Mirror Finish.png	image/png	{"identified":true,"analyzed":true}	cloudinary	2144765	LWNGJv+QaCND/9kNsjZBog==	2023-04-07 21:39:21.12925
82	kw5198jsdtoa0dv3ca07n16qnh3n	il_570xN.1518172797_j1yy.jpg.webp	image/webp	{"identified":true,"analyzed":true}	cloudinary	78966	jeVPZVOiYky8mkate0BLZA==	2023-04-07 21:43:43.902159
83	xcb0dxgalhb0v4d490d7dkxcl1aa	wood-floor-stains.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	27490	12nQZMl7/0hgPWN+Htfi6g==	2023-04-07 22:35:58.728858
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-03-30 17:50:50.262927	2023-03-30 17:50:50.262927
\.


--
-- Data for Name: dots; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dots (id, plan_id, created_at, updated_at, x_position, y_position) FROM stdin;
41	22	2023-04-07 19:14:04.168282	2023-04-07 20:20:33.633452	143.86956787109375	132.0108642578125
40	22	2023-04-07 19:09:37.71635	2023-04-07 19:17:29.376871	40.86956787109375	262.0108642578125
42	23	2023-04-07 19:24:42.044211	2023-04-07 19:24:59.94443	93.86956787109375	364.0108642578125
3	1	2023-03-30 17:50:51.443081	2023-04-07 22:47:48.857918	88.8182	279.003
82	1	2023-04-07 22:33:17.378032	2023-04-07 22:49:01.867584	104.818	374.003
86	1	2023-04-07 22:48:18.444628	2023-04-07 22:50:09.122122	118.818	144.912
26	1	2023-04-03 17:42:54.794341	2023-04-07 22:51:45.370414	24.8696	211.967
5	3	2023-03-30 17:50:51.453277	2023-04-07 18:06:55.811191	209.86956787109375	95.14130401611328
31	3	2023-04-07 17:41:13.768214	2023-04-07 18:11:50.533843	29.86956787109375	208.57608032226562
35	2	2023-04-07 18:30:40.949808	2023-04-07 22:51:56.858714	81.8182	276.366
33	3	2023-04-07 18:06:04.447895	2023-04-07 18:12:23.009757	83.86956787109375	285.0108642578125
34	3	2023-04-07 18:12:00.976522	2023-04-07 22:52:18.057317	157.87	67.0109
72	22	2023-04-07 20:23:33.13735	2023-04-07 20:29:54.899533	187.86956787109375	468.8369598388672
73	22	2023-04-07 20:23:40.59315	2023-04-07 20:30:03.400828	216.86956787109375	465.8369598388672
32	2	2023-04-07 17:58:21.693808	2023-04-07 22:52:30.348414	158.818	64.3665
70	22	2023-04-07 20:20:03.078618	2023-04-07 20:30:13.422244	161.86956787109375	468.8369598388672
36	2	2023-04-07 18:40:28.584077	2023-04-07 22:53:31.706202	31.8696	208.011
1	1	2023-03-30 17:50:51.428493	2023-04-07 22:53:53.633025	13.8182	57.0028
75	24	2023-04-07 20:32:42.028182	2023-04-07 20:39:07.445146	310.86956787109375	205.0108642578125
74	40	2023-04-07 20:23:51.917605	2023-04-07 20:48:10.492501	38.86956787109375	99.53260803222656
47	40	2023-04-07 19:50:49.775245	2023-04-07 20:48:13.330663	38.86956787109375	76.53260803222656
48	40	2023-04-07 19:51:13.982529	2023-04-07 20:48:19.607721	227.86956787109375	19.532608032226562
37	37	2023-04-07 18:45:42.231254	2023-04-07 18:47:41.401303	183.86956787109375	169.0108642578125
76	41	2023-04-07 20:50:06.570799	2023-04-07 20:50:37.049892	383.86956787109375	335.0108642578125
39	22	2023-04-07 19:05:41.859922	2023-04-07 19:55:36.276615	306.86956787109375	32.0108642578125
30	22	2023-04-07 15:15:53.528701	2023-04-07 19:05:34.361285	200.86956787109375	56.0108642578125
77	42	2023-04-07 20:51:40.469801	2023-04-07 20:52:32.878096	382.86956787109375	338.0108642578125
23	2	2023-03-30 19:37:07.266264	2023-04-07 22:55:08.840847	205.818	95.0028
4	2	2023-03-30 17:50:51.448257	2023-04-07 22:55:21.326406	105.818	78.0028
66	43	2023-04-07 20:00:18.810835	2023-04-07 20:01:05.866169	241.86956787109375	112.0108642578125
67	43	2023-04-07 20:00:39.708548	2023-04-07 20:01:14.612862	153.86956787109375	231.0108642578125
2	1	2023-03-30 17:50:51.439203	2023-04-07 22:23:18.240809	157	61
38	38	2023-04-07 18:51:18.672375	2023-04-07 22:24:52.531665	183.87	169.707
79	46	2023-04-07 21:29:30.091341	2023-04-07 22:26:37.415438	137.87	355.011
80	46	2023-04-07 21:39:30.771079	2023-04-07 22:26:44.261764	112.87	168.011
81	31	2023-04-07 22:23:10.086407	2023-04-07 22:39:17.586172	48.8182	92.0029
83	31	2023-04-07 22:39:33.800004	2023-04-07 22:39:58.786811	110.818	139.003
84	31	2023-04-07 22:40:18.34666	2023-04-07 22:40:37.133548	214.818	140.003
\.


--
-- Data for Name: floors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.floors (id, number, project_id, created_at, updated_at, fieldname) FROM stdin;
1	0	1	2023-03-30 17:50:51.395104	2023-03-30 17:50:51.395104	\N
6	0	2	2023-04-04 13:35:50.572934	2023-04-04 13:35:50.572934	\N
7	0	3	2023-04-04 13:37:32.379118	2023-04-04 13:37:32.379118	\N
8	0	4	2023-04-04 13:59:14.368312	2023-04-04 13:59:14.368312	\N
11	1	1	2023-04-07 15:44:32.915077	2023-04-07 15:44:32.915077	\N
13	-1	1	2023-04-07 15:44:47.542771	2023-04-07 15:44:47.542771	\N
14	1	4	2023-04-07 19:36:12.072062	2023-04-07 19:36:12.072062	\N
15	0	5	2023-04-07 19:59:20.736871	2023-04-07 19:59:20.736871	\N
16	0	6	2023-04-07 21:02:18.209111	2023-04-07 21:02:18.209111	\N
17	0	7	2023-04-07 21:04:41.039066	2023-04-07 21:04:41.039066	\N
18	0	8	2023-04-07 21:22:09.968796	2023-04-07 21:22:09.968796	\N
19	0	9	2023-04-07 21:44:20.767494	2023-04-07 21:44:20.767494	\N
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.plans (id, floor_id, stage, created_at, updated_at) FROM stdin;
49	17	Existing	2023-04-07 21:04:41.043684	2023-04-07 21:04:41.043684
50	17	Build	2023-04-07 21:04:41.048924	2023-04-07 21:04:41.048924
51	17	Interior	2023-04-07 21:04:41.05272	2023-04-07 21:04:41.05272
1	1	Existing	2023-03-30 17:50:51.407385	2023-03-30 18:32:43.629091
3	1	Interior	2023-03-30 17:50:51.412809	2023-03-30 18:47:15.371774
48	16	Interior	2023-04-07 21:02:18.238553	2023-04-07 21:09:06.27313
52	18	Existing	2023-04-07 21:22:09.974821	2023-04-07 21:22:09.974821
53	18	Build	2023-04-07 21:22:09.979662	2023-04-07 21:22:09.979662
54	18	Interior	2023-04-07 21:22:09.983203	2023-04-07 21:22:09.983203
46	16	Existing	2023-04-07 21:02:18.213669	2023-04-07 21:35:42.421078
16	6	Existing	2023-04-04 13:35:50.586618	2023-04-04 13:35:50.586618
17	6	Build	2023-04-04 13:35:50.596793	2023-04-04 13:35:50.596793
18	6	Interior	2023-04-04 13:35:50.601355	2023-04-04 13:35:50.601355
19	7	Existing	2023-04-04 13:37:32.383565	2023-04-04 13:37:32.383565
20	7	Build	2023-04-04 13:37:32.393402	2023-04-04 13:37:32.393402
21	7	Interior	2023-04-04 13:37:32.402554	2023-04-04 13:37:32.402554
47	16	Build	2023-04-07 21:02:18.236624	2023-04-07 21:36:35.262262
55	19	Existing	2023-04-07 21:44:20.772148	2023-04-07 21:44:20.772148
56	19	Build	2023-04-07 21:44:20.776362	2023-04-07 21:44:20.776362
57	19	Interior	2023-04-07 21:44:20.779548	2023-04-07 21:44:20.779548
32	11	Build	2023-04-07 15:44:32.923068	2023-04-07 15:44:32.923068
33	11	Interior	2023-04-07 15:44:32.926175	2023-04-07 15:44:32.926175
31	11	Existing	2023-04-07 15:44:32.919809	2023-04-07 15:46:17.721329
37	13	Existing	2023-04-07 15:44:47.54894	2023-04-07 15:46:31.383018
2	1	Build	2023-03-30 17:50:51.411241	2023-04-07 17:17:26.429489
39	13	Interior	2023-04-07 15:44:47.55708	2023-04-07 18:45:13.382249
38	13	Build	2023-04-07 15:44:47.552803	2023-04-07 18:45:26.514295
22	8	Existing	2023-04-04 13:59:14.379436	2023-04-07 19:05:19.186451
23	8	Build	2023-04-04 13:59:14.385841	2023-04-07 19:24:30.985424
44	15	Build	2023-04-07 19:59:20.745218	2023-04-07 19:59:20.745218
45	15	Interior	2023-04-07 19:59:20.74847	2023-04-07 19:59:20.74847
43	15	Existing	2023-04-07 19:59:20.741286	2023-04-07 19:59:28.154626
24	8	Interior	2023-04-04 13:59:14.396813	2023-04-07 20:36:43.139847
40	14	Existing	2023-04-07 19:36:12.081534	2023-04-07 20:43:37.938353
41	14	Build	2023-04-07 19:36:12.087545	2023-04-07 20:51:11.3722
42	14	Interior	2023-04-07 19:36:12.09225	2023-04-07 20:51:30.740072
\.


--
-- Data for Name: project_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project_users (id, project_id, user_id, created_at, updated_at) FROM stdin;
5	4	1	2023-04-04 13:59:14.413351	2023-04-04 13:59:14.413351
7	1	2	2023-04-05 15:37:10.218431	2023-04-05 15:37:10.218431
10	1	1	2023-04-06 02:24:43.537287	2023-04-06 02:24:43.537287
11	1	4	2023-04-06 02:24:51.787247	2023-04-06 02:24:51.787247
12	1	2	2023-04-07 14:18:49.892773	2023-04-07 14:18:49.892773
13	4	2	2023-04-07 15:23:38.640936	2023-04-07 15:23:38.640936
15	6	1	2023-04-07 21:22:28.775534	2023-04-07 21:22:28.775534
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects (id, title, created_at, updated_at, owner_id) FROM stdin;
2	Extension	2023-04-04 13:35:50.555729	2023-04-04 13:35:50.555729	1
3	New Project	2023-04-04 13:37:32.362504	2023-04-04 13:37:32.362504	1
1	Glebe House	2023-03-30 17:50:51.372384	2023-04-07 14:19:07.834201	1
4	FAQs	2023-04-04 13:59:14.34586	2023-04-07 19:30:44.207026	1
5	test reloads	2023-04-07 19:59:20.729921	2023-04-07 19:59:20.729921	1
6	Captains Chair	2023-04-07 21:02:18.202492	2023-04-07 21:02:18.202492	1
7	hkbjhb	2023-04-07 21:04:41.031689	2023-04-07 21:04:41.031689	1
8	HELLO PANA RABBIT	2023-04-07 21:22:09.956679	2023-04-07 21:22:09.956679	1
9	Demo Project	2023-04-07 21:44:20.758145	2023-04-07 21:44:20.758145	1
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20230320174625
20230320183413
20230321174442
20230321180021
20230321180201
20230321180348
20230321180409
20230321180537
20230321181843
20230322171619
20230322172006
20230322232640
20230324221234
20230327163158
20230327164640
20230327221829
20230327222005
20230404222108
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, tag_name, task_id, created_at, updated_at) FROM stdin;
227	parquet	44	2023-04-07 18:05:34.085936	2023-04-07 18:05:34.085936
228	cannage	44	2023-04-07 18:05:34.090216	2023-04-07 18:05:34.090216
229	bois	44	2023-04-07 18:05:34.093431	2023-04-07 18:05:34.093431
230	entrance	44	2023-04-07 18:05:34.096629	2023-04-07 18:05:34.096629
246	carpet	45	2023-04-07 18:18:43.718979	2023-04-07 18:18:43.718979
247	entrance	45	2023-04-07 18:18:43.723346	2023-04-07 18:18:43.723346
251	crown molding	47	2023-04-07 18:32:51.991037	2023-04-07 18:32:51.991037
252	molding	47	2023-04-07 18:32:51.998028	2023-04-07 18:32:51.998028
253	living room	47	2023-04-07 18:32:52.003636	2023-04-07 18:32:52.003636
263	clear	50	2023-04-07 18:51:13.516367	2023-04-07 18:51:13.516367
264	trees	50	2023-04-07 18:51:13.522705	2023-04-07 18:51:13.522705
265	exterior	50	2023-04-07 18:51:13.528472	2023-04-07 18:51:13.528472
266	garden	50	2023-04-07 18:51:13.533089	2023-04-07 18:51:13.533089
34	Utroque vulgivagus contabesco. Corrumpo sunt vespillo.	12	2023-03-30 17:50:51.670356	2023-03-30 17:50:51.670356
35	Succurro totam creta. Sordeo apparatus ceno.	12	2023-03-30 17:50:51.671857	2023-03-30 17:50:51.671857
36	Crebro peccatus terga. Admoveo nesciunt strues.	12	2023-03-30 17:50:51.673342	2023-03-30 17:50:51.673342
294	basement	53	2023-04-07 19:13:46.887885	2023-04-07 19:13:46.887885
295	floors	53	2023-04-07 19:13:46.891722	2023-04-07 19:13:46.891722
296	floor	53	2023-04-07 19:13:46.894838	2023-04-07 19:13:46.894838
173	Linoleum	4	2023-04-07 16:47:23.050191	2023-04-07 16:47:23.050191
174	entrance	4	2023-04-07 16:47:23.054972	2023-04-07 16:47:23.054972
175	ground floor	4	2023-04-07 16:47:23.060268	2023-04-07 16:47:23.060268
179	drywall	6	2023-04-07 17:04:57.756484	2023-04-07 17:04:57.756484
180	hole	6	2023-04-07 17:04:57.762397	2023-04-07 17:04:57.762397
181	living room 	6	2023-04-07 17:04:57.765978	2023-04-07 17:04:57.765978
297	add	53	2023-04-07 19:13:46.898025	2023-04-07 19:13:46.898025
298	new	53	2023-04-07 19:13:46.901025	2023-04-07 19:13:46.901025
186	French windows	41	2023-04-07 17:11:52.385967	2023-04-07 17:11:52.385967
187	living room	41	2023-04-07 17:11:52.389453	2023-04-07 17:11:52.389453
299	delete	53	2023-04-07 19:13:46.904357	2023-04-07 19:13:46.904357
300	new dot	54	2023-04-07 19:16:51.156376	2023-04-07 19:16:51.156376
301	dot	54	2023-04-07 19:16:51.163	2023-04-07 19:16:51.163
205	wisteria	10	2023-04-07 17:37:07.406957	2023-04-07 17:37:07.406957
206	climber	10	2023-04-07 17:37:07.411603	2023-04-07 17:37:07.411603
207	exterior	10	2023-04-07 17:37:07.415498	2023-04-07 17:37:07.415498
213	pelmet	42	2023-04-07 17:48:32.902672	2023-04-07 17:48:32.902672
214	curtain	42	2023-04-07 17:48:32.910203	2023-04-07 17:48:32.910203
215	measure	42	2023-04-07 17:48:32.914808	2023-04-07 17:48:32.914808
216	living room	42	2023-04-07 17:48:32.919425	2023-04-07 17:48:32.919425
220	fabric	43	2023-04-07 17:53:48.037662	2023-04-07 17:53:48.037662
221	curtains	43	2023-04-07 17:53:48.045568	2023-04-07 17:53:48.045568
222	living room	43	2023-04-07 17:53:48.04857	2023-04-07 17:53:48.04857
223	roman	3	2023-04-07 17:54:29.912486	2023-04-07 17:54:29.912486
224	foundations	3	2023-04-07 17:54:29.915707	2023-04-07 17:54:29.915707
225	inspect	3	2023-04-07 17:54:29.918394	2023-04-07 17:54:29.918394
226	urgent	3	2023-04-07 17:54:29.921649	2023-04-07 17:54:29.921649
302	move	54	2023-04-07 19:16:51.168303	2023-04-07 19:16:51.168303
303	how to	54	2023-04-07 19:16:51.173232	2023-04-07 19:16:51.173232
304	tutorial	54	2023-04-07 19:16:51.178926	2023-04-07 19:16:51.178926
310	how to	40	2023-04-07 20:34:11.161794	2023-04-07 20:34:11.161794
311	tutorial	40	2023-04-07 20:34:11.164224	2023-04-07 20:34:11.164224
312	dots	40	2023-04-07 20:34:11.165624	2023-04-07 20:34:11.165624
313	new	40	2023-04-07 20:34:11.167046	2023-04-07 20:34:11.167046
314	add	40	2023-04-07 20:34:11.168523	2023-04-07 20:34:11.168523
315	task	56	2023-04-07 20:41:43.387066	2023-04-07 20:41:43.387066
316	see	56	2023-04-07 20:41:43.413496	2023-04-07 20:41:43.413496
317	all	56	2023-04-07 20:41:43.419329	2023-04-07 20:41:43.419329
318	tasks	56	2023-04-07 20:41:43.423425	2023-04-07 20:41:43.423425
319	dots	56	2023-04-07 20:41:43.427202	2023-04-07 20:41:43.427202
320	dot	56	2023-04-07 20:41:43.430701	2023-04-07 20:41:43.430701
321	how to	56	2023-04-07 20:41:43.438207	2023-04-07 20:41:43.438207
322	tutorial	56	2023-04-07 20:41:43.441794	2023-04-07 20:41:43.441794
323	how to	57	2023-04-07 20:47:56.66196	2023-04-07 20:47:56.66196
324	tasks	57	2023-04-07 20:47:56.666268	2023-04-07 20:47:56.666268
325	task	57	2023-04-07 20:47:56.668436	2023-04-07 20:47:56.668436
326	search	57	2023-04-07 20:47:56.671198	2023-04-07 20:47:56.671198
327	tag	57	2023-04-07 20:47:56.673176	2023-04-07 20:47:56.673176
328	tags	57	2023-04-07 20:47:56.67587	2023-04-07 20:47:56.67587
334	structure	59	2023-04-07 21:39:22.720003	2023-04-07 21:39:22.720003
335	polished	59	2023-04-07 21:39:22.728735	2023-04-07 21:39:22.728735
336	steel	59	2023-04-07 21:39:22.732247	2023-04-07 21:39:22.732247
337	metal	59	2023-04-07 21:39:22.735549	2023-04-07 21:39:22.735549
338	legs	59	2023-04-07 21:39:22.739215	2023-04-07 21:39:22.739215
167	foundations	1	2023-04-07 16:40:18.213795	2023-04-07 16:40:18.213795
168	existing	1	2023-04-07 16:40:18.217246	2023-04-07 16:40:18.217246
169	stone	2	2023-04-07 16:42:48.554998	2023-04-07 16:42:48.554998
170	foundation	2	2023-04-07 16:42:48.560098	2023-04-07 16:42:48.560098
171	source	2	2023-04-07 16:42:48.565318	2023-04-07 16:42:48.565318
172	cover	2	2023-04-07 16:42:48.569873	2023-04-07 16:42:48.569873
176	humidity check	5	2023-04-07 16:55:16.930727	2023-04-07 16:55:16.930727
177	Mr Cook	5	2023-04-07 16:55:16.934844	2023-04-07 16:55:16.934844
178	entrance	5	2023-04-07 16:55:16.937897	2023-04-07 16:55:16.937897
237	bathroom	13	2023-04-07 18:11:31.595218	2023-04-07 18:11:31.595218
238	wallpaper	13	2023-04-07 18:11:31.600602	2023-04-07 18:11:31.600602
239	ground floor	13	2023-04-07 18:11:31.604192	2023-04-07 18:11:31.604192
191	damp	8	2023-04-07 17:14:46.050378	2023-04-07 17:14:46.050378
192	stain	8	2023-04-07 17:14:46.054064	2023-04-07 17:14:46.054064
193	living room 	8	2023-04-07 17:14:46.057452	2023-04-07 17:14:46.057452
197	crown molding	7	2023-04-07 17:16:49.221448	2023-04-07 17:16:49.221448
198	molding	7	2023-04-07 17:16:49.224952	2023-04-07 17:16:49.224952
199	living room	7	2023-04-07 17:16:49.2281	2023-04-07 17:16:49.2281
200	ivy damage	9	2023-04-07 17:21:09.368232	2023-04-07 17:21:09.368232
201	outside facade	9	2023-04-07 17:21:09.373905	2023-04-07 17:21:09.373905
202	stone	11	2023-04-07 17:29:31.009656	2023-04-07 17:29:31.009656
203	exterior	11	2023-04-07 17:29:31.014609	2023-04-07 17:29:31.014609
204	options	11	2023-04-07 17:29:31.018796	2023-04-07 17:29:31.018796
208	sink	39	2023-04-07 17:40:55.759807	2023-04-07 17:40:55.759807
209	tap	39	2023-04-07 17:40:55.765004	2023-04-07 17:40:55.765004
210	buy	39	2023-04-07 17:40:55.785604	2023-04-07 17:40:55.785604
211	bathroom	39	2023-04-07 17:40:55.789646	2023-04-07 17:40:55.789646
212	ground floor	39	2023-04-07 17:40:55.792288	2023-04-07 17:40:55.792288
254	mirror	48	2023-04-07 18:36:12.65798	2023-04-07 18:36:12.65798
255	living room	48	2023-04-07 18:36:12.681032	2023-04-07 18:36:12.681032
256	paint	46	2023-04-07 18:38:47.860239	2023-04-07 18:38:47.860239
257	wall	46	2023-04-07 18:38:47.86497	2023-04-07 18:38:47.86497
258	living room	46	2023-04-07 18:38:47.869729	2023-04-07 18:38:47.869729
259	inspiration	49	2023-04-07 18:44:13.974075	2023-04-07 18:44:13.974075
260	inspo	49	2023-04-07 18:44:13.982913	2023-04-07 18:44:13.982913
261	living room	49	2023-04-07 18:44:13.986238	2023-04-07 18:44:13.986238
262	French windows	49	2023-04-07 18:44:13.989057	2023-04-07 18:44:13.989057
267	pool	51	2023-04-07 18:52:11.364616	2023-04-07 18:52:11.364616
268	exterior	51	2023-04-07 18:52:11.370995	2023-04-07 18:52:11.370995
269	garden	51	2023-04-07 18:52:11.37694	2023-04-07 18:52:11.37694
284	How to	52	2023-04-07 19:09:13.946207	2023-04-07 19:09:13.946207
285	tutorial	52	2023-04-07 19:09:13.950972	2023-04-07 19:09:13.950972
286	stages	52	2023-04-07 19:09:13.955066	2023-04-07 19:09:13.955066
287	floor plans	52	2023-04-07 19:09:13.959573	2023-04-07 19:09:13.959573
305	how to	55	2023-04-07 19:29:32.083003	2023-04-07 19:29:32.083003
306	tutorial	55	2023-04-07 19:29:32.087835	2023-04-07 19:29:32.087835
307	FAQ	55	2023-04-07 19:29:32.091421	2023-04-07 19:29:32.091421
308	new	55	2023-04-07 19:29:32.093855	2023-04-07 19:29:32.093855
309	plan	55	2023-04-07 19:29:32.097262	2023-04-07 19:29:32.097262
329	how to	58	2023-04-07 20:56:55.08435	2023-04-07 20:56:55.08435
330	tutorial	58	2023-04-07 20:56:55.08958	2023-04-07 20:56:55.08958
331	add	58	2023-04-07 20:56:55.095506	2023-04-07 20:56:55.095506
332	collaborators	58	2023-04-07 20:56:55.099101	2023-04-07 20:56:55.099101
333	tasks	58	2023-04-07 20:56:55.102888	2023-04-07 20:56:55.102888
341	fabric	60	2023-04-07 22:27:39.549022	2023-04-07 22:27:39.549022
342	red	60	2023-04-07 22:27:39.553502	2023-04-07 22:27:39.553502
343	Electric	62	2023-04-07 22:35:34.847043	2023-04-07 22:35:34.847043
344	Plumbing	62	2023-04-07 22:35:34.85098	2023-04-07 22:35:34.85098
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tasks (id, content, title, dot_id, created_at, updated_at, done) FROM stdin;
12	Over the land there lies a long shadow	That Good Night	5	2023-03-30 17:50:51.454496	2023-03-30 17:50:51.454496	f
1	need to clear unsteady foundation and recover	Foundation recover with stone	1	2023-03-30 17:50:51.434898	2023-04-07 16:40:18.199308	f
53	To add a new floor, press the "+" button and to add a floor underground (i.e. basement floors) press the "-" button. To delete a floor, press the trash can next to the floor you want to delete.	How to add/delete a floor	40	2023-04-07 19:13:35.397434	2023-04-07 19:13:46.870794	f
42	Measure French windows for curtains that go the the floor and a pelmet at the top	Measure for curtains	31	2023-04-07 17:48:32.889902	2023-04-07 17:49:06.963028	f
2	See if we can use locally sourced stone for the cover of the foundations. Ask Southleigh Farm if they have some stones from clearing new field. Farmer Brian's No.- 01235 531 232	Foundations Cover Options	1	2023-03-30 17:50:51.436672	2023-04-07 16:42:47.269337	f
4	Pull up linoleum floor and check for damp or rot in floor boards underneath	Remove linoleum Floor	2	2023-03-30 17:50:51.440488	2023-04-07 16:47:21.828074	f
46	Farrow & Ball colour options: "Bone" or "Purbeck stone"	Choose colour paint for walls	33	2023-04-07 18:26:57.050644	2023-04-07 18:38:45.116417	f
43	Pierre Frey and Colefaxa and Fowler options for curtain fabrics	Choose curtain fabric	31	2023-04-07 17:53:33.847877	2023-04-07 17:53:48.012278	f
3	Foundations could possible be roman. Have someone from national heritage come to check them 	1 - Have National Heritage inspect walls 	1	2023-03-30 17:50:51.437969	2023-04-07 17:54:29.898315	t
49	I like this French windows for the living room	French windows Inso	36	2023-04-07 18:44:12.964606	2023-04-07 18:44:12.978449	f
6	Cut, put in new piece of drywall and cover hole in drywall	Hole in drywall	3	2023-03-30 17:50:51.444326	2023-04-07 17:04:56.900815	f
5	Bring in Mr Cook (+44 7831 861 262) to check for humidity levels if we need to reinsulate entrance	Check humidity levels in the entrance	2	2023-03-30 17:50:51.44175	2023-04-07 17:58:09.929873	f
41	Hinges have rusted and frame has warped. Need to completely pull out French windows with frame and put in new ones. Will look at some options with double glazing, because wind blows towards this side of the house	Replace French Windows	26	2023-04-07 17:11:02.527035	2023-04-07 17:11:52.372951	f
50	if we could chop these trees down to fire wood and cover them 	Clear cut trees east of house	37	2023-04-07 18:51:12.050057	2023-04-07 18:51:12.082509	f
8	Moisture stains need to check if they are coming from a leak, or damp or something else	Check damp on wall	3	2023-03-30 17:50:51.447004	2023-04-07 17:14:46.038741	f
44	parquet de bois or parquet cannage for entrance	choose Parquet for entrance	32	2023-04-07 18:05:05.337131	2023-04-07 18:05:34.077893	f
7	Someone has done a terrible job installing the crown molding. Needs to be completely removed before we decide what to replace it with	Crown Moulding needs redoing	3	2023-03-30 17:50:51.445721	2023-04-07 17:16:32.526558	f
9	Clear the ivy and fix the ivy damage 	Fix ivy damage	4	2023-03-30 17:50:51.449526	2023-04-07 17:21:07.987894	f
51	See if we can add this pool 	Pool inspo	38	2023-04-07 18:52:09.875074	2023-04-07 18:52:09.88987	f
11	Pick from stone options. looking more at "del mare ledge stone" and "southern ledge stone"	Choose options for wall stone	4	2023-03-30 17:50:51.452085	2023-04-07 17:29:29.752573	f
10	Plant wisteria but careful to tie away from windows. best nursery to buy nearby is Langthorn Plantery	Plant  Wisteria 	4	2023-03-30 17:50:51.450815	2023-04-07 17:37:06.246121	f
13	Need to check colour ways for the ground floor bathroom, check for humidity resistant papers	Wallpaper Bathroom 	5	2023-03-30 17:50:51.455699	2023-04-07 18:11:29.911766	f
39	get at the vicarage on way back from Waitrose. See if they have options in bronze to fit ground floor bathroom	Sink needs new tap	23	2023-04-05 17:35:09.683745	2023-04-07 17:40:54.219747	f
52	You can change between the floorpans for different stages of your build. You automatically start on the "Existing" floor plan on the ground floor "0".  Click on the different floor buttons and floor plan stages to see different floor plans for your build.	How to change floor plan view	39	2023-04-07 19:08:55.520266	2023-04-07 19:09:13.929233	f
45	Pick up carpet from auction house for entrance. Address: 8 King St, St. James's, London SW1Y 6QT, UK	Carpet needs to be picked up	34	2023-04-07 18:17:35.898195	2023-04-07 18:18:43.705095	f
47	Found this crown moulding I would like to copy for the living room 	Crown Moulding Inspo 	35	2023-04-07 18:32:50.784728	2023-04-07 18:32:50.802378	f
48	Put up Barnaby Barford Mirror "Seven Dead Sins" mirror 	Mirror for living room 	33	2023-04-07 18:36:09.786532	2023-04-07 18:36:09.801603	f
54	To move a dot start by making a new dot with the "+" button for DOTs. You will see a little dot appear in the top left corner of the map. Now refresh the page and now you will be able to gently drag and drop the dot to anywhere on the map. 	How to move a dot	41	2023-04-07 19:16:50.313871	2023-04-07 19:16:50.328562	f
56	To see all the tasks for a dot, click on the dot you want to check. On the right you will see all the dots for that task.  You can click on the task to see more detail 	How to see tasks for a dot	75	2023-04-07 20:41:42.430689	2023-04-07 20:41:42.453947	f
55	Choose the right floor and the right floor plan stage and then scroll to find the "choose file" form. Click on it to choose an image from your files and press the "Upload Plan" button to upload your plan. 	How to upload my plans	42	2023-04-07 19:29:31.01126	2023-04-07 19:29:31.053019	f
40	You add dots by clicking the + button next to the DOT. Go back to the plan and floor you were working on. Now you can refresh the page. A dot will appear at the top left of the floorpan. From there you can gently drag it to the right spot in the floor plan. 	How to add dots	30	2023-04-07 15:17:46.771023	2023-04-07 20:34:11.152123	f
57	You can search tasks by tags. Examples of helpful tags like "urgent" or "living room" will help you to filter tasks by important tags	How to search tasks by tags	48	2023-04-07 20:47:55.620677	2023-04-07 20:47:55.637294	f
58	Click on the task you want to work on to see the expanded detailed view. Got to the manage users box and click on it to see a list of the emails of the people that have been added to the project. Click on the email of the person you want to add and click "Add User". Now you have added a new collaborator to the project.	How to collaborators to a task	77	2023-04-07 20:56:54.080783	2023-04-07 20:56:54.108365	f
59	the legs and metal structure should be hollowed out steel that has been highly polished 	High polish - Steel for 	79	2023-04-07 21:39:21.122437	2023-04-07 21:39:21.131131	f
61	check with manufacturer	back of chair	80	2023-04-07 22:27:22.887326	2023-04-07 22:27:22.887326	f
60	Felt type in rich red	Fabric type	80	2023-04-07 21:43:43.881872	2023-04-07 22:27:39.5347	t
62	Recarpet the living room.	Recarpet	82	2023-04-07 22:35:34.841559	2023-04-07 22:35:58.732302	f
\.


--
-- Data for Name: user_tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_tasks (id, task_id, user_id, created_at, updated_at, recommendation) FROM stdin;
1	1	1	2023-03-30 17:50:51.518448	2023-03-30 17:50:51.518448	\N
2	1	2	2023-03-30 17:50:51.523524	2023-03-30 17:50:51.523524	\N
3	1	3	2023-03-30 17:50:51.524705	2023-03-30 17:50:51.524705	\N
4	2	1	2023-03-30 17:50:51.536069	2023-03-30 17:50:51.536069	\N
5	3	1	2023-03-30 17:50:51.541625	2023-03-30 17:50:51.541625	\N
6	3	2	2023-03-30 17:50:51.542916	2023-03-30 17:50:51.542916	\N
7	3	4	2023-03-30 17:50:51.544825	2023-03-30 17:50:51.544825	\N
8	3	3	2023-03-30 17:50:51.549772	2023-03-30 17:50:51.549772	\N
9	4	1	2023-03-30 17:50:51.560361	2023-03-30 17:50:51.560361	\N
10	4	4	2023-03-30 17:50:51.563632	2023-03-30 17:50:51.563632	\N
11	4	2	2023-03-30 17:50:51.56806	2023-03-30 17:50:51.56806	\N
12	4	3	2023-03-30 17:50:51.601624	2023-03-30 17:50:51.601624	\N
14	5	4	2023-03-30 17:50:51.6119	2023-03-30 17:50:51.6119	\N
15	5	2	2023-03-30 17:50:51.613601	2023-03-30 17:50:51.613601	\N
16	5	3	2023-03-30 17:50:51.615705	2023-03-30 17:50:51.615705	\N
17	6	4	2023-03-30 17:50:51.624055	2023-03-30 17:50:51.624055	\N
18	7	4	2023-03-30 17:50:51.632575	2023-03-30 17:50:51.632575	\N
19	8	4	2023-03-30 17:50:51.63982	2023-03-30 17:50:51.63982	\N
20	9	1	2023-03-30 17:50:51.647539	2023-03-30 17:50:51.647539	\N
21	9	2	2023-03-30 17:50:51.650334	2023-03-30 17:50:51.650334	\N
22	10	2	2023-03-30 17:50:51.662287	2023-03-30 17:50:51.662287	\N
23	11	3	2023-03-30 17:50:51.668853	2023-03-30 17:50:51.668853	\N
24	12	1	2023-03-30 17:50:51.675215	2023-03-30 17:50:51.675215	\N
25	12	4	2023-03-30 17:50:51.676492	2023-03-30 17:50:51.676492	\N
26	12	3	2023-03-30 17:50:51.677793	2023-03-30 17:50:51.677793	\N
27	13	2	2023-03-30 17:50:51.683926	2023-03-30 17:50:51.683926	\N
28	13	1	2023-03-30 17:50:51.685253	2023-03-30 17:50:51.685253	\N
29	13	4	2023-03-30 17:50:51.686506	2023-03-30 17:50:51.686506	\N
105	2	4	2023-04-07 16:43:03.027119	2023-04-07 16:43:03.027119	\N
107	7	2	2023-04-07 17:16:39.458405	2023-04-07 17:16:39.458405	\N
109	43	1	2023-04-07 17:53:58.583858	2023-04-07 17:53:58.583858	\N
110	43	2	2023-04-07 17:54:00.764012	2023-04-07 17:54:00.764012	\N
112	45	2	2023-04-07 18:18:48.986834	2023-04-07 18:18:48.986834	\N
113	45	1	2023-04-07 18:18:51.899631	2023-04-07 18:18:51.899631	\N
115	49	1	2023-04-07 18:44:21.343919	2023-04-07 18:44:21.343919	\N
116	49	4	2023-04-07 18:44:23.858591	2023-04-07 18:44:23.858591	\N
13	5	1	2023-03-30 17:50:51.610329	2023-04-07 22:24:02.928988	R: Contact Mr Cook and schedule an appointment to conduct a thorough assessment of the entrance area.\nR: During the assessment, ensure that Mr Cook checks for the current humidity levels and identifies any potential causes of moisture in the area.\nR: Based on Mr Cook's findings, determine whether or not it is necessary to reinsulate the entrance and proceed accordingly.\nR: Consider implementing preventative measures to prevent future moisture buildup, such as proper ventilation or sealing any potential entry points for water.
123	62	1	2023-04-07 22:49:34.076276	2023-04-07 22:49:34.076276	\N
124	51	1	2023-04-07 22:49:46.098008	2023-04-07 22:49:46.098008	\N
127	62	1	2023-04-07 22:50:16.875653	2023-04-07 22:50:16.875653	\N
106	41	1	2023-04-07 17:11:16.626944	2023-04-07 17:11:16.626944	\N
96	39	3	2023-04-05 17:35:36.221643	2023-04-05 17:35:36.221643	\N
97	39	1	2023-04-05 17:35:41.388996	2023-04-05 17:35:53.201219	R: Consider the location of the vicarage in relation to Waitrose to determine the most convenient route.\nR: Take into account any potential obstacles or challenges along the way, such as traffic or road closures.\nR: Determine the type of transportation that would be most suitable for the journey, whether it be walking, biking, driving, or public transportation.\nR: Identify any landmarks or notable features along the way that may be useful for navigation.\nR: Consider the time of day and weather conditions to ensure a safe and comfortable journey.\nR: Plan for any necessary stops or detours along the way, such as restrooms or refreshment breaks.\nR: Review the plan and make any necessary adjustments before setting out on the journey.
108	42	1	2023-04-07 17:49:10.566614	2023-04-07 17:49:10.566614	\N
111	44	4	2023-04-07 18:05:38.137889	2023-04-07 18:05:38.137889	\N
114	46	2	2023-04-07 18:39:05.613114	2023-04-07 18:39:05.613114	\N
117	51	2	2023-04-07 18:53:10.555635	2023-04-07 18:53:10.555635	\N
102	40	1	2023-04-07 15:23:30.969932	2023-04-07 15:23:30.969932	\N
103	40	2	2023-04-07 15:23:49.123266	2023-04-07 15:23:49.123266	\N
118	51	4	2023-04-07 18:53:13.636122	2023-04-07 18:53:13.636122	\N
119	62	2	2023-04-07 22:36:07.222586	2023-04-07 22:36:07.222586	\N
120	62	1	2023-04-07 22:36:10.196929	2023-04-07 22:36:14.698621	R: Assess the current condition of the living room and identify any necessary repairs or preparations before recarpeting.\nR: Consider the style and color scheme of the existing decor and choose a carpet that complements or enhances the overall aesthetic.\nR: Measure the dimensions of the living room accurately to ensure that the new carpet is the correct size and shape.
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, admin) FROM stdin;
1	pana_admin@gmail.com	$2a$12$oXDoaGn0VDYzDSQTLA/MAu7HX/t8cUd/OG7Tb.wjGqbAlrSo3PS2i	\N	\N	\N	2023-03-30 17:50:50.594385	2023-03-30 17:50:50.594385	t
2	olivia@gmail.com	$2a$12$3woi44R9OLUuuXsvVH3X4O.DgnnQw2RwHj/auQlzzfYJjvLD3tmiC	\N	\N	\N	2023-03-30 17:50:50.820082	2023-03-30 17:50:50.820082	f
3	soyiben@gmail.com	$2a$12$QjAKUAFyjsaU3MqTtzG.Z.Kb8Sdm3725kNqf7zi7qTDUTusOTmfSG	\N	\N	\N	2023-03-30 17:50:51.042895	2023-03-30 17:50:51.042895	f
4	betech35@gmail.com	$2a$12$2xcJH.zjqyehQ6Sf.BXVuOkuCRcCAxzmEyiP3eMHCdhxqGxx0Ki1W	\N	\N	\N	2023-03-30 17:50:51.266006	2023-03-30 17:50:51.266006	f
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 84, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 84, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: dots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dots_id_seq', 86, true);


--
-- Name: floors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.floors_id_seq', 19, true);


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plans_id_seq', 57, true);


--
-- Name: project_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.project_users_id_seq', 16, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 9, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 346, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tasks_id_seq', 63, true);


--
-- Name: user_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_tasks_id_seq', 129, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: dots dots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dots
    ADD CONSTRAINT dots_pkey PRIMARY KEY (id);


--
-- Name: floors floors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.floors
    ADD CONSTRAINT floors_pkey PRIMARY KEY (id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: project_users project_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT project_users_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: user_tasks user_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tasks
    ADD CONSTRAINT user_tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_dots_on_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dots_on_plan_id ON public.dots USING btree (plan_id);


--
-- Name: index_floors_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_floors_on_project_id ON public.floors USING btree (project_id);


--
-- Name: index_plans_on_floor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_plans_on_floor_id ON public.plans USING btree (floor_id);


--
-- Name: index_project_users_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_users_on_project_id ON public.project_users USING btree (project_id);


--
-- Name: index_project_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_users_on_user_id ON public.project_users USING btree (user_id);


--
-- Name: index_projects_on_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_owner_id ON public.projects USING btree (owner_id);


--
-- Name: index_tags_on_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tags_on_task_id ON public.tags USING btree (task_id);


--
-- Name: index_tasks_on_dot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tasks_on_dot_id ON public.tasks USING btree (dot_id);


--
-- Name: index_user_tasks_on_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_tasks_on_task_id ON public.user_tasks USING btree (task_id);


--
-- Name: index_user_tasks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_tasks_on_user_id ON public.user_tasks USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: floors fk_rails_0e508c64ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.floors
    ADD CONSTRAINT fk_rails_0e508c64ca FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: project_users fk_rails_1bf16ed5d0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT fk_rails_1bf16ed5d0 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: projects fk_rails_219ef9bf7d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_219ef9bf7d FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: tags fk_rails_28d586d22f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT fk_rails_28d586d22f FOREIGN KEY (task_id) REFERENCES public.tasks(id);


--
-- Name: tasks fk_rails_576732370e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_rails_576732370e FOREIGN KEY (dot_id) REFERENCES public.dots(id);


--
-- Name: user_tasks fk_rails_5a3f03c742; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tasks
    ADD CONSTRAINT fk_rails_5a3f03c742 FOREIGN KEY (task_id) REFERENCES public.tasks(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: project_users fk_rails_996d73fecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT fk_rails_996d73fecd FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: dots fk_rails_b03837ecce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dots
    ADD CONSTRAINT fk_rails_b03837ecce FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: user_tasks fk_rails_e4209a9ba9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tasks
    ADD CONSTRAINT fk_rails_e4209a9ba9 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: plans fk_rails_ede8c0cb94; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT fk_rails_ede8c0cb94 FOREIGN KEY (floor_id) REFERENCES public.floors(id);


--
-- PostgreSQL database dump complete
--

