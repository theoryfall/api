--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-1.pgdg90+1)
-- Dumped by pg_dump version 11.1 (Debian 11.1-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: class_disciplines; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.class_disciplines (
    discipline_id integer,
    class_id integer
);


ALTER TABLE public.class_disciplines OWNER TO h3lix;

--
-- Name: class_powers; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.class_powers (
    class_id integer,
    power_id integer
);


ALTER TABLE public.class_powers OWNER TO h3lix;

--
-- Name: class_races; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.class_races (
    class_id integer,
    race_id integer
);


ALTER TABLE public.class_races OWNER TO h3lix;

--
-- Name: classes; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    description text,
    icon character varying(255),
    icon_svg character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.classes OWNER TO h3lix;

--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classes_id_seq OWNER TO h3lix;

--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- Name: discipline_powers; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.discipline_powers (
    discipline_id integer,
    power_id integer
);


ALTER TABLE public.discipline_powers OWNER TO h3lix;

--
-- Name: disciplines; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.disciplines (
    id integer NOT NULL,
    name character varying(255),
    description text,
    slug character varying(255),
    icon character varying(255),
    icon_svg character varying(255),
    type character varying(255),
    equips jsonb,
    trays_and_slots jsonb,
    stats jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.disciplines OWNER TO h3lix;

--
-- Name: disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix
--

CREATE SEQUENCE public.disciplines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disciplines_id_seq OWNER TO h3lix;

--
-- Name: disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix
--

ALTER SEQUENCE public.disciplines_id_seq OWNED BY public.disciplines.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO h3lix;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO h3lix;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO h3lix;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: h3lix
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO h3lix;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: power_combos; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.power_combos (
    parent_power_id integer,
    child_power_id integer
);


ALTER TABLE public.power_combos OWNER TO h3lix;

--
-- Name: powers; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.powers (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    icon character varying(255),
    icon_svg character varying(255),
    description text,
    power_type character varying(255),
    cast_type character varying(255),
    resource_type character varying(255),
    resource_cost character varying(255),
    cooldown real,
    duration real,
    max_targets integer,
    range real,
    targeting character varying(255),
    is_discipline_power boolean DEFAULT false,
    is_combo boolean DEFAULT false,
    is_deleted boolean DEFAULT false,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.powers OWNER TO h3lix;

--
-- Name: powers_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix
--

CREATE SEQUENCE public.powers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.powers_id_seq OWNER TO h3lix;

--
-- Name: powers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix
--

ALTER SEQUENCE public.powers_id_seq OWNED BY public.powers.id;


--
-- Name: race_disciplines; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.race_disciplines (
    discipline_id integer,
    race_id integer
);


ALTER TABLE public.race_disciplines OWNER TO h3lix;

--
-- Name: races; Type: TABLE; Schema: public; Owner: h3lix
--

CREATE TABLE public.races (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    icon character varying(255),
    icon_svg character varying(255),
    description text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.races OWNER TO h3lix;

--
-- Name: races_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix
--

CREATE SEQUENCE public.races_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.races_id_seq OWNER TO h3lix;

--
-- Name: races_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix
--

ALTER SEQUENCE public.races_id_seq OWNED BY public.races.id;


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: disciplines id; Type: DEFAULT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.disciplines ALTER COLUMN id SET DEFAULT nextval('public.disciplines_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: powers id; Type: DEFAULT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.powers ALTER COLUMN id SET DEFAULT nextval('public.powers_id_seq'::regclass);


--
-- Name: races id; Type: DEFAULT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.races ALTER COLUMN id SET DEFAULT nextval('public.races_id_seq'::regclass);


--
-- Data for Name: class_disciplines; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.class_disciplines (discipline_id, class_id) FROM stdin;
1	1
1	2
1	3
1	8
1	9
1	10
2	1
2	6
2	10
3	1
3	2
3	8
3	9
3	10
4	1
4	2
4	3
4	4
4	5
4	7
4	8
4	9
4	10
4	11
5	1
5	2
5	3
5	4
5	5
5	6
5	7
5	8
5	9
5	10
5	11
6	1
6	2
6	3
6	4
6	5
6	6
6	7
6	8
6	9
6	10
6	11
7	1
7	6
7	10
8	1
8	2
8	8
8	9
8	10
8	11
9	1
9	2
9	3
9	4
9	5
9	7
9	8
9	9
9	10
9	11
10	1
10	2
10	3
10	4
10	5
10	6
10	7
10	8
10	9
10	10
10	11
11	1
11	2
11	3
11	4
11	6
11	7
11	8
11	9
11	10
11	11
12	1
12	2
12	3
12	4
12	5
12	6
12	7
12	8
12	9
12	10
12	11
13	1
13	2
13	3
13	4
13	5
13	6
13	7
13	8
13	9
13	10
13	11
14	2
15	1
15	2
15	3
15	4
15	5
15	6
15	7
15	8
15	9
15	10
15	11
16	2
17	2
17	3
17	4
17	5
17	7
17	8
17	9
17	10
18	1
18	2
18	3
18	4
18	5
18	6
18	7
18	8
18	9
18	10
18	11
19	1
19	2
19	3
19	4
19	5
19	7
19	8
19	9
19	10
20	1
20	2
20	3
20	4
20	5
20	6
20	7
20	8
20	9
20	10
20	11
21	1
21	2
21	3
21	4
21	5
21	6
21	7
21	8
21	9
21	10
21	11
22	1
22	2
22	3
22	4
22	5
22	6
22	7
22	8
22	9
22	10
22	11
23	1
23	2
23	3
23	4
23	5
23	6
23	7
23	8
23	9
23	10
23	11
24	1
24	2
24	3
24	4
24	5
24	6
24	7
24	8
24	9
24	10
24	11
25	1
25	2
25	3
25	4
25	5
25	6
25	7
25	8
25	9
25	10
25	11
26	1
26	2
26	3
26	4
26	5
26	6
26	7
26	8
26	9
26	10
26	11
27	1
27	2
27	3
27	4
27	5
27	6
27	7
27	8
27	9
27	10
27	11
28	1
28	2
28	3
28	4
28	5
28	6
28	7
28	8
28	9
28	10
28	11
29	1
29	6
29	10
30	1
30	2
30	3
30	4
30	5
30	6
30	7
30	8
30	9
30	10
30	11
31	2
32	1
32	2
32	3
32	4
32	5
32	6
32	7
32	8
32	9
32	10
32	11
33	1
33	2
33	3
33	4
33	5
33	6
33	7
33	8
33	9
33	10
33	11
34	1
34	2
34	3
34	4
34	5
34	6
34	7
34	8
34	9
34	10
34	11
35	1
35	2
35	3
35	4
35	5
35	6
35	7
35	8
35	9
35	10
35	11
36	1
36	2
36	3
36	8
36	9
36	10
37	1
37	2
37	3
37	4
37	5
37	6
37	7
37	8
37	9
37	10
37	11
38	1
38	2
38	3
38	4
38	5
38	6
38	7
38	8
38	9
38	10
38	11
39	1
39	2
39	8
39	9
39	10
39	11
40	1
40	2
40	3
40	4
40	5
40	6
40	7
40	8
40	9
40	10
40	11
41	1
41	2
41	3
41	4
41	5
41	6
41	7
41	8
41	9
41	10
41	11
42	1
42	2
42	3
42	4
42	5
42	6
42	7
42	8
42	9
42	10
42	11
43	1
43	2
43	3
43	4
43	5
43	6
43	7
43	8
43	9
43	10
43	11
44	1
44	2
44	3
44	4
44	5
44	6
44	7
44	8
44	9
44	10
44	11
45	1
45	2
45	3
45	4
45	5
45	6
45	7
45	8
45	9
45	10
45	11
46	1
46	2
46	3
46	4
46	5
46	6
46	7
46	8
46	9
46	10
46	11
47	1
47	2
47	3
47	4
47	5
47	6
47	7
47	8
47	9
47	10
47	11
48	1
48	2
48	3
48	4
48	5
48	6
48	7
48	8
48	9
48	10
48	11
49	1
49	2
49	3
49	4
49	5
49	6
49	7
49	8
49	9
49	10
49	11
50	1
50	2
50	3
50	4
50	5
50	6
50	7
50	8
50	9
50	10
50	11
51	4
51	11
52	1
52	2
52	3
52	4
52	5
52	7
52	8
52	9
52	10
52	11
53	1
53	2
53	3
53	4
53	5
53	6
53	7
53	8
53	9
53	10
53	11
54	1
54	2
54	3
54	4
54	5
54	6
54	7
54	8
54	9
54	10
54	11
55	1
55	2
55	3
55	4
55	5
55	7
55	8
55	9
55	10
55	11
56	1
56	2
56	3
56	4
56	5
56	6
56	7
56	8
56	9
56	10
56	11
57	2
57	3
57	5
57	8
57	9
57	11
58	1
58	2
58	6
58	8
58	9
58	10
58	11
59	1
59	2
59	3
59	4
59	5
59	6
59	7
59	8
59	9
59	10
59	11
60	1
60	2
60	3
60	4
60	5
60	6
60	7
60	8
60	9
60	10
60	11
61	1
61	2
61	3
61	4
61	5
61	6
61	7
61	8
61	9
61	10
61	11
62	1
62	2
62	3
62	4
62	5
62	6
62	7
62	8
62	9
62	10
62	11
63	1
63	2
63	3
63	4
63	5
63	6
63	7
63	8
63	9
63	10
63	11
64	1
64	2
64	3
64	4
64	5
64	6
64	7
64	8
64	9
64	10
64	11
65	1
65	2
65	3
65	4
65	5
65	6
65	7
65	8
65	9
65	10
65	11
66	2
67	1
67	2
67	3
67	4
67	5
67	6
67	7
67	8
67	9
67	10
67	11
68	3
68	5
68	8
69	1
69	6
69	10
70	1
70	2
70	8
70	9
70	10
71	1
71	2
71	3
71	4
71	5
71	6
71	7
71	8
71	9
71	10
71	11
72	3
72	5
72	8
73	3
73	5
73	8
74	1
74	2
74	3
74	4
74	5
74	6
74	7
74	8
74	9
74	10
74	11
75	1
75	2
75	3
75	4
75	5
75	6
75	7
75	8
75	9
75	10
75	11
76	1
76	2
76	6
76	8
76	9
76	10
76	11
77	1
77	2
77	3
77	4
77	5
77	6
77	7
77	8
77	9
77	10
77	11
78	1
78	2
78	3
78	4
78	5
78	6
78	7
78	8
78	9
78	10
78	11
79	1
79	2
79	3
79	4
79	5
79	6
79	7
79	8
79	9
79	10
79	11
80	1
80	2
80	3
80	4
80	5
80	6
80	7
80	8
80	9
80	10
80	11
81	1
81	2
81	3
81	4
81	5
81	6
81	7
81	8
81	9
81	10
81	11
82	1
82	2
82	3
82	4
82	5
82	6
82	7
82	8
82	9
82	10
82	11
83	1
83	2
83	3
83	4
83	5
83	6
83	7
83	8
83	9
83	10
83	11
84	1
84	2
84	3
84	4
84	5
84	6
84	7
84	8
84	9
84	10
84	11
85	1
85	2
85	3
85	4
85	5
85	6
85	7
85	8
85	9
85	10
85	11
86	1
86	2
86	3
86	4
86	5
86	6
86	7
86	8
86	9
86	10
86	11
87	1
87	2
87	3
87	4
87	5
87	6
87	7
87	8
87	9
87	10
87	11
88	1
88	2
88	3
88	4
88	5
88	6
88	7
88	8
88	9
88	10
88	11
89	1
89	2
89	3
89	4
89	5
89	6
89	7
89	8
89	9
89	10
89	11
90	1
90	2
90	3
90	4
90	5
90	6
90	7
90	8
90	9
90	10
90	11
\.


--
-- Data for Name: class_powers; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.class_powers (class_id, power_id) FROM stdin;
1	22
1	76
1	100
1	110
1	118
1	247
1	385
1	411
1	417
2	255
2	263
2	284
2	381
2	403
2	410
2	441
2	448
2	458
3	77
3	127
3	169
3	213
3	224
3	225
3	230
3	233
3	274
3	435
3	456
4	1
4	86
4	154
4	163
4	166
4	220
4	235
4	269
4	369
5	25
5	36
5	77
5	82
5	144
5	152
5	171
5	174
5	217
5	256
5	258
5	377
5	395
6	170
6	198
6	236
6	296
6	299
6	331
6	374
6	445
6	455
8	73
8	288
8	295
8	320
8	370
8	343
8	386
8	390
8	392
8	468
9	17
9	31
9	45
9	68
9	318
9	324
9	366
9	433
10	9
10	16
10	26
10	99
10	106
10	149
10	167
10	196
10	397
10	426
10	428
10	429
10	447
11	53
11	71
11	117
11	126
11	153
11	203
11	226
11	244
11	339
11	348
11	368
\.


--
-- Data for Name: class_races; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.class_races (class_id, race_id) FROM stdin;
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.classes (id, name, slug, description, icon, icon_svg, created_at, updated_at) FROM stdin;
1	Assassin	assassin		http://localhost/assets/images/class/assassin.png	http://localhost/assets/images/class/assassin.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
2	Champion	champion		http://localhost/assets/images/class/champion.png	http://localhost/assets/images/class/champion.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
3	Cleric	cleric		http://localhost/assets/images/class/cleric.png	http://localhost/assets/images/class/cleric.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
4	Confessor	confessor		http://localhost/assets/images/class/confessor.png	http://localhost/assets/images/class/confessor.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
5	Druid	druid		http://localhost/assets/images/class/druid.png	http://localhost/assets/images/class/druid.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
6	Duelist	duelist		http://localhost/assets/images/class/duelist.png	http://localhost/assets/images/class/duelist.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
7	Frostweaver	frostweaver		http://localhost/assets/images/class/frostweaver.png	http://localhost/assets/images/class/frostweaver.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
8	Knight	knight		http://localhost/assets/images/class/knight.png	http://localhost/assets/images/class/knight.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
9	Myrmidon	myrmidon		http://localhost/assets/images/class/myrmidon.png	http://localhost/assets/images/class/myrmidon.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
10	Ranger	ranger		http://localhost/assets/images/class/ranger.png	http://localhost/assets/images/class/ranger.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
11	Templar	templar		http://localhost/assets/images/class/templar.png	http://localhost/assets/images/class/templar.svg	2019-02-10 17:10:25.229+00	2019-02-10 17:10:25.229+00
\.


--
-- Data for Name: discipline_powers; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.discipline_powers (discipline_id, power_id) FROM stdin;
1	3
1	316
2	62
2	251
2	420
2	314
3	15
3	33
3	464
4	234
5	24
5	214
5	192
5	14
6	404
6	207
6	231
6	457
7	382
7	59
7	384
8	44
8	112
8	359
8	41
8	465
9	40
10	57
11	66
12	156
12	197
14	5
14	240
14	183
15	119
16	131
17	176
17	35
17	432
19	223
20	182
20	466
20	408
20	143
21	145
23	148
25	319
25	334
25	341
25	289
26	147
27	158
27	332
27	87
28	431
28	20
28	252
29	180
30	238
30	30
30	74
30	179
31	187
32	195
33	136
35	454
35	232
36	201
36	28
36	425
36	477
37	194
37	360
37	157
38	184
38	453
38	413
38	444
39	437
39	70
39	260
40	250
41	137
42	245
42	414
44	265
45	266
46	267
47	34
47	333
47	461
47	430
48	138
49	272
50	216
50	168
50	191
50	362
51	277
52	243
52	278
52	337
52	262
53	181
53	462
53	427
54	297
55	307
55	467
56	394
56	115
56	155
56	443
58	310
58	275
58	308
58	311
59	312
60	315
61	317
62	139
63	11
63	434
63	90
64	342
65	371
65	178
65	379
66	372
66	290
67	18
67	285
67	302
67	439
68	177
68	460
69	383
70	10
71	387
71	124
71	361
71	373
72	54
72	442
72	270
72	276
73	239
74	140
75	407
76	412
77	23
77	325
77	29
78	424
79	58
79	49
82	440
83	88
83	340
83	120
83	249
84	405
85	113
85	298
85	114
85	449
86	450
87	451
88	452
89	321
89	380
90	465
\.


--
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.disciplines (id, name, description, slug, icon, icon_svg, type, equips, trays_and_slots, stats, created_at, updated_at) FROM stdin;
1	Adjudicator	An Adjudicator is often synonymous with a mediator or judge and most associated with the Church of Arkon. The importance of banishing sin with fire the truest form of retribution against the guilty and can only be performed by the most devote of disciples.	adjudicator	http://localhost/assets/images/class/adjudicator.png	http://localhost/assets/images/class/adjudicator.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Damage Bonus: Crushing", "value": 6.25}]	\N	\N
2	Agent Provocateur	Agent Provocateurs are sneaky, well-hidden, and difficult to track. Sometimes they drop caltrops, sometimes they prefer a stink bomb, but no matter the method of deceit the intent is always done with mischief and stealth in mind.	agent-provocateur	http://localhost/assets/images/class/agent-provocateur.png	http://localhost/assets/images/class/agent-provocateur.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Stealth", "value": 5}]	\N	\N
3	Arcane Archer	The arcane Archer is one of the most deadly of mystical manipulators. Harnessing the power of the elements allows the archer to root their enemies while also creating protective barriers and enhancing their quickness with an unrivaled adroitness.	arcane-archer	http://localhost/assets/images/class/arcane-archer.png	http://localhost/assets/images/class/arcane-archer.svg	major	["Basic Bows", "Arcane Bows", "Arrows", "Elemental Arrows"]	{"tray_granted": "Ranged", "tray_removed": "", "slots_granted": ["Ranged", "Ammo"], "slots_removed": []}	[{"name": "Elemental Mitigations", "value": 3}, {"name": "Ranged Distance Bonus", "value": 5}, {"name": "Far Sight", "value": 5}]	\N	\N
4	Armor of Faith	The Book of Justice is often the only armor a follower of Arkon carries.	armor-of-faith	http://localhost/assets/images/class/armor-of-faith.png	http://localhost/assets/images/class/armor-of-faith.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
5	Banshee	An ambassador of death, The Banshee is most known for a distinguished wail that can cause fear and sometimes paralysis in some. A haunting presence along with the ability to conjure a ghost army are all aspects that accompany an angel of death.	banshee	http://localhost/assets/images/class/banshee.png	http://localhost/assets/images/class/banshee.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Final Damage Modifier", "value": 5}]	\N	\N
6	Bard	Bards are quick to jump in with a motivating song or a tune that is sweet and spiriting. The knowledge behind the power of song is a key element; music can provide a restorative feeling and can guard even the weariest of spirits. The importance of an encore is also truly unique to a bard - always leave them wanting more...	bard	http://localhost/assets/images/class/bard.png	http://localhost/assets/images/class/bard.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Elemental Mitigation", "value": 3.75}]	\N	\N
7	Black Mask	Black Masks are masters of disguise. Despite the rumors they are not a group of heartless and evil killers, but rather cunning and sly assassins. They are employed by all that request their blade, even those who seek revenge from previous errands.	black-mask	http://localhost/assets/images/class/black-mask.png	http://localhost/assets/images/class/black-mask.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Stealth", "value": 5}]	\N	\N
8	Blade Master	The blade takes shape in many forms: swords, daggers, and knives, all of which are quite lethal.  Blade Masters often seek prayer with Maeve, The Goddess of War, and are quick to force their enemies to pay a toll with their blood.  Whether it is a backstab, a sword fight, or the toss of a knife, the blade craves the blood of the enemy as much as the wielder craves victory.	blade-master	http://localhost/assets/images/class/blade-master.png	http://localhost/assets/images/class/blade-master.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Armor Penetration: Slashing", "value": 6.25}]	\N	\N
9	Blood Pact	Quid pro quo.	blood-pact	http://localhost/assets/images/class/blood-pact.png	http://localhost/assets/images/class/blood-pact.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
10	Burning Hatred	For generations the Fae have purged males of their species in the service of the greater good. Mothers cling to this belief as they administer The Farewell Kiss, and yet there are those who don't believe. Some other reason compells them.	burning-hatred	http://localhost/assets/images/class/burning-hatred.png	http://localhost/assets/images/class/burning-hatred.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
11	Careless Whisper	There's no comfort in the truth, Pain is all you'll find.	careless-whisper	http://localhost/assets/images/class/careless-whisper.png	http://localhost/assets/images/class/careless-whisper.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
12	Connoisseur	Some may consider the Connoisseur to be a rather persnickety personality to deal with, but anyone who prefers the finer things in life will mention that the trade in for a bit of extra work pays off greatly. A distinguished partiality can help differentiate between qualities and may also grant even greater rewards.	connoisseur	http://localhost/assets/images/class/connoisseur.png	http://localhost/assets/images/class/connoisseur.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
13	Demons Pact	Demons usually deal in souls, this one takes slots.	demons-pact	http://localhost/assets/images/class/demons-pact.png	http://localhost/assets/images/class/demons-pact.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Passive Bonus Slots", "value": 1}]	\N	\N
14	Destroyer	The beauty of chaos and destruction can only be seen by the few who allow themselves to succumb to the their rage.  Through the channeling of rage and devastation the ability to maintain a relentless and frightening vitality occurs.  Destroyers embrace their destructive ways and are often granted exceptional and frightening abilities in combat.	destroyer	http://localhost/assets/images/class/destroyer.png	http://localhost/assets/images/class/destroyer.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Max Rage", "value": 8.75}]	\N	\N
15	Dig In!	Stay strong and make them wonder how you're still standing.	dig-in	http://localhost/assets/images/class/dig-in.png	http://localhost/assets/images/class/dig-in.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
16	Dominator	You don't adjust. You just dominate.	dominator	http://localhost/assets/images/class/dominator.png	http://localhost/assets/images/class/dominator.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
17	Dryad	Arboreal energy exists in ways that can only be harnessed by the most insightful of nature enthusiasts.  Utilizing the power of trees assists with quick healing efforts that cannot be surpassed.  Dryads are quite in tune with nature and are quick to offer a helpful blast of leaves to the face.	dryad	http://localhost/assets/images/class/dryad.png	http://localhost/assets/images/class/dryad.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Healing Modifier", "value": 3}, {"name": "Druid Orb Refund", "value": 90}]	\N	\N
18	Elven Eyes	Why do I feel like I'm being watched?	elven-eyes	http://localhost/assets/images/class/elven-eyes.png	http://localhost/assets/images/class/elven-eyes.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Far-Sight", "value": 25}]	\N	\N
19	Eminently Punchable	Minotaur's demonstrate combat prowess through headbutting each other with enough force to knock each off their feed. This of course enrages them, which leads to more headbutting, which enrages them even further, and so on.	eminently-punchable	http://localhost/assets/images/class/eminently-punchable.png	http://localhost/assets/images/class/eminently-punchable.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
20	Escape Artist	Escapology is an artform that is still shrouded in mystery. An escapologist will quickly learn the ability to break free from mobility limitations allowing avoidance of even the most obnoxious of crowd control methods. While it may seem easy to the escapist, onlookers and enemies will beg to know the secrets of escape, but a magician never reveals their methods.	escape-artist	http://localhost/assets/images/class/escape-artist.png	http://localhost/assets/images/class/escape-artist.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
21	Ethereal Sight	If you squint really hard, you can just make out the swirling eddies of magic eminating from the Sunfire Realm.	ethereal-sight	http://localhost/assets/images/class/ethereal-sight.png	http://localhost/assets/images/class/ethereal-sight.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
22	Expansive Mind	You are not what you do. A man is defined by his actions, not his memory.	expansive-mind	http://localhost/assets/images/class/expansive-mind.png	http://localhost/assets/images/class/expansive-mind.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Power Bar Bonus Slots", "value": 1}]	\N	\N
23	Explosive Thorns	There are very few problems that cannot be solved through a suitable application of explosive thorns.	explosive-thorns	http://localhost/assets/images/class/explosive-thorns.png	http://localhost/assets/images/class/explosive-thorns.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
24	Fashion Statement	I pity the fool	fashion-statement	http://localhost/assets/images/class/fashion-statement.png	http://localhost/assets/images/class/fashion-statement.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": ["Amulet Slot", "Amulet Slot"], "slots_removed": []}	[{"name": "Stealth", "value": -25}]	\N	\N
25	Field Surgeon	Field Surgeons are the first to act in the event of a combat disaster. Quick to rescue, triage and rehabilitate, these selfless Field Surgeons are your one-stop shop for quick remedies to get you back in the action. Disclaimer, use as directed and be sure to follow up with a real physician. Satisfaction is not guaranteed and once payment has been processed there are no refunds.	field-surgeon	http://localhost/assets/images/class/field-surgeon.png	http://localhost/assets/images/class/field-surgeon.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Healing Modifier", "value": 6.25}]	\N	\N
26	Finish Him	The Church of Arkon is said to have flawless methods of finishing their ennemies.	finish-him	http://localhost/assets/images/class/finish-him.png	http://localhost/assets/images/class/finish-him.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
27	Firewalker	Fire management has been a basic aspect of advanced life, but only a select few are able to manipulate and mitigate the flames with true power. Absorbing and reflecting the blaze allows the Firewalker to manage fire as a benefit rather than a hindrance.	firewalker	http://localhost/assets/images/class/firewalker.png	http://localhost/assets/images/class/firewalker.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Resistance: Fire", "value": 6.25}]	\N	\N
28	Foreman	Organizing and leading a group can be a tricky duty, but when all the members fall into place a truely efficient unit is formed. The more forces engaged in the effort can expose weakness more frequently and at a faster pace.	foreman	http://localhost/assets/images/class/foreman.png	http://localhost/assets/images/class/foreman.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
29	Found Resources	Many experience bad luck that is associated with enormous winnings; this is oft to be thought of as the law of found resources at work.	found-resources	http://localhost/assets/images/class/found-resources.png	http://localhost/assets/images/class/found-resources.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
30	Friar	Friars of the Church of Arkon provide the community with a unique service that no other can provide.  Friars willingly listen and pardon the sins of the people with an undaunting zeal; no sin is too great, for they have heard them all and they are eager to hear more.  Their unyielding dedication to their trade provides many in their company with benefits in health and the avoidance of sin while also providing the Friars with a few extra perks.	friar	http://localhost/assets/images/class/friar.png	http://localhost/assets/images/class/friar.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Final Healing Modifier", "value": 0.063}]	\N	\N
31	Furious	Until you learn to master your rage, your rage will become your master.	furious	http://localhost/assets/images/class/furious.png	http://localhost/assets/images/class/furious.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
32	Glass Cannon	Makes no sense. At all.	glass-cannon	http://localhost/assets/images/class/glass-cannon.png	http://localhost/assets/images/class/glass-cannon.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
33	Grave Digger	Often associated with the macabre due to the nature of the work, grave digging is a trade not for those with delicate sensibilities. Surrounded by death and shrouded in darkness, the grave digger plucks from the remains the necessary components to create new life.	grave-digger	http://localhost/assets/images/class/grave-digger.png	http://localhost/assets/images/class/grave-digger.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Plentiful Resources Grave: All", "value": 1.25}]	\N	\N
34	Hand of Glory	Cut from the body of a criminal on the gibbet; pickled in salt, and the urine of man, woman, dog, horse and mare; smoked with herbs and hay for a month; hung on an oak tree for three nights running, laid at a crossroads, and finally hung on a church door for one night.  Now worn around your neck for an extra ring slot.	hand-of-glory	http://localhost/assets/images/class/hand-of-glory.png	http://localhost/assets/images/class/hand-of-glory.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": ["Ring Slot"], "slots_removed": []}	[{"name": "Perception", "value": 5}]	\N	\N
35	Hoarder	Hoarders have a way of finding more room to keep their newly found treasures without having to part with any of their old goods. Rearranging and restacking are some of the constant tasks a hoarder may have to deal with frequently, but it is a labor of love.	hoarder	http://localhost/assets/images/class/hoarder.png	http://localhost/assets/images/class/hoarder.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
36	Holy Avenger	Tapping into your motivation and channeling it into your current situation is key; no one else is an in tune with their surroundings as that of the Holy Avenger.  The opposition may consider you a scene-stealing hack but you know your methods are far more superior to others.  Always remember the battle chant of your brethren: never give up, never surrender!	holy-avenger	http://localhost/assets/images/class/holy-avenger.png	http://localhost/assets/images/class/holy-avenger.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Damage Bonus: Crushing", "value": 5}]	\N	\N
37	Illusionist	An Illusionist alters the perception of those within their proximity which allows for easier deception and confusion. With the assistance of a magic weapon and the finest of accoutrements an Illusionist maintains a dapper appearance while also being a worth adversary in combat.	illusionist	http://localhost/assets/images/class/illusionist.png	http://localhost/assets/images/class/illusionist.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Perception", "value": 20}]	\N	\N
38	Juggernaut	No other form of combatant is built to last as much as that of a Juggernaut which is due to extreme endurance and spite. Mercilessness, ruthlessness and resiliency are also defining characteristics that attribute to the robust nature of an unstoppable fighter whose impact will be felt repeatedly.	juggernaut	http://localhost/assets/images/class/juggernaut.png	http://localhost/assets/images/class/juggernaut.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
39	Knife Grinder	The art of bleeding a target is one that only a few can accomplish proficiently.  Followers of Maeve have known for years how important the blade is in combat.  With proper training and practice knife grinding can be the determining factor in a victory or a loss.	knife-grinder	http://localhost/assets/images/class/knife-grinder.png	http://localhost/assets/images/class/knife-grinder.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Damage Bonus: Slashing", "value": 6.25}]	\N	\N
40	Last Resort	Let's test your threshold of pain and let's see how long you last.	last-resort	http://localhost/assets/images/class/last-resort.png	http://localhost/assets/images/class/last-resort.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
41	Logger	A felling axe is a logger's best friend. Even a small axe can take down a big tree and the resource it yields hold endless possibilities.	logger	http://localhost/assets/images/class/logger.png	http://localhost/assets/images/class/logger.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Plentiful Resources Wood: All", "value": 1.25}]	\N	\N
42	Lookout	Razor-focus and a quickness to react at the first sign of change can be the turning point for a harvester. Reaction to even the slightest change in weakness can lead to greater wealth and riches while harvesting, giving a clear edge to those with a keen eye.	lookout	http://localhost/assets/images/class/lookout.png	http://localhost/assets/images/class/lookout.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
43	Mail Proficiency	Mail is the new denim.	mail-proficiency	http://localhost/assets/images/class/mail-proficiency.png	http://localhost/assets/images/class/mail-proficiency.svg	minor	["Mail Proficiency"]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
44	Matching Leather	Making a statement doesn't always mean having to give up functionality, or those well worn leather boots.	matching-leather	http://localhost/assets/images/class/matching-leather.png	http://localhost/assets/images/class/matching-leather.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
45	Matching Mail	You've got mail!	matching-mail	http://localhost/assets/images/class/matching-mail.png	http://localhost/assets/images/class/matching-mail.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
46	Matching Plate	Don't let anyone ever dull your sparkle.	matching-plate	http://localhost/assets/images/class/matching-plate.png	http://localhost/assets/images/class/matching-plate.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
73	Shield Whiz	Throwing a shield is geometry in its most challenging form; a science of precise angles and forces, not to mention a goddamn massive arm.	shield-whiz	http://localhost/assets/images/class/shield-whiz.png	http://localhost/assets/images/class/shield-whiz.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Shield Throw: Bonus Ricochets", "value": 1}, {"name": "Shield Throw: Falloff Bonus", "value": 0.06}]	\N	\N
47	Militant Mage	Militant Mages are known for their overzealous nature and the ability to pursue their cause even during the most strenuous of moments.  Much like Hero, Militant Mages are known to only have the idea of battle and combat on their minds; utilizing slashing attacks and Warping Metal are all characteristic attributes that help spread awareness to their cause.	militant-mage	http://localhost/assets/images/class/militant-mage.png	http://localhost/assets/images/class/militant-mage.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Mitigation: Slashing", "value": 6.25}]	\N	\N
48	Miner	Extracting minerals from the depths of the earth is the type of work that requires strength, endurance, stamina, and a lot of persistence. Contrary to popular belief, it is hard work rather than luck that springs forth the bounty of minerals from the earth. Armed with a trusty pick and plenty of bag room, the miner is prepared for a great haul but also understands that sometimes you have to go deeper.	miner	http://localhost/assets/images/class/miner.png	http://localhost/assets/images/class/miner.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Plentiful Resources Ore: All", "value": 1.25}]	\N	\N
49	Minor Accompaniment	Bach up and compose yourself!	minor-accompaniment	http://localhost/assets/images/class/minor-accompaniment.png	http://localhost/assets/images/class/minor-accompaniment.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
50	Mole Hunter	A heightened sense of awareness has often been compared to paranoia, but on the battlefield it is the ultimate key to fending off unexpected attacks. Those who are cloaked in the shadows are more exposed and more vulnerable when a Mole Hunter is present. Whacking moles and stealthers eventually becomes an easy game of Hide and Seek.	mole-hunter	http://localhost/assets/images/class/mole-hunter.png	http://localhost/assets/images/class/mole-hunter.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Perception", "value": 20}, {"name": "Dodge Regen Tick Rate", "value": -0.01}]	\N	\N
51	Mortal Sin	Peccata mortalia.  Without remorse a sinner will continue to burn with punishment.	mortal-sin	http://localhost/assets/images/class/mortal-sin.png	http://localhost/assets/images/class/mortal-sin.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
52	Mudman	The addition of muddy skin and a marshy body creates a vile combatant that can withstand even the heartiest hits.  Mudmen become one with the muck and can also spread their dirt and odors to enemies.  The addition of sacred mud and gunk add to the ability to self heal creating one sticky and tough fighter.	mudman	http://localhost/assets/images/class/mudman.png	http://localhost/assets/images/class/mudman.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Mitigation: Crushing", "value": 5}]	\N	\N
53	Naiad	Naiads, or Water Spirits, are in tune with the ebb and flow of fresh waters and the possibility of its power. They often take comfort in the flowing of water and view it as a source of life. Water Spirits help alleviate pain and harm while also extinguishing even the most volatile of infernos, after all Water Beats Fire!	naiad	http://localhost/assets/images/class/naiad.png	http://localhost/assets/images/class/naiad.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Healing Modifier", "value": 6.25}]	\N	\N
54	Overwhelming Odds	For an immortal there is no surrender, no mercy asked, none given.  With the rules of battle as such, they fight no matter the odds.	overwhelming-odds	http://localhost/assets/images/class/overwhelming-odds.png	http://localhost/assets/images/class/overwhelming-odds.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
55	Pixie	Mischievious, energetic, and jovial in nature, Pixies are known to be an asset to their allies and a pesky nuisance to their enemies.  A bit of the essence of Cybele lives in each Pixie as they offer an ally a quick fix, use their magic dust to assist in healing, and can use their conjury to also alter the size and intimidation of a foe with true ease.	pixie	http://localhost/assets/images/class/pixie.png	http://localhost/assets/images/class/pixie.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Healing Modifier", "value": 6.25}]	\N	\N
56	Plague Lord	As a host of the most noxious of contaminants your popularity may ebb and flow as you infect your enemies. The odors and muck you may leave behind will help remind those of your legacy as a plague bearer and a master of the rank andf oul making you one highly feared adversary.	plague-lord	http://localhost/assets/images/class/plague-lord.png	http://localhost/assets/images/class/plague-lord.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
57	Plate Proficiency	Plate is the new denim.	plate-proficiency	http://localhost/assets/images/class/plate-proficiency.png	http://localhost/assets/images/class/plate-proficiency.svg	minor	["Plate Proficiency"]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
58	Poisoner	A method of punishment often used by the Gods of Chaos, poison is the most inconspicuous and often underappreciated form of punishment. From the depths o the shadows to the dining halls of kings and queens poison takes many forms with the intention to finish off a target swiftly and with minimal retaliation.	poisoner	http://localhost/assets/images/class/poisoner.png	http://localhost/assets/images/class/poisoner.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Armor Pentration: Poison", "value": 6.25}]	\N	\N
59	Pound of Flesh	Take then thy bond, take thou thy pound of flesh.	pound-of-flesh	http://localhost/assets/images/class/pound-of-flesh.png	http://localhost/assets/images/class/pound-of-flesh.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
60	Prickly Skin	Not all skin conditions are detrimental.	prickly-skin	http://localhost/assets/images/class/prickly-skin.png	http://localhost/assets/images/class/prickly-skin.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
61	Protective Thorns	We are here to laugh at the odds and live our lives so well that Death will tremble to take us.	protective-thorns	http://localhost/assets/images/class/protective-thorns.png	http://localhost/assets/images/class/protective-thorns.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
62	Quarryman	Boring into the earth and uncovering the minerals deep below the surface requires a steady hammer and basic understanding of geology. Knowing which minerals to keep and which to discard may seem tedious but can make the biggest difference in using stone and minerals to create rare commodities.	quarryman	http://localhost/assets/images/class/quarryman.png	http://localhost/assets/images/class/quarryman.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Plentiful Resources Stone: All", "value": 1.25}]	\N	\N
63	Reality Warper	Exploiting and bending reality is an aspect only a select few can possess. Manipulating time, altering the ability to heal and influencing incoming and outgoing damage are all features onle a warper of reality can master. For them, reality is just a suggestion.	reality-warper	http://localhost/assets/images/class/reality-warper.png	http://localhost/assets/images/class/reality-warper.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Final Damage Modifier", "value": 3}]	\N	\N
64	Resolution	Only fools dream of immortality.  To feel the death of every body, the pain of every new form.  There must be some way to break this never ending cycle!  Or does that miserable statue which towers over every rebirth only serve to remind all Crows that if Hero couldn't break the cycle, no one can?	resolution	http://localhost/assets/images/class/resolution.png	http://localhost/assets/images/class/resolution.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
65	Rune Caster	Deciphering and utilizing the secret mysteries of runes is a tricky and sometimes difficult endeavor. Rune Casters have been known to look to Illara as the creator and keeper of rune knowledge. Those who are in tune and can decipher the arcane runes are granted many advantages in the form of shields, fortifications and sanctuary, in and out of combat.	rune-caster	http://localhost/assets/images/class/rune-caster.png	http://localhost/assets/images/class/rune-caster.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Physical Mitigation", "value": 3.75}]	\N	\N
66	Runescarred Gladiator	Blood is used in rune making as a magical property of life essence and sacrifice. The ultimate sacrifice for rune crafting is scarring runes into the flesh, which only the most devote are brave enough to do. Exchanging small spaces in the flesh to fill with runes grants them unyielding power and a continued devotion to self-sacrificing for the sake of combat.	runescarred-gladiator	http://localhost/assets/images/class/runescarred-gladiator.png	http://localhost/assets/images/class/runescarred-gladiator.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Max Rage", "value": 10}, {"name": "Enhanced Catch Your Breath", "value": 80}]	\N	\N
67	Scarecrow	One of the most prevalent icons of horror is the scarecrow. Often rudimentary and crude in apperance with an accompanied aura of terror, the scarecrow is often more terrifying in apperance than character, but that doesn't change the fact that they often cause shudders and shivers. Along with the sense of foreboding they can also cause even the most brutal of attackers to be stunned with fright.	scarecrow	http://localhost/assets/images/class/scarecrow.png	http://localhost/assets/images/class/scarecrow.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Resistance: Piercing", "value": 5}]	\N	\N
68	Secutor	Often heavily armored and accompanied with a shield, secutors are known for their solid stance and the ability to cooperate as a unit. Blessed with the essence of Arkon, Secutors also provide additional blocking protection and assist in anti-blinding by utilizing some of the power of the sun.	secutor	http://localhost/assets/images/class/secutor.png	http://localhost/assets/images/class/secutor.svg	major	["Tower Shields", "Small Bucklers"]	{"tray_granted": "", "tray_removed": "", "slots_granted": ["Off-hand Weapon Slot"], "slots_removed": []}	[{"name": "Physical Mitigations", "value": 3.75}, {"name": "Blocking Efficiency", "value": -0.5}]	\N	\N
69	Shadows Caress	The shadow's are said to wrap around those who frequent them like a soothing blanket, diminishing their wounds.  Unless of course that blanket is a dagger.  And that dagger is aimed at your heart.	shadows-caress	http://localhost/assets/images/class/shadows-caress.png	http://localhost/assets/images/class/shadows-caress.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
70	Sharpshooter	Many undervalue the beauty and simplicity of the arrow, but the truth is that a rapid firing archer is just as deadly as any other foe in combat. Long range shots allow for a quick and effective way to take an opponent down with minimal interaction.	sharpshooter	http://localhost/assets/images/class/sharpshooter.png	http://localhost/assets/images/class/sharpshooter.svg	major	["Basic Bows", "Compound Bows", "Arrows", "Exotic Arrows"]	{"tray_granted": "Ranged", "tray_removed": "", "slots_granted": ["Ranged", "Ammo"], "slots_removed": []}	[{"name": "Piercing Damage Bonus", "value": 5}, {"name": "Ranged Distance Bonus", "value": 5}, {"name": "Far-Sight", "value": 5}]	\N	\N
71	Shield Breaker	A shield is a mighty piece of weaponry and armor that is often difficult to bypass, but a Shield Breaker has the ability to plow through such armament with ease. Breaking barriers and exposing weakness are just a few attributes they are privy to adding another layer of complexity to combat.	shield-breaker	http://localhost/assets/images/class/shield-breaker.png	http://localhost/assets/images/class/shield-breaker.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Slashing Armor Penetration", "value": 3.75}, {"name": "Crushing Armor Penetration", "value": 3.75}, {"name": "Piercing Armor Penetration", "value": 3.75}]	\N	\N
72	Shield Fighter	Strength is not the only deciding factor in the heat of battle. Endurance, stamina, and tenacious spirit are necessary aspects of combat survival, and the addition of a shield can help increase the heartiness of the fighter. Shield Fighters are quick to utilize their armament by blocking blows, richocheting strikes, and the avoidance of massive damage. Fortitude, patience, and a defensive stance are what define a true Shield Fighter.	shield-fighter	http://localhost/assets/images/class/shield-fighter.png	http://localhost/assets/images/class/shield-fighter.svg	major	["Small Bucklers"]	{"tray_granted": "", "tray_removed": "", "slots_granted": ["Off-hand Weapon Slot"], "slots_removed": []}	[{"name": "Armor Penetration: Crushing", "value": 6.25}]	\N	\N
74	Skinner	A responsibility not to be taken lightly, the job of a skinner is one of the most important roles in the Dying Worlds. Taking down a wild creature and acquiring the necessary hides and meats from the carrion requires absolute finesse and a distinguished spirit.	skinner	http://localhost/assets/images/class/skinner.png	http://localhost/assets/images/class/skinner.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Plentiful Resources Animal: All", "value": 1.25}]	\N	\N
75	Sparring	It's the thrill of the fight and rising up to the challenge of your rival.	sparring	http://localhost/assets/images/class/sparring.png	http://localhost/assets/images/class/sparring.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
76	Spirit Whip	Crack that whip and give the past the slip.  It's not too late... To spirit whip it!	spirit-whip	http://localhost/assets/images/class/spirit-whip.png	http://localhost/assets/images/class/spirit-whip.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
77	Standard Bearer	A Standard Bearer is a member of a combat group that is responsible for carrying a distinctive mark, often times a flag, as a rallying sign. The added motivation a standard can bring is substantial enough to excite and inspire even the most fatigued of allies while acting as a waypoint for those in their company.	standard-bearer	http://localhost/assets/images/class/standard-bearer.png	http://localhost/assets/images/class/standard-bearer.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Physical Mitigation", "value": 3}]	\N	\N
78	Sturdy	The only thing said to unsettle a Stoneborn, is the sight of an immortal summoning a Runestone Hammer...	sturdy	http://localhost/assets/images/class/sturdy.png	http://localhost/assets/images/class/sturdy.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
79	Survivalist	The art of survival often has more to do with resourcefulness and strength rather than luck. Perserverance, motivation, and drive are key factors in surviving the Dying Worlds.	survivalist	http://localhost/assets/images/class/survivalist.png	http://localhost/assets/images/class/survivalist.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
80	Sustaining Note	Sometimes the wrists just need a break.	sustaining-note	http://localhost/assets/images/class/sustaining-note.png	http://localhost/assets/images/class/sustaining-note.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Song Duration", "value": 6}]	\N	\N
81	The Reaper	When you hear the ringing of a cowbell in the distance, it is time to put on some pants, and get to the harvest.	the-reaper	http://localhost/assets/images/class/the-reaper.png	http://localhost/assets/images/class/the-reaper.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Harvest Power Pips Bonus", "value": 0.625}]	\N	\N
82	Thornshield	The Elken tend to view Thorns as a minor annoyance, a garnish, or something to eat around as they devour their victims.	thornshield	http://localhost/assets/images/class/thornshield.png	http://localhost/assets/images/class/thornshield.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
83	Troubadour	A lyrical poet with a heavy output of vocal assault, the troubadour is one fierce vocalist. The importance of song and rhythms are what set the Troubadour apart from any other lyrical counterpart and can make a great addition to any party.	troubadour	http://localhost/assets/images/class/troubadour.png	http://localhost/assets/images/class/troubadour.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[{"name": "Organic Mitigation", "value": 3.75}]	\N	\N
84	Twisting	Not for the faint of wrist.	twisting	http://localhost/assets/images/class/twisting.png	http://localhost/assets/images/class/twisting.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
85	Underdog	It has been said repeatedly throughout time that the outcome of a match can rarely be predicted. No matter how many times an underdog gets knocked down they are determined to get back up and back into the fray. Remember, its not the size of the dog in the fight!	underdog	http://localhost/assets/images/class/underdog.png	http://localhost/assets/images/class/underdog.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
86	Uniform Leather	You may not always feel like you are your best, but at least you're well dressed.	uniform-leather	http://localhost/assets/images/class/uniform-leather.png	http://localhost/assets/images/class/uniform-leather.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
87	Uniform Mail	The inhabitants of the Dyling Lands have little time to worry about appearances, yet Guinecean's always seem poised to strut at a fashion show.	uniform-mail	http://localhost/assets/images/class/uniform-mail.png	http://localhost/assets/images/class/uniform-mail.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
88	Uniform Plate	Some prefer to armour themselves in cloth and leather, but the more dignified and sturdy combatant prefer a bit more shine.	uniform-plate	http://localhost/assets/images/class/uniform-plate.png	http://localhost/assets/images/class/uniform-plate.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
89	Villein	A little bit of elbow grease can go a long way when it comes to harvesting. A bit more practice and patience can make one more adept and experienced while also prolonging the life of the harvesting tools used.	villein	http://localhost/assets/images/class/villein.png	http://localhost/assets/images/class/villein.svg	major	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
90	Weapon Finesse	It's a shame having to compensate for shoddily crafted weapons.	weapon-finesse	http://localhost/assets/images/class/weapon-finesse.png	http://localhost/assets/images/class/weapon-finesse.svg	minor	[]	{"tray_granted": "", "tray_removed": "", "slots_granted": [], "slots_removed": []}	[]	\N	\N
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
6	20190115110634_powers.js	1	2019-01-21 16:24:15.852+00
13	20190123120333_classes.js	2	2019-02-09 19:34:19.835+00
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: power_combos; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.power_combos (parent_power_id, child_power_id) FROM stdin;
3	2
5	4
6	7
8	6
17	470
44	42
45	84
50	51
52	50
55	294
68	75
69	323
80	79
81	83
82	81
92	91
97	96
99	98
102	101
103	104
104	105
106	103
107	108
108	109
110	107
134	46
160	219
161	162
163	161
166	172
173	438
176	175
186	185
193	264
201	200
203	204
204	205
218	159
220	160
244	146
255	253
257	132
258	259
259	19
263	469
281	89
288	293
295	55
303	304
305	303
310	309
313	279
339	69
345	344
347	346
366	257
370	134
374	375
375	376
389	388
392	391
395	472
397	471
399	398
401	400
403	193
410	246
415	416
417	415
422	313
429	123
437	436
447	248
458	121
471	459
\.


--
-- Data for Name: powers; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.powers (id, name, slug, icon, icon_svg, description, power_type, cast_type, resource_type, resource_cost, cooldown, duration, max_targets, range, targeting, is_discipline_power, is_combo, is_deleted, created_at, updated_at) FROM stdin;
1	Absolution	absolution	http:/localhost/assets/images/absolution.png	http://localhost/assets/images/absolution.svg	Absolve an enemy consuming all their Sin, causing 145-218 + 181% Fire Weapon Damage with damage scaling to as much as 284-426 + 355% Weapon Damage based on the amount of Sin removed and reducing movement speed by 50% for 8 seconds if five stacks are consumed.	debuff	instant	mana	110	9	0	1	40	ray	f	f	f	2019-02-10 17:10:24.91+00	2019-02-10 17:10:24.91+00
2	Adjudicate 2	adjudicate-2	http:/localhost/assets/images/adjudicate-2.png	http://localhost/assets/images/adjudicate-2.svg	Judge an enemy inflicting 136-184 + 160% Holy Weapon Damage and cannot be mitigated normally.	melee attack	instant	resource	16	9	0	1	5	cone	t	t	f	2019-02-10 17:10:24.911+00	2019-02-10 17:10:24.911+00
3	Adjudicate	adjudicate	http:/localhost/assets/images/adjudicate.png	http://localhost/assets/images/adjudicate.svg	Smash an enemy for 113-153 + 133% Weapon Damage.	melee attack	instant	resource	16	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.911+00	2019-02-10 17:10:24.911+00
4	Aegis of Salvation 2	aegis-of-salvation-2	http:/localhost/assets/images/aegis-of-salvation-2.png	http://localhost/assets/images/aegis-of-salvation-2.svg	Attack causing 76 - 103 + 89% Weapon Damage and applies a barrier to you.  When it is removed you recover 10% to 15% to your Health	buff	instant	resource	10	23	0	1	5	cone	t	t	f	2019-02-10 17:10:24.912+00	2019-02-10 17:10:24.912+00
5	Aegis of Salvation	aegis-of-salvation	http:/localhost/assets/images/aegis-of-salvation.png	http://localhost/assets/images/aegis-of-salvation.svg	Attack causing 70 - 94 + 82% Weapon Damage.	buff	instant	resource	10	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.912+00	2019-02-10 17:10:24.912+00
6	Aimed Shot 2	aimed-shot-2	http:/localhost/assets/images/aimed-shot-2.png	http://localhost/assets/images/aimed-shot-2.svg	Aim and strike at an enemy with Physical arrows for 170-230 + 200% Weapon Damage.	ranged attack	charged	energy	32	0	0	1	15	ray	f	t	f	2019-02-10 17:10:24.912+00	2019-02-10 17:10:24.912+00
7	Aimed Shot 3	aimed-shot-3	http:/localhost/assets/images/aimed-shot-3.png	http://localhost/assets/images/aimed-shot-3.svg	Aim and strike at an enemy with Physical arrows for 340-460 + 400% Weapon Damage and apply additional effects when using exotic arrows. Check your arrow's description for details on additional effects.	ranged attack	charged	energy	32	0	0	1	15	ray	f	t	f	2019-02-10 17:10:24.912+00	2019-02-10 17:10:24.912+00
8	Aimed Shot	aimed-shot	http:/localhost/assets/images/aimed-shot.png	http://localhost/assets/images/aimed-shot.svg	Aim and strike at an enemy with Physical arrows for 170-230 + 200% Weapon Damage.	ranged attack	charged	energy	32	0	0	1	15	ray	f	f	f	2019-02-10 17:10:24.912+00	2019-02-10 17:10:24.912+00
9	Alertness	alertness	http:/localhost/assets/images/alertness.png	http://localhost/assets/images/alertness.svg	Become acutely aware of your surroundings increasing your Perception by 25, Attack Power by 50, removing the Exposed state and detecting enemies in Stealth for group members and yourself.	buff	instant	energy	190	30	45	5	50	group	f	f	f	2019-02-10 17:10:24.912+00	2019-02-10 17:10:24.912+00
10	All Clear	all-clear	http:/localhost/assets/images/all-clear.png	http://localhost/assets/images/all-clear.svg	Increase Damage Bonus when there are no enemies within 30m.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.913+00	2019-02-10 17:10:24.913+00
11	Alter Reality	alter-reality	http:/localhost/assets/images/alter-reality.png	http://localhost/assets/images/alter-reality.svg	Place a Heal Absorption shield on the target which absorbs incoming heals. In order to remove the shield the target must be healed for 500. If the shield is not healed off before 15 seconds, it will explode dealing 91-123 damage to those nearby.	debuff	instant	resource	13	23	15	1	15	self	t	f	f	2019-02-10 17:10:24.913+00	2019-02-10 17:10:24.913+00
12	Ambush (Assassin)	ambush-(assassin)	http:/localhost/assets/images/ambush-(assassin).png	http://localhost/assets/images/ambush-(assassin).svg	Step from the shadows to deliver a lethal surprise attack while generating Pips. Exposed targets are critically hit for 181-272 + 227% Weapon Damage and generate three Pips, while those who are not take x-y + z% Weapon Damage and generate two Pips.	melee attack	instant	N/A	N/A	0	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.913+00	2019-02-10 17:10:24.913+00
13	Ambush (Duelist)	ambush-(duelist)	http:/localhost/assets/images/ambush-(duelist).png	http://localhost/assets/images/ambush-(duelist).svg	Leap out of your Burrow performing a deadly surpise attack for 82 - 123 + 102% Weapon Damage and generating two Pips. If AMBUSH hits an Exposed enemy while they attack or use an ability they are knocked down, take additional damage and you earn additional Pips.	crowd control self	instant	N/A	N/A	9	0	1	5	cone	f	f	f	2019-02-10 17:10:24.913+00	2019-02-10 17:10:24.913+00
14	Angel of Death	angel-of-death	http:/localhost/assets/images/angel-of-death.png	http://localhost/assets/images/angel-of-death.svg	Deal 30% more Damage to enemies below 30% Health.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.913+00	2019-02-10 17:10:24.913+00
15	Arcane Barrier	arcane-barrier	http:/localhost/assets/images/arcane-barrier.png	http://localhost/assets/images/arcane-barrier.svg	Protect yourself with a Barrier preventing up to 2500 Elemental Damage or 500 damage of other types.	buff	instant	energy	16	45	0	1	0	self	t	f	f	2019-02-10 17:10:24.913+00	2019-02-10 17:10:24.913+00
16	Archers Stake	archers-stake	http:/localhost/assets/images/archers-stake.png	http://localhost/assets/images/archers-stake.svg	Create a field granting 100 Attack Power to you and snaring enemies.	buff	instant	energy	131	45	35	1	5	self	f	f	f	2019-02-10 17:10:24.913+00	2019-02-10 17:10:24.913+00
17	Arcing Slash	arcing-slash	http:/localhost/assets/images/arcing-slash.png	http://localhost/assets/images/arcing-slash.svg	Slash upward violently inflicting 50-62 + 56% Weapon Damage.	melee attack	instant	fury	20	0	0	5	5.5	cone	f	f	f	2019-02-10 17:10:24.914+00	2019-02-10 17:10:24.914+00
18	Aura of Terror	aura-of-terror	http:/localhost/assets/images/aura-of-terror.png	http://localhost/assets/images/aura-of-terror.svg	Surround yourself with a chilling aura of palpable fear that automatically reveals Stealthed enemies.  Enemies who remain nearby for too long are Suppressed and then afflicted with Frostbite.	debuff	instant	resource	16	30	0	0	5	self	t	f	f	2019-02-10 17:10:24.914+00	2019-02-10 17:10:24.914+00
19	Aurora Emitter	aurora-emitter	http:/localhost/assets/images/aurora-emitter.png	http://localhost/assets/images/aurora-emitter.svg	Strike enemies with lightning in an area for 79 - 119 damage. Enemies are left electrified and will inflict and additional 27 to 40 + #weapon_damage_2_value#% Weapon Damage over 15 seconds to nearby friendlies.	ranged attack	instant	resource	77	24	15	5	35	sphere	f	t	f	2019-02-10 17:10:24.914+00	2019-02-10 17:10:24.914+00
20	Back to Work	back-to-work	http:/localhost/assets/images/back-to-work.png	http://localhost/assets/images/back-to-work.svg	Instantly restores 2 Harvest Pips and 8 Stamina to all your group members. Does not affect the caster.	buff	instant	harvest pips	4	6	8	1	0	self	t	f	f	2019-02-10 17:10:24.914+00	2019-02-10 17:10:24.914+00
21	Backhand	backhand	http:/localhost/assets/images/backhand.png	http://localhost/assets/images/backhand.svg	Backhand the target in front of you, stunning and dealing 113-153 + 133% Crushing Weapon Damage.	melee attack	instant	N/A	N/A	30	0	1	5	melee	t	f	f	2019-02-10 17:10:24.914+00	2019-02-10 17:10:24.914+00
22	Backstab	backstab	http:/localhost/assets/images/backstab.png	http://localhost/assets/images/backstab.svg	Run an enemy through with a deadly strike generating two Pips and causing 133-200 + 167% Weapon Damage when striking from behind or generating one Pip and causing 17-25+ 21% Weapon Damage otherwise.	melee attack	instant	N/A	N/A	6	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.914+00	2019-02-10 17:10:24.914+00
23	Banner of Storms	banner-of-storms	http:/localhost/assets/images/banner-of-storms.png	http://localhost/assets/images/banner-of-storms.svg	Deploy a banner overriding the damage of all nearby group members to Electric and increasing their Electric Armor by 25.	buff	instant	resource	16	23	30	5	15	area	t	f	f	2019-02-10 17:10:24.914+00	2019-02-10 17:10:24.914+00
24	Banshee Wail	banshee-wail	http:/localhost/assets/images/banshee-wail.png	http://localhost/assets/images/banshee-wail.svg	Wail in front of you reducing the Movement Speed of up to 5 enemies.	debuff	instant	resource	14	24	0	5	5	cone	t	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
25	Bark Skin	bark-skin	http:/localhost/assets/images/bark-skin.png	http://localhost/assets/images/bark-skin.svg	Toughen the hide of group members and yourself applying Barrier for 15 seconds preventing 175-325 damage.	buff	instant	essence	35	23	20	5	0	group	f	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
26	Barrage	barrage	http:/localhost/assets/images/barrage.png	http://localhost/assets/images/barrage.svg	Shoot 6 volleys of arrows at a ground location, dealing 30 - 40 + 35% Weapon Damage per volley, up to 5 targets within 8m. This Power's Maximum Range cannot be modified	ranged attack	ground aimed	resource	6	9	0	5	35	area	f	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
27	Basic Block	basic-block	http:/localhost/assets/images/basic-block.png	http://localhost/assets/images/basic-block.svg	Raise your shield Blocking attacks, reducing damage and preventing crowd control effects.	buff	instant	resource	12	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
28	Battle Chant	battle-chant	http:/localhost/assets/images/battle-chant.png	http://localhost/assets/images/battle-chant.svg	Summon spinning hammers lasting 12 seconds to damage nearby enemies for 85 - 115 + 100% Weapon Damage.	melee attack	instant	resource	12	24	12	0	5	self	t	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
29	Bearers Insignia	bearers-insignia	http:/localhost/assets/images/bearers-insignia.png	http://localhost/assets/images/bearers-insignia.svg	Increase your Out of Combat Health Regen by 10 and apply a barrier when your Health is critically low.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
30	Benediction	benediction	http:/localhost/assets/images/benediction.png	http://localhost/assets/images/benediction.svg	Benediction Bless group members and yourself increasing Bleed Armor by 50 for 30 seconds.	buff	instant	resource	12	45	30	5	0	group	t	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
31	Berserk	berserk	http:/localhost/assets/images/berserk.png	http://localhost/assets/images/berserk.svg	Overcome with bloodlust you continually recover all lost Health for 8 seconds. When the effect ends your suffer Berserk Crash and all recovered Health is lost again. The Scent of Blood reduces Health loss from Berserk Crash. Health loss is prevented altogether while Raging.	transformation	instant	fury	56	12	8	1	0	self	f	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
32	Berserker Strength	berserker-strength	http:/localhost/assets/images/berserker-strength.png	http://localhost/assets/images/berserker-strength.svg	Attacks have a chance to increase Attack Power by 150 and add a protective Barrier.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
33	Binding Arrows	binding-arrows	http:/localhost/assets/images/binding-arrows.png	http://localhost/assets/images/binding-arrows.svg	Pin down multiple enemies in an area Rooting them in place and causing 45-60 + 53% Weapon Damage. This Power's Maximum Range cannot be modified.	ranged attack	ground aimed	energy	12	24	5	5	35	area	t	f	f	2019-02-10 17:10:24.915+00	2019-02-10 17:10:24.915+00
34	Blade Turning	blade-turning	http:/localhost/assets/images/blade-turning.png	http://localhost/assets/images/blade-turning.svg	Gain a Slashing damage immune Barrier for 15 seconds.	buff	instant	resource	16	45	15	0	0	self	t	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
35	Blast of Leaves	blast-of-leaves	http:/localhost/assets/images/blast-of-leaves.png	http://localhost/assets/images/blast-of-leaves.svg	Blasts Leaves healing allies in front of you for 102-138 + 120% Weapon Damage multiple times per second.	buff	hold channeled	resource	70	20	0	5	7.5	rectangle	t	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
36	Blight	blight	http:/localhost/assets/images/blight.png	http://localhost/assets/images/blight.svg	Deploy a field causing each Coalesce Life orb to explode catasrophically for 86 - 130 + 108% Weapon Damage while Coalesce Nature orbs explode for 90 to 136 + 113% Weapon Damage. Reduces Earth and Electric defenses by 20%.	debuff	instant	essence	57	23	30	5	10	area	f	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
37	Block (Cleric)	block-(cleric)	http:/localhost/assets/images/block-(cleric).png	http://localhost/assets/images/block-(cleric).svg	Raise your shield Blocking attacks, reducing damage and preventing crowd control effects. Group members recieve healing whenever enemies strike you with an attack inflicting more than 150 damage while Block is active.	block	hold channeled	stamina	6	0	0	1	5	self	f	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
38	Block (Knight)	block-(knight)	http:/localhost/assets/images/block-(knight).png	http://localhost/assets/images/block-(knight).svg	Raise your shield Blocking attacks, reducing damage and preventing crowd control effects.  Enemies striking you with Elemental attacks take 100% Weapon Damage in return. Increases damage by 15% for 5 seconds for each 150 damage taken while Blocking.  Taking more that 150 damage while Blocking activates Shield Bash and increases damage by 15% for 5 seconds for each 150 damage taken while Blocking.	crowd control self	hold channeled	energy	1	0	5	1	5	self	f	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
39	Blood of the Giant	blood-of-the-giant	http:/localhost/assets/images/blood-of-the-giant.png	http://localhost/assets/images/blood-of-the-giant.svg	Embrace your Giant heritage increasing size, Damage Bonus, and Healing Bonus by 5%. This effect can stack twice.	buff	instant	Hate	100	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
40	Blood Pact	blood-pact	http:/localhost/assets/images/blood-pact.png	http://localhost/assets/images/blood-pact.svg	Grants a Blood Pact for 15 seconds, which allow all powers to consume Hitpoints instead of their normal resource type	buff	instant	resource	16	45	15	1	0	self	t	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
41	Blood Price	blood-price	http:/localhost/assets/images/blood-price.png	http://localhost/assets/images/blood-price.svg	Extract Blood Orbs from your enemies as you attack. Picking up Blood Orbs heals you for 113-153 + 133% Weapon Damage and increases your Attack Power by 100 for 60 seconds.	passive	passive	N/A	N/A	0	60	1	0	self	t	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
42	Blood Strike 2	blood-strike-2	http:/localhost/assets/images/blood-strike-2.png	http://localhost/assets/images/blood-strike-2.svg	Slash enemies for 62-83 + 72% Weapon Damage.	melee attack	instant	resource	14	5	0	5	5	cone	t	t	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
43	Blood Strike 3	blood-strike-3	http:/localhost/assets/images/blood-strike-3.png	http://localhost/assets/images/blood-strike-3.svg	Attack multiple enemies for 117-158 + 138% Weapon Damage and causing them to Bleed for 50-75 + 6% Weapon Damage per tick.	debuff	instant	resource	25	24	0	5	5	cone	t	t	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
44	Blood Strike	blood-strike	http:/localhost/assets/images/blood-strike.png	http://localhost/assets/images/blood-strike.svg	Slash enemies for 46-75 + 65% Weapon Damage.	melee attack	instant	resource	15	9	0	5	5	cone	t	f	f	2019-02-10 17:10:24.916+00	2019-02-10 17:10:24.916+00
45	Bloodied Swipe	bloodied-swipe	http:/localhost/assets/images/bloodied-swipe.png	http://localhost/assets/images/bloodied-swipe.svg	Leap forward striking twice for 39-48 + 43% Weapon Damage.	melee attack	instant	fury	16	0	0	1	5.5	cone	f	f	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
46	Bloodstone Spin	bloodstone-spin	http:/localhost/assets/images/bloodstone-spin.png	http://localhost/assets/images/bloodstone-spin.svg	Slash in front of you for 88-119 + 103% Weapon Damage. Scoring three or more consecutive basic attack hits activates Shield Bash.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
47	Bloodthirst	bloodthirst	http:/localhost/assets/images/bloodthirst.png	http://localhost/assets/images/bloodthirst.svg	Overcome with bloodthirst you continually recover 50% of all lost Health for 8 seconds. When the effect ends you suffer Bloodthirst Crash and take 50% of the lost health over the next 8 seconds.	buff	instant	fury	25	30	8	1	0	self	t	f	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
48	Bound	bound	http:/localhost/assets/images/bound.png	http://localhost/assets/images/bound.svg	Bound quickly moving 10m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 10 seconds.	dodge	instant	dodge	1	0	0	1	10	self	t	f	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
49	Bounty of the Land	bounty-of-the-land	http:/localhost/assets/images/bounty-of-the-land.png	http://localhost/assets/images/bounty-of-the-land.svg	Increases your chance to Harvest Apples, Pine Nuts, Wood Grubs by 5% and grants the chance to Harvest Bloodworms by 3%, when Harvesting Trees or Animals.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
50	Bow Shot 2	bow-shot-2	http:/localhost/assets/images/bow-shot-2.png	http://localhost/assets/images/bow-shot-2.svg	Aim and strike at an enemy with Physical arrows for 170-230 + 200% Weapon Damage.	ranged attack	charged	energy	32	0	0	1	15	ray	f	t	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
51	Bow Shot 3	bow-shot-3	http:/localhost/assets/images/bow-shot-3.png	http://localhost/assets/images/bow-shot-3.svg	Aim and strike at an enemy with Physical arrows for 170-230 + 200% Weapon Damage.	ranged attack	charged	energy	32	0	0	1	15	ray	f	t	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
52	Bow Shot	bow-shot	http:/localhost/assets/images/bow-shot.png	http://localhost/assets/images/bow-shot.svg	Aim and strike at an enemy with Physical arrows for 170-230 + 200% Weapon Damage.	ranged attack	charged	energy	32	0	0	1	15	ray	f	f	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
53	Brilliance	brilliance	http:/localhost/assets/images/brilliance.png	http://localhost/assets/images/brilliance.svg	Shine with golden light briefly becoming invulnerable, increasing your maximum Health for 20 seconds as well as blinding and damaging nearby enemies for 107 - 160 + 133% Fire Weapon Damage.	ultimate	instant	N/A	N/A	5	0	5	0	sphere	f	f	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
54	Brutal Slam	brutal-slam	http:/localhost/assets/images/brutal-slam.png	http://localhost/assets/images/brutal-slam.svg	Strike with your shield for 113 - 153 + 133% Weapon Damage and lower their Physical Armor by 20.	debuff	instant	resource	16	45	0	5	5	cone	t	f	f	2019-02-10 17:10:24.917+00	2019-02-10 17:10:24.917+00
55	Brutal Strike	brutal-strike	http:/localhost/assets/images/brutal-strike.png	http://localhost/assets/images/brutal-strike.svg	Attack in front of you for 168-227 + 197% Crushing Weapon Damage.	melee attack	instant	energy	281	9	0	1	5	cone	f	t	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
56	Bull Rush	bull-rush	http:/localhost/assets/images/bull-rush.png	http://localhost/assets/images/bull-rush.svg	Charge forward dragging enemies along with you and causing 123-150 + 137% Weapon Damage.	crowd control	instant	fury	31	30	0	3	7	rectangle	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
57	Burning Hatred	burning-hatred	http:/localhost/assets/images/burning-hatred.png	http://localhost/assets/images/burning-hatred.svg	Seethe with anger as your damaging attacks periodically create a Fae Wisp, consumable only by you, restoring 1.8% - 2.2% of your maximum Health.	passive	passive	N/A	N/A	0	60	1	0	self	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
58	Burst of Strength	burst-of-strength	http:/localhost/assets/images/burst-of-strength.png	http://localhost/assets/images/burst-of-strength.svg	Deal 100% additional Harvest Base Damage to any resource node type. Lasts 6 seconds or 2 hits, whichever comes first.	buff	instant	harvest pips	4	6	6	1	0	self	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
59	Call Darkness	call-darkness	http:/localhost/assets/images/call-darkness.png	http://localhost/assets/images/call-darkness.svg	All attacks count as if you are attacking from behind your targets while active.	buff	instant	resource	16	23	0	1	0	self	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
60	Call Flames	call-flames	http:/localhost/assets/images/call-flames.png	http://localhost/assets/images/call-flames.svg	Call Flames, increase your Damage Bonus: Fire by 10% for 15 seconds and apply a Major Burning damage over time effect to up to 5 enemies within 6m.	debuff	instant	N/A	N/A	45	15	5	6	reticle	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
61	Call Storm	call-storm	http:/localhost/assets/images/call-storm.png	http://localhost/assets/images/call-storm.svg	Call lightning to strike a target stunning them and causing 60 - 90 + 75% Electric Weapon Damage.  Afterward they suffer Severe Electrocution taking 17 - 25 + 2% Electric Weapon Damage per tick.	debuff	instant	resource	12	30	0	5	35	ray	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
62	Caltrops	caltrops	http:/localhost/assets/images/caltrops.png	http://localhost/assets/images/caltrops.svg	Harass enemies for 15 seconds covering the targeted area with dangerous caltrops, reducing Piercing Armor and Slowing them while maintaining Stealth.	crowd control	ground aimed	resource	13	24	15	5	35	area	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
63	Camouflage	camouflage	http:/localhost/assets/images/camouflage.png	http://localhost/assets/images/camouflage.svg	Hide from sight automatically when standing still and not in combat.	buff	toggle	stamina	0.5	5	0	1	0	self	t	f	f	2019-02-10 17:10:24.918+00	2019-02-10 17:10:24.918+00
64	Candle That Burns	candle-that-burns	http:/localhost/assets/images/candle-that-burns.png	http://localhost/assets/images/candle-that-burns.svg	Increase your Damage Bonus by 10% and Power Efficiency by 5% for 12 Seconds	buff	instant	resource	25	45	12	1	0	self	t	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
65	Careful Aim	careful-aim	http:/localhost/assets/images/careful-aim.png	http://localhost/assets/images/careful-aim.svg	Increase your Critical Hit Chance while standing still.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
66	Careless Whisper	careless-whisper	http:/localhost/assets/images/careless-whisper.png	http://localhost/assets/images/careless-whisper.svg	When you execute a Primary Attack which damages an enemy, you gain a stack of Whispers. If you gain 5 Whispers in 12 seconds, Empowered Whispers is applied, which increases your Critical Hit Chance by 10% and your Critical Damage by 10% for 6 seconds.	passive	passive	N/A	N/A	0	6	1	0	self	t	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
67	Cartwheel	cartwheel	http:/localhost/assets/images/cartwheel.png	http://localhost/assets/images/cartwheel.svg	Cartwheel in a WASD direction. (tooltip broken)	dodge	instant	dodge	1	0	0	1	10	self	t	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
68	Cast Net	cast-net	http:/localhost/assets/images/cast-net.png	http://localhost/assets/images/cast-net.svg	Fling a net at your target rooting them in place and inflicting 83-102 + 93% Weapon Damage.	crowd control	instant	fury	17	9	0	1	30	reticle	f	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
69	Castigate	castigate	http:/localhost/assets/images/castigate.png	http://localhost/assets/images/castigate.svg	Slash multiple enemies for 61-92 + 76% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	5	5	cone	f	t	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
70	Cauterize	cauterize	http:/localhost/assets/images/cauterize.png	http://localhost/assets/images/cauterize.svg	Remove Bleeding effects.	buff	instant	resource	10	9	0	1	0	self	t	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
71	Censure	censure	http:/localhost/assets/images/censure.png	http://localhost/assets/images/censure.svg	Lunge forward with a sword strike stunning an enemy and causing 100-149 + 124% Weapon Damage.	non-aggressive	instant	N/A	N/A	9	0	1	20	reticle	f	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
72	Centaur Bloodline	centaur-bloodline	http:/localhost/assets/images/centaur-bloodline.png	http://localhost/assets/images/centaur-bloodline.svg	Gain Trailmaster and increase Out of Combat Movement Speed by 25%. Chance after suffering a damaging attack from melee to activate a combo to kick behind you for 60-73 + 67% Weapon Damage and knockback those hit.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
73	Chain Attack	chain-attack	http:/localhost/assets/images/chain-attack.png	http://localhost/assets/images/chain-attack.svg	Throw a chain to pull enemies toward you causing 130-176 + 153%, applying a large pulling force to any enemy causing 130-176 + 153% and dazing them for 4 seconds.	crowd control	instant	energy	281	24	0	1	30	reticle	f	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
74	Chain Heal	chain-heal	http:/localhost/assets/images/chain-heal.png	http://localhost/assets/images/chain-heal.svg	Heals a targeted ally for 158 - 193 + 175% Weapon Damage, then jumps to heal a nearby ally. Chain Heal will jump to as many as 2 with healing reduced by 30% each jump.	buff	instant	resource	22	9	0	2	35	ray	t	f	f	2019-02-10 17:10:24.919+00	2019-02-10 17:10:24.919+00
75	Charge	charge	http:/localhost/assets/images/charge.png	http://localhost/assets/images/charge.svg	Charge toward your target inflicting 72-88 + 80% Weapon Damage.	melee attack	instant	fury	13	0	0	1	30	reticle	f	t	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
76	Cheap Shot	cheap-shot	http:/localhost/assets/images/cheap-shot.png	http://localhost/assets/images/cheap-shot.svg	Waylay an enemy from stealth stunning them for 5 seconds if they are Exposed or 3 seconds otherwise, and generating Pips. This stun is unaffected by the target's Resolve or any Stun duration reducing skills.	instant	instant	N/A	N/A	0	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
77	Circle of Life	circle-of-life	http:/localhost/assets/images/circle-of-life.png	http://localhost/assets/images/circle-of-life.svg	Target a large area and revive up to five unconscious vessels.	resurrection	10 seconds	N/A	N/A	600	0	5	0	area	f	f	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
78	Cleave	cleave	http:/localhost/assets/images/cleave.png	http://localhost/assets/images/cleave.svg	Basic attacks hit one additional target.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
79	Clobber 2	clobber-2	http:/localhost/assets/images/clobber-2.png	http://localhost/assets/images/clobber-2.svg	Bash an enemy Dazing them and inflicting 76 - 103 + 90% Weapon Damage.	crowd control	instant	resource	10	24	0	1	5	cone	t	t	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
80	Clobber	clobber	http:/localhost/assets/images/clobber.png	http://localhost/assets/images/clobber.svg	Smash an enemy for 68 - 92 + 80% Weapon Damage.	melee attack	instant	resource	10	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
81	Coalesce Life 2	coalesce-life-2	http:/localhost/assets/images/coalesce-life-2.png	http://localhost/assets/images/coalesce-life-2.svg	Manifest an Orb at your targeted location that allies or you may use to heal 32 to 40 + 144% Weapon Damage.	non-aggressive	instant	resource	46	0	60	1	0	area	f	t	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
82	Coalesce Life	coalesce-life	http:/localhost/assets/images/coalesce-life.png	http://localhost/assets/images/coalesce-life.svg	Manifest an Orb at your targeted location that allies or you may use to heal 32 to 40 + 144% Weapon Damage.	non-aggressive	instant	resource	46	0	60	1	0	area	f	f	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
83	Coalesce Nature	coalesce-nature	http:/localhost/assets/images/coalesce-nature.png	http://localhost/assets/images/coalesce-nature.svg	Manifest an Orb at your targeted location that allies or you may use to heal 72-88 + 320% Weapon Damage as well as restoring resources for allies.	non-aggressive	instant	N/A	N/A	0	60	1	0	area	f	t	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
84	Colossus Smash	colossus-smash	http:/localhost/assets/images/colossus-smash.png	http://localhost/assets/images/colossus-smash.svg	Leap into the air and strike with both axes stunning an enemy and causing 165-201 + 183% Weapon Damage.	crowd control	instant	fury	31	9	0	1	6	cone	f	t	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
85	Concentration	concentration	http:/localhost/assets/images/concentration.png	http://localhost/assets/images/concentration.svg	Standing still for 3 seconds restores Mana and Zealotry every second until you move.	passive	passive	N/A	N/A	0	3	0	0	self	t	f	f	2019-02-10 17:10:24.92+00	2019-02-10 17:10:24.92+00
86	Condemnation	condemnation	http:/localhost/assets/images/condemnation.png	http://localhost/assets/images/condemnation.svg	Condemns all targets in front of you dealing 14 -21 + 17% Weapon Damage multiple times per second. If the targets are under the effect of Sin they take increased damage per stack of Sin to a maximum of 18 - 23 + 23% Weapon Damage.	melee attack	hold channeled	resource	20	9	0	5	7.5	rectangle	f	f	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
87	Conduction	conduction	http:/localhost/assets/images/conduction.png	http://localhost/assets/images/conduction.svg	Increase your Attack Power for 30 seconds when damaged by Fire.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
88	Consonant Chains	consonant-chains	http:/localhost/assets/images/consonant-chains.png	http://localhost/assets/images/consonant-chains.svg	Damages a targeted enemy for 227 - 307 + 267% Weapon Damage, then jumps to damage a nearby enemy. Consonant Chains will jump to as many as 5 additional targets with damage reduced by 30% each jump. Targets hit will suffer a Movement Speed reduction. Type 1 Song.	debuff	toggle	resource	32	6	12	5	20	ray	t	f	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
89	Contain Essence	contain-essence	http:/localhost/assets/images/contain-essence.png	http://localhost/assets/images/contain-essence.svg	Raise your Life affinity reducing your Essence Gain by 35% for 45 seconds.	buff	instant	resource	26	5	45	1	0	self	f	t	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
90	Crazy Pills	crazy-pills	http:/localhost/assets/images/crazy-pills.png	http://localhost/assets/images/crazy-pills.svg	Gain Attack Power with the buff amount increasing as your Resource pool decreases.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
91	Crippling Stab 2	crippling-stab-2	http:/localhost/assets/images/crippling-stab-2.png	http://localhost/assets/images/crippling-stab-2.svg	Stab an enemy with a quick strike reducing your short cooldown time and causing 49-67 + 58% Weapon Damage.	buff	instant	resource	6	30	0	1	5	cone	t	t	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
92	Crippling Stab	crippling-stab	http:/localhost/assets/images/crippling-stab.png	http://localhost/assets/images/crippling-stab.svg	Stab an enemy for 48-64 + 56% Weapon Damage.	melee attack	instant	resource	7	5	0	1	5	cone	t	f	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
93	Critical Dodge	critical-dodge	http:/localhost/assets/images/critical-dodge.png	http://localhost/assets/images/critical-dodge.svg	Recover one Dodge when hitting critically.  This effect can occur twice in 45 seconds.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.921+00	2019-02-10 17:10:24.921+00
94	Critical Hack 2	critical-hack-2	http:/localhost/assets/images/critical-hack-2.png	http://localhost/assets/images/critical-hack-2.svg	Strike an enemy twice for 87-118 + 103% Weapon Damage and increase your Critical Hit Chance	buff	instant	energy	10	23	15	5	5	cone	t	f	f	2019-02-10 17:10:24.922+00	2019-02-10 17:10:24.922+00
95	Critical Hack	critical-hack	http:/localhost/assets/images/critical-hack.png	http://localhost/assets/images/critical-hack.svg	Slash an enemy for 131-177 + 154% Weapon Damage.	melee attack	instant	energy	18	9	0	5	5	cone	t	f	f	2019-02-10 17:10:24.922+00	2019-02-10 17:10:24.922+00
96	Critical Slice 2	critical-slice-2	http:/localhost/assets/images/critical-slice-2.png	http://localhost/assets/images/critical-slice-2.svg	Gain the advantage over an enemy increasing your Critical Hit Damage and causing 94 - 127 + 111% Weapon Damage.	buff	instant	resource	12	23	15	1	5	cone	t	t	f	2019-02-10 17:10:24.922+00	2019-02-10 17:10:24.922+00
97	Critical Slice	critical-slice	http:/localhost/assets/images/critical-slice.png	http://localhost/assets/images/critical-slice.svg	Slice an enemy for 77 - 105 + 91% Weapon Damage.	melee attack	instant	resource	11	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.922+00	2019-02-10 17:10:24.922+00
98	Cross Slash 2	cross-slash-2	http:/localhost/assets/images/cross-slash-2.png	http://localhost/assets/images/cross-slash-2.svg	Slash in front of you for 86-117 + 101% Weapon Damage. Applies a Moderate Bleed effect.	melee attack	instant	energy	34	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.922+00	2019-02-10 17:10:24.922+00
99	Cross Slash	cross-slash	http:/localhost/assets/images/cross-slash.png	http://localhost/assets/images/cross-slash.svg	Slash in front of you for 35-47 + 41% Weapon Damage. Applies a Moderate Bleed effect.	melee attack	instant	energy	31	9	0	1	5	cone	f	f	f	2019-02-10 17:10:24.923+00	2019-02-10 17:10:24.923+00
100	Curse Weapon	curse-weapon	http:/localhost/assets/images/curse-weapon.png	http://localhost/assets/images/curse-weapon.svg	Ensorcel your weapon with a cruel enchantment causing its damage type to become Disease with the duration scaling with Pips spent. 1 Pip: 10 seconds. 2 Pips: 15 seconds. 3 Pips: 20 seconds. 4 Pips: 25 Seconds. 5 Pips: 30 seconds.	buff	instant	pips	1	0	0	1	5	self	f	f	f	2019-02-10 17:10:24.923+00	2019-02-10 17:10:24.923+00
101	Cut and Thrust 2	cut-and-thrust-2	http:/localhost/assets/images/cut-and-thrust-2.png	http://localhost/assets/images/cut-and-thrust-2.svg	Penetrate an enemy's Block or Parry Stunning them and inflicting 70 - 95 + 83% Weapon Damage.	debuff	instant	resource	10	9	0	1	5	cone	t	t	f	2019-02-10 17:10:24.923+00	2019-02-10 17:10:24.923+00
102	Cut and Thrust	cut-and-thrust	http:/localhost/assets/images/cut-and-thrust.png	http://localhost/assets/images/cut-and-thrust.svg	Stab an enemy twice for 70 - 95 + 82% Weapon Damage.	melee attack	instant	resource	10	5	0	1	5	cone	t	f	f	2019-02-10 17:10:24.923+00	2019-02-10 17:10:24.923+00
103	Dagger Spin 2	dagger-spin-2	http:/localhost/assets/images/dagger-spin-2.png	http://localhost/assets/images/dagger-spin-2.svg	Spin in place and deal 46-62 + 54% Weapon Damage around you.	melee attack	instant	energy	34	0	0	5	6	sphere	f	t	f	2019-02-10 17:10:24.923+00	2019-02-10 17:10:24.923+00
104	Dagger Spin 3	dagger-spin-3	http:/localhost/assets/images/dagger-spin-3.png	http://localhost/assets/images/dagger-spin-3.svg	Spin in place and deal 52 - 70 + 61% Weapon Damage around you.	melee attack	instant	energy	34	5	0	5	6	sphere	f	t	f	2019-02-10 17:10:24.923+00	2019-02-10 17:10:24.923+00
105	Dagger Spin 4	dagger-spin-4	http:/localhost/assets/images/dagger-spin-4.png	http://localhost/assets/images/dagger-spin-4.svg	Spin in place and deal 57-77 + 67% Weapon Damage around you.	melee attack	instant	energy	34	5	0	5	6	sphere	f	t	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
106	Dagger Spin	dagger-spin	http:/localhost/assets/images/dagger-spin.png	http://localhost/assets/images/dagger-spin.svg	Spin in place and deal 41-55 + 48% Weapon Damage around you.	melee attack	instant	energy	34	5	0	5	6	sphere	f	f	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
107	Dagger Storm 2	dagger-storm-2	http:/localhost/assets/images/dagger-storm-2.png	http://localhost/assets/images/dagger-storm-2.svg	Fling throwing daggers in all directions hitting multiple enemies for 67-101 + 84% Weapon Damage.	ranged attack	instant	pips	1	0	0	5	5	sphere	f	t	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
108	Dagger Storm 3	dagger-storm-3	http:/localhost/assets/images/dagger-storm-3.png	http://localhost/assets/images/dagger-storm-3.svg	Fling throwing daggers in all directions hitting multiple enemies for 78-118 + 98% Weapon Damage.	ranged attack	instant	pips	1	0	0	5	5	sphere	f	t	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
109	Dagger Storm 4	dagger-storm-4	http:/localhost/assets/images/dagger-storm-4.png	http://localhost/assets/images/dagger-storm-4.svg	Fling throwing daggers in all directions hitting multiple enemies for 90-134 + 112% Weapon Damage.	ranged attack	instant	pips	1	0	0	5	5	sphere	f	t	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
110	Dagger Storm	dagger-storm	http:/localhost/assets/images/dagger-storm.png	http://localhost/assets/images/dagger-storm.svg	Spend one Pip and fling throwing daggers in all directions hitting multiple enemies for 56-84 + 70% Weapon Damage.	ranged attack	instant	pips	1	0	0	5	5	sphere	f	f	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
111	Dash	dash	http:/localhost/assets/images/dash.png	http://localhost/assets/images/dash.svg	Dash 10m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 10 seconds.	dodge	instant	dodge	1	0	0	5	10	rectangle	t	f	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
112	Dazzling Blades	dazzling-blades	http:/localhost/assets/images/dazzling-blades.png	http://localhost/assets/images/dazzling-blades.svg	Disorient multiple enemies with an attack reducing their Critical Hit Chance by 40 for 15 seconds and inflicting 151-204 + 178% Weapon Damage.	debuff	instant	resource	21	23	15	3	5	cone	t	f	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
113	Deadly Retaliation	deadly-retaliation	http:/localhost/assets/images/deadly-retaliation.png	http://localhost/assets/images/deadly-retaliation.svg	Jump to your feet dealing 113-153 + 133% Weapon Damage to nearby enemies. This attack is a guaranteed Critical Hit.	debuff	instant	resource	16	0	0	5	5	cone	t	f	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
114	Death Throws	death-throws	http:/localhost/assets/images/death-throws.png	http://localhost/assets/images/death-throws.svg	Furiously Knockdown nearby enemies when you use a Retaliate ability if your Health is under 50%	passive	passive	resource	16	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.924+00	2019-02-10 17:10:24.924+00
115	Decay	decay	http:/localhost/assets/images/decay.png	http://localhost/assets/images/decay.svg	Infect an enemy with a Disease and reduce Healing Received.  If Decay hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	debuff	charged	resource	13	45	0	1	30	ray	t	f	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
116	Demolish Armor	demolish-armor	http:/localhost/assets/images/demolish-armor.png	http://localhost/assets/images/demolish-armor.svg	Demolish an enemy's Physical armor causing 120 - 163 + 142% Weapon Damage.	debuff	instant	energy	17	23	0	1	5	cone	t	f	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
147	Executioner	executioner	http:/localhost/assets/images/executioner.png	http://localhost/assets/images/executioner.svg	Increase the damage of Execution abilities.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
117	Devotion	devotion	http:/localhost/assets/images/devotion.png	http://localhost/assets/images/devotion.svg	Recite a benediction healing group members and you based on the damage you inflict and revealing Sin within enemies attacked for 15 seconds.	buff	instant	righteousness	1	23	15	5	0	group	f	f	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
118	Diffusion	diffusion	http:/localhost/assets/images/diffusion.png	http://localhost/assets/images/diffusion.svg	Execute a versatile attack against a victim afflicted with a Toxin with effects varying by your equipped Toxin and scaling with Pips spent. Exposed targets are also knocked down if struck while attacking. See individual Toxin descriptions for specific details. Poison Toxin: Poison additional nearby enemies when used against a Poisoned target. Earth Toxin: Cause additional damage and slow enemies afflicted with an Earth Toxin. Disease Toxin: Prevent healing with Blackmantle against enemies afflicted with Disease Toxin.	debuff	instant	pips	1	0	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
119	Dig In	dig-in	http:/localhost/assets/images/dig-in.png	http://localhost/assets/images/dig-in.svg	When dropping below 25% Health you become immune to being Critically Hit.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
120	Dirge of Dissonance	dirge-of-dissonance	http:/localhost/assets/images/dirge-of-dissonance.png	http://localhost/assets/images/dirge-of-dissonance.svg	Sing for 12 seconds, affecting up to 5 enemies within 10m. Deals 100 - 150 + 12% Weapon Damage every 3 seconds. Type 3 Song.	melee attack	toggle	resource	32	1	12	5	10	point blank area	t	f	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
121	Disarming Shout	disarming-shout	http:/localhost/assets/images/disarming-shout.png	http://localhost/assets/images/disarming-shout.svg	Suppress enemies, disabling their powers for 6 seconds. Deals 154-208 + 181% Weapon Damage. Consumes a point of Dominance when used for a guaranteed critical hit.	crowd control	instant	rage	14	30	0	1	5	cone	f	t	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
122	Disengage (Assassin)	disengage-(assassin)	http:/localhost/assets/images/disengage-(assassin).png	http://localhost/assets/images/disengage-(assassin).svg	Quickly dash backward with an attack generating a Pip and causing 114-171 + 142% Weapon Damage.	movement	instant	N/A	N/A	0	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.925+00	2019-02-10 17:10:24.925+00
123	Disengage (Ranger)	disengage-(ranger)	http:/localhost/assets/images/disengage-(ranger).png	http://localhost/assets/images/disengage-(ranger).svg	Leap backwards rooting your target, dealing 149-201 + 175% Weapon Damage and placing you into your Ranged tray.	movement	instant	energy	125	24	0	1	25	cone	f	t	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
124	Dispel	dispel	http:/localhost/assets/images/dispel.png	http://localhost/assets/images/dispel.svg	Strip away an enemy's Barrier inflicting 91 - 123 + 107% Weapon Damage and causing Knockdown if a Barrier is removed.	debuff	instant	resource	13	9	0	5	15	reticle	t	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
125	Dissipate	dissipate	http:/localhost/assets/images/dissipate.png	http://localhost/assets/images/dissipate.svg	Ride the wind teleporting 18m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 20 seconds.	dodge	instant	dodge	1	0	0	1	18	self	t	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
126	Divine Light	divine-light	http:/localhost/assets/images/divine-light.png	http://localhost/assets/images/divine-light.svg	Declare hallowed ground draining yourself of Righteousness to purify the area while also earning Righteousness for each enemy standing within the field every four seconds. Enemies within the field periodically suffer 168 - 252 + 210% Fire Weapon Damage.  Allies and your are healed for 168 - 252 + 210% Weapon Damage while you have Righteousness remaining.	debuff	instant	righteousness	1	23	12	5	0	area	f	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
127	Divine Order	divine-order	http:/localhost/assets/images/divine-order.png	http://localhost/assets/images/divine-order.svg	Issue a holy decree instantly restoring some mana and increasing your Attack Power by an amount equal to your Support Power, causing your Spirit Hammers to chain up to two times for 79-97 + 88% Weapon Damage and occasionally Stunning enemies. Ultimate powers instantly remove and temporarily prevent control and expose effects and grant temporary damage invulnerability.	ultimate	instant	soul power	1000	0	0	5	20	group	f	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
128	Dodge (Fae)	dodge-(fae)	http:/localhost/assets/images/dodge-(fae).png	http://localhost/assets/images/dodge-(fae).svg	Escape from danger moving 12m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 12 seconds.	dodge	instant	dodge	1	0	0	1	12	self	t	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
129	Dodge (Minotaur)	dodge-(minotaur)	http:/localhost/assets/images/dodge-(minotaur).png	http://localhost/assets/images/dodge-(minotaur).svg	Leap away from danger moving 12m in your WASD direction at the cost of one Dodge pip and causing 71-87 + 79% Weapon Damage to nearby enemies where you land. You recover one Dodge pip every 12 seconds.	dodge	instant	dodge	1	0	0	1	12	self	t	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
130	Dodge Roll	dodge-roll	http:/localhost/assets/images/dodge-roll.png	http://localhost/assets/images/dodge-roll.svg	Roll quickly moving 10m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 10 seconds.	dodge	instant	dodge	1	0	0	1	10	self	t	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
131	Dominator	dominator	http:/localhost/assets/images/dominator.png	http://localhost/assets/images/dominator.svg	Earn a point of Dominance whenever you score a Critical Hit with a primary attack.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.926+00	2019-02-10 17:10:24.926+00
132	Double Slash	double-slash	http:/localhost/assets/images/double-slash.png	http://localhost/assets/images/double-slash.svg	Attack with both weapon simultaneously for 127-156 damage, causing your target to Bleed for 18 - 24 + #weapon_damage_2_values#% Weapon Damage.	debuff	instant	resource	20	0	0	1	5.5	cone	f	t	f	2019-02-10 17:10:24.927+00	2019-02-10 17:10:24.927+00
133	Elken Bloodline	elken-bloodline	http:/localhost/assets/images/elken-bloodline.png	http://localhost/assets/images/elken-bloodline.svg	Gain Trailmaster and increase Out of Combat Movement Speed by 25%.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.927+00	2019-02-10 17:10:24.927+00
134	Emerald Slash	emerald-slash	http:/localhost/assets/images/emerald-slash.png	http://localhost/assets/images/emerald-slash.svg	Slash in front of you for 86-117 + 101% Weapon Damage. Scoring three or more consecutive basic attacks activate Shield Bash.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.927+00	2019-02-10 17:10:24.927+00
135	Empower	empower	http:/localhost/assets/images/empower.png	http://localhost/assets/images/empower.svg	Embrace Death increasing your Essence Gain by 35% for 45 seconds.	buff	instant	resource	35	5	45	1	0	self	f	t	f	2019-02-10 17:10:24.927+00	2019-02-10 17:10:24.927+00
148	Explosive Thorns	explosive-thorns	http:/localhost/assets/images/explosive-thorns.png	http://localhost/assets/images/explosive-thorns.svg	Stretch the effectiveness of Thorns with a chance to cause additional damage to up to five nearby ennemies whenever you are damaged while a Thorns effect is active.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
402	Slow Growth	slow-growth	http:/localhost/assets/images/slow-growth.png	http://localhost/assets/images/slow-growth.svg	Favor the forces of Life reducing your Essence Gain by 50%.	passive	passive	N/A	N/A	0	0	5	0	self	t	f	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
136	Empowered Grave Digging	empowered-grave-digging	http:/localhost/assets/images/empowered-grave-digging.png	http://localhost/assets/images/empowered-grave-digging.svg	Greatly enhances the Energetic Harvesting power with additional Grave Digging effects. 1 Harvest Pip: When Energetic Harvest is activated also gain Empowered Grave Digging, which increases Grave Digging by 5%. 2 Harvest Pips: When Perceptive Harvest is activated also gain Perceptive Grave Digging, which increases Spot Weakness: Grave by 5%. 3 Harvest Pips: Increases the Stamina restore amount by 4. 4 Harvest Pips: When Heightened Harvest is activated also gain Heightened Grave Digging, which increases the effectiveness of any Energetic Harvest, Perceptive Harvest, and Stamina restore effects gained in the next 7 seconds. 5 Harvest Pips: When Furious Reaping is activated also adds Furious Grave Digging, which increases Harvest Base Damage: Grave by 30. Lasts 6 seconds or 2 hits, whichever comes first.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.927+00	2019-02-10 17:10:24.927+00
137	Empowered Logging	empowered-logging	http:/localhost/assets/images/empowered-logging.png	http://localhost/assets/images/empowered-logging.svg	Greatly enhances the Energetic Harvesting power with additional Logging effects. 1 Harvest Pip: When Energetic Harvest is activated also gain Empowered Logging, which increases Logging by 5%. 2 Harvest Pips: When Perceptive Harvest is activated also gain Perceptive Logging, which increases Spot Weakness: Wood by 5%. 3 Harvest Pips: Increases the Stamina restore amount by 4. 4 Harvest Pips: When Heightened Harvest is activated also gain Heightened Logging, which increases the effectiveness of any Energetic Harvest. Perceptive Harvest, and Stamina restore effects gained in the next 7 seconds. 5 Harvest Pips: When Furious Reaping is activated also adds Furious Logging, which increases Harvest Base Damage: Wood by 30. Lasts 6 seconds or 2 hits, whichever comes first.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.927+00	2019-02-10 17:10:24.927+00
138	Empowered Mining	empowered-mining	http:/localhost/assets/images/empowered-mining.png	http://localhost/assets/images/empowered-mining.svg	Greatly enhances the Energetic Harvesting power with additional Mining effects. 1 Harvest Pip: When Energetic Harvest is activated also gain Empowered Mining, which increases Mining by 5%. 2 Harvest Pips: When Perceptive Harvest is activated also gain Perceptive Mining, which increases Spot Weakness: Ore by 5%. 3 Harvest Pips: Increases the Stamina restore amount by 4. 4 Harvest Pips: When Heightened Harvest is activated also gain Heightened Mining, which increases the effectiveness of any Energetic Harvest, Perceptive Harvest, and Stamina restore effects gained in the next 7 seconds. 5 Harvest Pips: When Furious Reaping is activated also adds Furious Mining, which increases the Harvest Base Damage: Ore by 30. Lasts 6 seconds or 2 hits, whichever comes first.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.927+00	2019-02-10 17:10:24.927+00
139	Empowered Quarrying	empowered-quarrying	http:/localhost/assets/images/empowered-quarrying.png	http://localhost/assets/images/empowered-quarrying.svg	Greatly enhances the Energetic Harvesting power with additional Quarrying effects. 1 Harvest Pip: When Energetic Harvest is activated also gain Empowered Quarrying, which increases Quarrying by 5%. 2 Harvest Pips: When Perceptive Harvest is activated also gain Perceptive Quarrying, which increases Spot Weakness: Stone by 5%. 3 Harvest Pips: Increases the Stamina restore amount by 4. 4 Harvest Pips: When Heightened Harvest is activated also gain Heightened Quarrying, which increases the effectiveness of any Energetic Harvest, Perceptive Harvest, and Stamina restore effects gained in the next 7 seconds. 5 Harvest Pips: When Furious Reaping is activated also adds Furious Quarrying, which increases the Harvest Base Damage: Stone by 30. Lasts 6 seconds or 2 hits, whichever comes first.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
140	Empowered Skinning	empowered-skinning	http:/localhost/assets/images/empowered-skinning.png	http://localhost/assets/images/empowered-skinning.svg	Greatly enhances the Energetic Harvesting power with additional Skinning effects. 1 Harvest Pip: When Energetic Harvest is activated also gain Empowered Skinning, which increases Skinning by 5%. 2 Harvest Pips: When Perceptive Harvest is activated also gain Perceptive Skinning, which increases Spot Weakness: Animal by 5%. 3 Harvest Pips: Increases the Stamina restore amount by 4. 4 Harvest Pips: When Heightened Harvest is activated also gain Heightened Skinning, which increases the effectiveness of any Energetic Harvest, Perceptive Harvest, and Stamina restore effects gained in the next 7 seconds. 5 Harvest Pips: When Furious Reaping is activated also adds Furious Skinning, which increases the Harvest Base Damage: Animal by 30. Lasts 6 seconds or 2 hits, whichever comes first.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
141	Energetic Harvest	energetic-harvest	http:/localhost/assets/images/energetic-harvest.png	http://localhost/assets/images/energetic-harvest.svg	When you spend Harvest Pips gain buffs based on number of Harvest Pips spent. 1 Harvest Pip: Gain Energetic Harvest, which increases Grave Digging, Logging, Mining, Quarrying, and Skinning by 5% for 8 seconds. 2 Harvest Pips: Gain Perceptive Harvest, which increases Weak Spot Chance: All by 5% for 8 seconds. 3 Harvest Pips: Instantly restores 8 Stamina. 4 Harvest Pips: Gain Heightened Harvest, which increases the effectiveness of any Energetic Harvest, Perceptive Harvest, and Stamina restore effects gained in the next 7 seconds. 5 Harvest Pips: Gain Ruinous Harvest, which increases Harvest Base Damage: All by 40. Lasts 6 seconds or 2 hits, whichever comes first. 	buff	instant	harvest pips	0	0	0	0	0	self	f	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
142	Engage	engage	http:/localhost/assets/images/engage.png	http://localhost/assets/images/engage.svg	Swiftly re-engage with an attack doing 124-187 + 156% Weapon Damage, generating a Pip and increasing your damage by 10% for 15 seconds.	movement	instant	N/A	N/A	0	0	1	5	reticle	f	t	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
143	Escapology	escapology	http:/localhost/assets/images/escapology.png	http://localhost/assets/images/escapology.svg	Formulate your escape plan increasing your Resolve by 33% reducting Crowd Control durations and making it more likely that Crowd Control immunity triggers after being the victim of multiple Control effects.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
144	Essence Scram	essence-scram	http:/localhost/assets/images/essence-scram.png	http://localhost/assets/images/essence-scram.svg	Become invulnerable while you channel. While in the Life tray you lose 5% Essence and inflict 40 to 60 every 0.25 seconds.  While in the Death tray heal 1500 Health every .025 seconds while pushing enemies away every 1 second, and if you successfully channel the max duration gain the Power of Death which grants 30% Bonuse Damage for 30 seconds.	ultimate	channeled	resource	26	180	7	1	5	self	f	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
145	Ethereal Sight	ethereal-sight	http:/localhost/assets/images/ethereal-sight.png	http://localhost/assets/images/ethereal-sight.svg	Increase Plethora of Dust: Basic Resources by 5% while you have a Basic or Intermediate Tool equipped.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
146	Execute	execute	http:/localhost/assets/images/execute.png	http://localhost/assets/images/execute.svg	Slash without remorse dealing 135 - 202 + 168% Weapon Damage. Enemies under 35% health are critically hit for 202 - 300 + 167% Weapon Damage.	melee attack	instant	resource	1	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
149	Explosive Trap	explosive-trap	http:/localhost/assets/images/explosive-trap.png	http://localhost/assets/images/explosive-trap.svg	Shoot an explosive trap at a ground location, which explodes when an enemy approaches it dealing 46-62 + 54% Weapon Damage as Fire Damage. Knocks Up all hit. Trap will exist for 60 seconds. This Power's Maximum Range cannot be modified.	ranged attack	ground aimed	energy	0	24	60	5	35	area	f	f	f	2019-02-10 17:10:24.928+00	2019-02-10 17:10:24.928+00
150	Fae Bloodline	fae-bloodline	http:/localhost/assets/images/fae-bloodline.png	http://localhost/assets/images/fae-bloodline.svg	Increase your Stealth Movement Speed by 70%, gain Glide and Double Jump.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
151	Faerie Fire	faerie-fire	http:/localhost/assets/images/faerie-fire.png	http://localhost/assets/images/faerie-fire.svg	Line an enemy in Faerie Fire increasing their chance to be Critically Hit by 8% for 30 seconds.	debuff	instant	N/A	N/A	45	30	1	20	ray	t	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
152	Faerie Flames	faerie-flames	http:/localhost/assets/images/faerie-flames.png	http://localhost/assets/images/faerie-flames.svg	Engulf an enemy in Faerie Flames reducing Physical Mitigations by 20 for 30 seconds and afflicting them with Severe Corruption.	debuff	instant	essence	50	23	30	1	35	reticle	f	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
153	Faith	faith	http:/localhost/assets/images/faith.png	http://localhost/assets/images/faith.svg	Automatically activate the effects of Holy Warrior when dropping under 35% Health and prevent death until the effect has ended when activating Holy Warrior at the same time.	passive	passive	N/A	N/A	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
154	Fervor	fervor	http:/localhost/assets/images/fervor.png	http://localhost/assets/images/fervor.svg	Restores 350 Mana over five seconds as you channel. While channeling your physical mitigations are reduced by 15%.	non-aggressive	channeled	N/A	N/A	0	5	5	0	self	f	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
155	Festering Wounds	festering-wounds	http:/localhost/assets/images/festering-wounds.png	http://localhost/assets/images/festering-wounds.svg	Plague an enemy with Disease and for 30 seconds any Heal ability they use leaves them in an Exposed state.	debuff	charged	resource	13	45	0	1	30	ray	t	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
156	Finer Things	finer-things	http:/localhost/assets/images/finer-things.png	http://localhost/assets/images/finer-things.svg	Increase your Gem Harvest Chance, Mineral Harvest Chance, Heartwood Harvest Chance, Grave Goods Harvest Chance, and Hunger Shard Chance by 5% for 8 seconds.	buff	instant	harvest pips	2	6	8	1	0	self	t	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
157	Finery	finery	http:/localhost/assets/images/finery.png	http://localhost/assets/images/finery.svg	Each piece of Epic or Legendary quality armor equipped increases Damage Bonus and Healing Bonus by 2%.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.929+00	2019-02-10 17:10:24.929+00
158	Fire Eater	fire-eater	http:/localhost/assets/images/fire-eater.png	http://localhost/assets/images/fire-eater.svg	Absorb heat from incoming Fire damage attacks to heal for 125% of Fire damage inflicted.	buff	instant	resource	15	45	0	1	0	self	t	f	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
159	Fire Tornados	fire-tornados	http:/localhost/assets/images/fire-tornados.png	http://localhost/assets/images/fire-tornados.svg	Consumes your Hellfire Aura and launches 2 Hellfire Tornados forward which pull nearby object into them and damages them for 105 - 157 + 131% Weapon Damage as Fire Damage. Each tornado last 15 seconds.	ranged attack	instant	resource	120	30	10	5	3	sphere	f	t	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
160	Fire Wave	fire-wave	http:/localhost/assets/images/fire-wave.png	http://localhost/assets/images/fire-wave.svg	Consumes your Hellfire Shield and transforms it into a fiery wave, which move forward and damages all who are struck by it for 87 - 130 + 109% Weapon Damage.	ranged attack	instant	resource	60	24	0	5	18	rectangle	f	t	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
161	Fireball 2	fireball-2	http:/localhost/assets/images/fireball-2.png	http://localhost/assets/images/fireball-2.svg	Shoot a fireball at your reticle target applying Sin to them and causing 48-72 + 60% Fire Weapon Damage.	ranged attack	instant	N/A	N/A	0	0	1	25	reticle	f	t	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
162	Fireball 3	fireball-3	http:/localhost/assets/images/fireball-3.png	http://localhost/assets/images/fireball-3.svg	Shoot a fireball at your reticle target applying Sin to them and causing 106-159 + 132% Fire Weapon Damage.	ranged attack	instant	N/A	N/A	0	0	1	25	reticle	f	t	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
163	Fireball	fireball	http:/localhost/assets/images/fireball.png	http://localhost/assets/images/fireball.svg	Shoot a fireball at your reticle target applying Sin to them and causing 37-55 + 46% Fire Weapon Damage.	ranged attack	instant	N/A	N/A	0	0	1	25	reticle	f	f	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
164	Firewall	firewall	http:/localhost/assets/images/firewall.png	http://localhost/assets/images/firewall.svg	Summon a raging inferno to slow and damage any enemies for 30 - 40 + 35% Fire Weapon Damage.	debuff	instant	resource	16	9	15	5	10	rectangle	t	f	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
165	First Wind	first-wind	http:/localhost/assets/images/first-wind.png	http://localhost/assets/images/first-wind.svg	After falling below 30% Health you heal rapidly if you avoid damage for 4 seconds until reaching 30% Health.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
166	Flames of Truth	flames-of-truth	http:/localhost/assets/images/flames-of-truth.png	http://localhost/assets/images/flames-of-truth.svg	Applies Flames of Truth to your reticle target, damaging them for 17 - 26. After 10 seconds Flames of Truth explodes dealing 93 - 140 + 117% Weapon Damage as Fire Damage in a 4m radius.	ranged attack	instant	resource	70	9	0	1	40	sphere	f	f	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
167	Flare Arrow	flare-arrow	http:/localhost/assets/images/flare-arrow.png	http://localhost/assets/images/flare-arrow.svg	Shoot a flare arrow lighting the targeted area and revealing any Stealth users entering that area. Stealth users revealed in this way are Exposed, take 177-239 + 208% Fire Weapon Damage and begin Burning.	ranged attack	ground aimed	arrow	1	9	0	5	50	area	f	f	f	2019-02-10 17:10:24.93+00	2019-02-10 17:10:24.93+00
168	Flare	flare	http:/localhost/assets/images/flare.png	http://localhost/assets/images/flare.svg	Deploy a flare revealing any Stealth users entering the area. Stealth users revealed in this way are Exposed, take 170 - 230 + 200% Fire Weapon Damage and begin Burning.	debuff	instant	resource	16	23	0	5	50	cone	t	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
169	Flash of Light	flash-of-light	http:/localhost/assets/images/flash-of-light.png	http://localhost/assets/images/flash-of-light.svg	Manifest divine light from your shield Blinding your reticle target and inflicting 113-138 + 125% Weapon Damage.	ranged attack	instant	mana	75	30	0	1	20	reticle	f	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
170	Flintlock Shot	flintlock-shot	http:/localhost/assets/images/flintlock-shot.png	http://localhost/assets/images/flintlock-shot.svg	Shoot for 107 - 160 + 134% Weapon Damage and generating two Pips. If Flintlock Shot hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage and you generate an additional Pip.	ranged attack	instant	N/A	N/A	9	0	1	15	cone	f	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
171	Focused Spark	focused-spark	http:/localhost/assets/images/focused-spark.png	http://localhost/assets/images/focused-spark.svg	Channel lightning at your target for 64 - 96 + 80% Weapon Damage. Striking with FOCUSED SPARK, three times in sucession triggers Spark Focus, increasing your Critial Hit Chance by 100% for 9 seconds or until your next hit.	ranged attack	channeled	resource	28	0	0	1	30	reticle	f	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
172	Forced Confession	forced-confession	http:/localhost/assets/images/forced-confession.png	http://localhost/assets/images/forced-confession.svg	Consumes Flame of the Truth on your reticle target, which instantly exploded for 47 - 71 + 59% Weapon Damage, and stuns the target. Does nothing againts target without Flames of Truth.	crowd control	instant	resource	55	30	0	1	30	sphere	f	t	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
173	Forest Step	forest-step	http:/localhost/assets/images/forest-step.png	http://localhost/assets/images/forest-step.svg	Blink through the forest shadows directly to your target and strike for 76-103 + 89% Weapon Damage.	movement	instant	energy	34	24	3	1	30	reticle	f	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
174	Forest Whispers	forest-whispers	http:/localhost/assets/images/forest-whispers.png	http://localhost/assets/images/forest-whispers.svg	While in Life Power Tray, when your Health drops below 20% gain 75% Slashing, Crushing and Piercing mitigation for 15 seconds which can occur once every 90 seconds. While in Death Power Tray, each Druid Power executed has a chance to make your next Druid Power cost zero essence.	passive	passive	N/A	N/A	0	15	1	5	self	f	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
175	Form Life 2	form-life-2	http:/localhost/assets/images/form-life-2.png	http://localhost/assets/images/form-life-2.svg	Manifest an Orb at your targeted location that allies or you may use to heal 97 to 119 + 108% Weapon Damage.	heal	instant	N/A	N/A	0	0	1	35	area	t	t	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
176	Form Life	form-life	http:/localhost/assets/images/form-life.png	http://localhost/assets/images/form-life.svg	Manifest an Orb at your targeted location that allies or you may use to heal 39-48 + 173% Weapon Damage.	heal	instant	N/A	N/A	0	0	1	35	area	t	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
177	Form Up	form-up	http:/localhost/assets/images/form-up.png	http://localhost/assets/images/form-up.svg	Coming Soon	buff		resource	16	30	0	0	5		t	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
178	Fortification	fortification	http:/localhost/assets/images/fortification.png	http://localhost/assets/images/fortification.svg	Aid group members and yourself increasing Health by 1000.	buff	instant	resource	12	45	30	5	0	group	t	f	f	2019-02-10 17:10:24.931+00	2019-02-10 17:10:24.931+00
179	Fortuitous Blessings	fortuitous-blessings	http:/localhost/assets/images/fortuitous-blessings.png	http://localhost/assets/images/fortuitous-blessings.svg	Have faith and recieve the blessing you need.  Your actions determine whether you receive the Seeker's Blessing for movement speed, Charitable Blessing for Support Power or Impoverished Blessing for restoring your resource over time.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
180	Found Resources	found-resources	http:/localhost/assets/images/found-resources.png	http://localhost/assets/images/found-resources.svg	Return to a minimum of two pips when entering stealth.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
181	Fountain of Life	fountain-of-life	http:/localhost/assets/images/fountain-of-life.png	http://localhost/assets/images/fountain-of-life.svg	Creates a Fountain of Life at the targetted location, which chain heals allies who walk near it. The fountain lasts 15 seconds or 30 heals.	buff	instant	resource	46	20	15	4	35	area	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
182	Free Action	free-action	http:/localhost/assets/images/free-action.png	http://localhost/assets/images/free-action.svg	Liberate group members and yourself gaining immunity to Movement Crowd Control effects for 5 seconds.	buff	instant	resource	16	45	5	5	0	group	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
183	Frighten	frighten	http:/localhost/assets/images/frighten.png	http://localhost/assets/images/frighten.svg	Shout at an enemy inflicting 91 - 123 + 107% Weapon Damage and reducing their damage bonus.	debuff	instant	resource	13	23	0	1	5	cone	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
184	Furious Retaliate	furious-retaliate	http:/localhost/assets/images/furious-retaliate.png	http://localhost/assets/images/furious-retaliate.svg	Recover immediately from Knockdown and Stun effects inflicting 113 - 153 + 133% Weapon Damage. Furious Retaliate also increases your Resolve, reducing the duration of subsequent Control Effects or triggering temporary immunity to Control Effects.	debuff	instant	resource	16	15	0	5	5	sphere	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
185	Furious Slash 2	furious-slash-2	http:/localhost/assets/images/furious-slash-2.png	http://localhost/assets/images/furious-slash-2.svg	Slash furiously at an enemy for 113-152 + 132% Weapon Damage while reducing your short and long cooldown times.	buff	instant	energy	13	23	15	1	5	cone	t	t	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
186	Furious Slash	furious-slash	http:/localhost/assets/images/furious-slash.png	http://localhost/assets/images/furious-slash.svg	Hack at an enemy for 110-149 + 129% Weapon Damage.	melee attack	instant	energy	16	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
187	Furious	furious	http:/localhost/assets/images/furious.png	http://localhost/assets/images/furious.svg	Whenever you reach 100 Rage, your Damage Bonus is increased by 15% for 15 seconds.	passive	passive	N/A	N/A	0	15	1	0	self	t	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
188	Gaea's Wail	gaea's-wail	http:/localhost/assets/images/gaea's-wail.png	http://localhost/assets/images/gaea's-wail.svg	Unleash a bear spirit that may chain to additional enemies up to two times causing 168-252 + 210% instantly, 133-200 over 12 seconds and empowering Spark to chain up to two additional times if Gaea's Wail strikes three enemies.	ranged attack	charged	essence	105	23	12	3	0	reticle	f	f	f	2019-02-10 17:10:24.932+00	2019-02-10 17:10:24.932+00
189	Gather	gather	http:/localhost/assets/images/gather.png	http://localhost/assets/images/gather.svg	Gather Wood for 25-25 Damage.	melee attack	instant	N/A	N/A	0	0	1	0	reticle	f	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
190	Gestalt	gestalt	http:/localhost/assets/images/gestalt.png	http://localhost/assets/images/gestalt.svg	Activate Shadow Sight allowing you to detect enemies in stealth 15 seconds.	buff	2 Seconds	N/A	N/A	45	15	1	0	self	t	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
191	Get Em	get-em	http:/localhost/assets/images/get-em.png	http://localhost/assets/images/get-em.svg	Stop an enemy in its tracks causing 85 - 115 + 100% Weapon Damage and Rooting them. If Get 'Em hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	debuff	instant	resource	12	24	0	1	35	cone	t	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
192	Ghost Army	ghost-army	http:/localhost/assets/images/ghost-army.png	http://localhost/assets/images/ghost-army.svg	Call forth a Ghost Army in front of you dealing 60-81 + 70% Weapon Damage and healing for your 12.5% of the Damage dealt after 15 seconds.	ranged attack	hold channeled	resource	16	23	10	5	0	rectangle	t	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
193	Giant Smash	giant-smash	http:/localhost/assets/images/giant-smash.png	http://localhost/assets/images/giant-smash.svg	Strike in front of you for 102 - 138 + 120% Weapon Damage, generating 4 Rage if you hit.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
194	Glamour Weapon	glamour-weapon	http:/localhost/assets/images/glamour-weapon.png	http://localhost/assets/images/glamour-weapon.svg	Add a Glamour to your weapon increasing Maximum Weapon Damage by 50 for 30 seconds.	buff	instant	resource	16	23	180	1	0	self	t	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
195	Glass Cannon	glass-cannon	http:/localhost/assets/images/glass-cannon.png	http://localhost/assets/images/glass-cannon.svg	Increase your Damage Bonus while increasing the damage you take.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
196	Gleeful Strike	gleeful-strike	http:/localhost/assets/images/gleeful-strike.png	http://localhost/assets/images/gleeful-strike.svg	While in Melee Mode all critical hits you land have a chance to restore Energy.	passive	passive	N/A	N/A	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
197	Glycolysis	glycolysis	http:/localhost/assets/images/glycolysis.png	http://localhost/assets/images/glycolysis.svg	Restore Stamina when consuming Apples.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
198	Go For Broke	go-for-broke	http:/localhost/assets/images/go-for-broke.png	http://localhost/assets/images/go-for-broke.svg	Leap from your Burrow with full commitment, unleashing a deadly hail of gunfire assaulting up to three targets in a cone multiple times for 39 - 58 + 48% Weapon Damage before returning to your burrow again if you can avoid damage. Striking Exposed targets causes a guaranteed critical hit.	ranged attack	channeled	N/A	N/A	9	0	3	15	cone	f	f	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
199	Gore	gore	http:/localhost/assets/images/gore.png	http://localhost/assets/images/gore.svg	Strike overhead with both axes before continuing the carnage with a second bloody slice, inflicting 63-77 + 70% Weapon Damage for each hit. If you connect, recover 5 Fury per second for 20 seconds.	buff	instant	fury	23	0	20	1	5.5	cone	f	t	f	2019-02-10 17:10:24.933+00	2019-02-10 17:10:24.933+00
200	Grabthars Hammer 2	grabthars-hammer-2	http:/localhost/assets/images/grabthars-hammer-2.png	http://localhost/assets/images/grabthars-hammer-2.svg	Smash an enemy, stunning them for 106-143 + 124% Weapon Damage.	debuff	instant	resource	12	30	0	1	5	cone	t	t	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
201	Grabthars Hammer	grabthars-hammer	http:/localhost/assets/images/grabthars-hammer.png	http://localhost/assets/images/grabthars-hammer.svg	Smite an enemy for 91-124 + 108% Weapon Damage.	melee attack	instant	resource	11	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
202	Grasping Roots	grasping-roots	http:/localhost/assets/images/grasping-roots.png	http://localhost/assets/images/grasping-roots.svg	Command nature to envelope enemies in the targeted area rooting them in place and inflicting 50-75 + 63% Nature Weapon Damage.	debuff	ground aimed	resource	16	24	0	5	7	area	t	f	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
203	Great Swing 1	great-swing-1	http:/localhost/assets/images/great-swing-1.png	http://localhost/assets/images/great-swing-1.svg	Attack for 48 - 72 + 60% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	f	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
204	Great Swing 2	great-swing-2	http:/localhost/assets/images/great-swing-2.png	http://localhost/assets/images/great-swing-2.svg	Attack for 58 - 87 + 73% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
205	Great Swing 3	great-swing-3	http:/localhost/assets/images/great-swing-3.png	http://localhost/assets/images/great-swing-3.svg	Attack for 74 - 111 + 93% Weapon Damage and generates a point of Righteousness.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
206	Grounding	grounding	http:/localhost/assets/images/grounding.png	http://localhost/assets/images/grounding.svg	Protect group members and yourself with increased Electricity Armor.	buff	instant	resource	16	45	0	5	0	group	t	f	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
207	Guardian Rhythms	guardian-rhythms	http:/localhost/assets/images/guardian-rhythms.png	http://localhost/assets/images/guardian-rhythms.svg	Reduces the groups Damage Taken by 5% for 12 seconds. Type 2 Song.	buff	2 Seconds	N/A	N/A	1	12	5	0	group	t	f	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
208	Guinecean Bloodline	guinecean-bloodline	http:/localhost/assets/images/guinecean-bloodline.png	http://localhost/assets/images/guinecean-bloodline.svg	Your food consumption does not increase when jumping or using stamina and you may Double Jump.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.934+00	2019-02-10 17:10:24.934+00
209	Guinecean Burrow	guinecean-burrow	http:/localhost/assets/images/guinecean-burrow.png	http://localhost/assets/images/guinecean-burrow.svg	Dig underground to avoid detection. Taking damage or running out of stamina forces you out of your Burrow. Can not be activated while in combat.	transformation	toggle	stamina	0.5	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
210	Half-Elf Bloodline	half-elf-bloodline	http:/localhost/assets/images/half-elf-bloodline.png	http://localhost/assets/images/half-elf-bloodline.svg	Grant Trailblazer and increase Out of Combat Movement Speed by 15%.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
211	Half-Giant Bloodline	half-giant-bloodline	http:/localhost/assets/images/half-giant-bloodline.png	http://localhost/assets/images/half-giant-bloodline.svg	When damaged for less than 200 hitpoints, you gain a stack of Maken Me Mad. If you gain 5 stacks in 30 seconds, Giant Smash is applied, which increases your Damage Bonus by 5%, and increases size for 12 seconds. Giant Smash also instantly restores class appropriate resource.	passive	passive	N/A	N/A	0	12	1	0	self	t	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
212	Hamstring	hamstring	http:/localhost/assets/images/hamstring.png	http://localhost/assets/images/hamstring.svg	Your last basic attack will cripple an enemy, applying a Movement Debuff.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
213	Hand of the Gods	hand-of-the-gods	http:/localhost/assets/images/hand-of-the-gods.png	http://localhost/assets/images/hand-of-the-gods.svg	Unleash a divine force holding enemies in place and inflicting 119-149 + 132% Weapon Damage	ranged attack	ground aimed	mana	80	24	5	5	20	area	f	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
214	Haunt	haunt	http:/localhost/assets/images/haunt.png	http://localhost/assets/images/haunt.svg	Haunt 3 enemies, reflecting 35% of their attack damage as Nature damage and healing you for 35% of damage taken.	debuff	instant	resource	14	45	0	3	5	cone	t	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
215	Head Butt	head-butt	http:/localhost/assets/images/head-butt.png	http://localhost/assets/images/head-butt.svg	Charge forward knocking down enemies and causing 82-100 + 91% Weapon Damage.	melee attack	instant	N/A	N/A	30	0	3	7	rectangle	t	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
216	Heads Up	heads-up	http:/localhost/assets/images/heads-up.png	http://localhost/assets/images/heads-up.svg	Increase the Perception of group members and yourself by 25 for 30 seconds and removes the Exposed state.	buff	instant	resource	12	68	30	5	0	group	t	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
217	Healing Rain	healing-rain	http:/localhost/assets/images/healing-rain.png	http://localhost/assets/images/healing-rain.svg	Blanket the targeted area with Life energy, instantly healing 27 to 33 + 30% Weapon Damage. This Power generates a High amount of Essence	non-aggressive	instant	resource	96	0	0	5	0	area	f	f	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
218	Hellfire Aura	hellfire-aura	http:/localhost/assets/images/hellfire-aura.png	http://localhost/assets/images/hellfire-aura.svg	Consumes your Hellfire Shield and surrounds you in a pulsing Hellfire Aura which damages all players within 4m of you every second for 15 - 18 Weapon Damage.	buff	instant	resource	80	24	10	5	3.5999999	sphere	f	t	f	2019-02-10 17:10:24.935+00	2019-02-10 17:10:24.935+00
219	Hellfire Blast	hellfire-blast	http:/localhost/assets/images/hellfire-blast.png	http://localhost/assets/images/hellfire-blast.svg	Damages all players in front of you who were hit by the Hellfire Wave for 76 - 114 + 95% Weapon Damage, and knocks them briefly into the air.	ranged attack	instant	resource	80	30	0	5	30	rectangle	f	t	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
220	Hellfire Shield	hellfire-shield	http:/localhost/assets/images/hellfire-shield.png	http://localhost/assets/images/hellfire-shield.svg	Surrounds your skin an a Hellfire Shield to 15 seconds damaging all who cause damage to your for 15 - 18 damage.	buff	instant	resource	55	9	15	1	25	self	f	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
221	High-Elf Bloodline	high-elf-bloodline	http:/localhost/assets/images/high-elf-bloodline.png	http://localhost/assets/images/high-elf-bloodline.svg	Performing a right-click Cartwheel has a chance to instantly restore 1 Dodge Power.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
222	Hippocratic Oath	hippocratic-oath	http:/localhost/assets/images/hippocratic-oath.png	http://localhost/assets/images/hippocratic-oath.svg	Increases the groups Support Power by 75 while within 50m of you.	buff	toggle	N/A	N/A	1	0	5	50	group	t	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
223	Hit Me	hit-me	http:/localhost/assets/images/hit-me.png	http://localhost/assets/images/hit-me.svg	Irritate your enemies by recovering Resource when they hit you with non-periodic damage.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
224	Holy Aura	holy-aura	http:/localhost/assets/images/holy-aura.png	http://localhost/assets/images/holy-aura.svg	Imbue group members and yourself with sanctified power increasing their maximum Health by 1250 while you maintain the effect.	aura	toggle	mana	180	1	0	5	50	group	f	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
225	Holy Symbol	holy-symbol	http:/localhost/assets/images/holy-symbol.png	http://localhost/assets/images/holy-symbol.svg	Summon a celestial force at the targeted position chain healing the closest ally and up to two others for 29-35 + 128% Weapon Damage every three seconds for 15 seconds or until it has healed 30 times.	buff	instant	mana	80	20	10	4	35	area	f	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
226	Holy Warrior	holy-warrior	http:/localhost/assets/images/holy-warrior.png	http://localhost/assets/images/holy-warrior.svg	Simmer with Radiance temporarily increasing your maximum Health. All damage inflicted is considered Holy and cannot be mitigated with armor. Zealotry is earned by participating in combat and striking with Righteous Parry.	transformation	instant	resource	1000	45	30	1	0	self	f	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
227	Human Bloodline	human-bloodline	http:/localhost/assets/images/human-bloodline.png	http://localhost/assets/images/human-bloodline.svg	Grant 3% Damage Reduction	passive	toggle	N/A	N/A	0	0	1	0	passive	t	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
228	Humiliate	humiliate	http:/localhost/assets/images/humiliate.png	http://localhost/assets/images/humiliate.svg	Mock an enemy increasing their Final Power Cost Multiplier by 15% for 30 seconds.	debuff	instant	N/A	N/A	45	30	1	20	ray	t	f	f	2019-02-10 17:10:24.936+00	2019-02-10 17:10:24.936+00
229	Hunker Down	hunker-down	http:/localhost/assets/images/hunker-down.png	http://localhost/assets/images/hunker-down.svg	Deploy a small point-blank field increasing your Damage Bonus and All Armor.	buff	instant	energy	12	23	15	1	0	self	t	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
230	Hushed Prayer	hushed-prayer	http:/localhost/assets/images/hushed-prayer.png	http://localhost/assets/images/hushed-prayer.svg	Have faith in your divine mission decreasing your chance to be critically hit by 5%.	passive	passive	N/A	N/A	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
231	Hymn of Restoration	hymn-of-restoration	http:/localhost/assets/images/hymn-of-restoration.png	http://localhost/assets/images/hymn-of-restoration.svg	Increases your groups In Combat Health Regen by 24 and Out of Combat Health Regen by 32 for 12 seconds. Type 3 Song.	buff	2 Seconds	N/A	N/A	1	12	5	0	group	t	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
232	I Need This	i-need-this	http:/localhost/assets/images/i-need-this.png	http://localhost/assets/images/i-need-this.svg	Whenever you successfully hit a Weak Point, gain 16 Stamina.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
233	Illuminate	illuminate	http:/localhost/assets/images/illuminate.png	http://localhost/assets/images/illuminate.svg	Empower group members and yourself restoring some of their native Resource and healing their Health twice for 63-77 + 280% Weapon Damage over five seconds.	buff	instant	mana	185	23	5	5	50	group	f	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
234	Illusionary Armor	illusionary-armor	http:/localhost/assets/images/illusionary-armor.png	http://localhost/assets/images/illusionary-armor.svg	Conjure an illusion effective enough to reduce incoming damage by 7% for 15 seconds.	buff	instant	resource	16	45	15	1	0	self	t	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
235	Immolation	immolation	http:/localhost/assets/images/immolation.png	http://localhost/assets/images/immolation.svg	Detonate with power Blinding up to eight nearby enemies, becoming Invulnerable to damage, removing Expose effects, immune to Control effects and then Blinking a short distance away while becoming invisible.	ultimate	instant	N/A	N/A	0	0	8	0	sphere	f	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
236	Impale	impale	http:/localhost/assets/images/impale.png	http://localhost/assets/images/impale.svg	A devastating stab to the vitals inflicting instant damage and causing your target to bleed for #N/A - #N/A + #N/A% Weapon Damage until the target is either fully healed or they drop below a certain health threshold. Effects scale with Pips spend. 1 Pip: 125 - 188 and Bleed until under 90% Health. 2 Pips: 250 - 376 and Bleed until under 80% Health. 3 Pips: 375 - 564 and Bleed until under 70% Health. 4 Pips: 500 - 762 and Bleed until under 60% Health. 5 Pips: 625 - 940 and Bleed until under 50% Health.	debuff	instant	pips	1	9	0	1	5	cone	f	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
237	Inconceivable!	inconceivable!	http:/localhost/assets/images/inconceivable!.png	http://localhost/assets/images/inconceivable!.svg	Test your luck gaining between one and six buffs! Buff duration and your luck scale with Pips spent. Humiliations Galore: Every Pip generator earn and additional Pip. Bonetti's Defense: Adds 250 in Combat Health Regeneration. Capo Ferro: Gain a chance to attack twice with Saber Attack. Prepare to Die: Increase damage by 9%.  Agrippa: Increase Critial Hit Chance by 9%. Thibault: Increase Critial Hit Amount by 19%.	buff	instant	pips	1	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.937+00	2019-02-10 17:10:24.937+00
238	Indulgence	indulgence	http:/localhost/assets/images/indulgence.png	http://localhost/assets/images/indulgence.svg	Indulgence Cleanse yourself and become immune to Sin for 30 seconds.	buff	instant	resource	12	45	30	1	0	self	t	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
239	Infinite Angles	infinite-angles	http:/localhost/assets/images/infinite-angles.png	http://localhost/assets/images/infinite-angles.svg	Shield Throws now apply a movement speed reduction to all targets hit.	passive		N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
240	Insanity	insanity	http:/localhost/assets/images/insanity.png	http://localhost/assets/images/insanity.svg	Bolster your combat prowess increasing your Health maximum by 17.5 for each point of current Rage.	buff	instant	resource	12	45	0	3	12	self	t	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
241	Iron Skin	iron-skin	http:/localhost/assets/images/iron-skin.png	http://localhost/assets/images/iron-skin.svg	Harden your skin increasing your Slashing Armor and reducing Weapon Resource Cost.	melee attack	instant	resource	12	45	30	1	0	self	t	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
242	Jab	jab	http:/localhost/assets/images/jab.png	http://localhost/assets/images/jab.svg	Slash in front of you knocking down your target and critically striking for 175-237 + 206% Weapon Damage.	melee attack	instant	energy	47	9	0	1	5	cone	f	t	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
243	Jelly Skin	jelly-skin	http:/localhost/assets/images/jelly-skin.png	http://localhost/assets/images/jelly-skin.svg	Protect yourself with skin like rubber granting you a barrier with immunity to Crushing damage.	buff	instant	resource	16	45	15	0	0	self	t	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
244	Judgement	judgement	http:/localhost/assets/images/judgement.png	http://localhost/assets/images/judgement.svg	Strike mercillessly inflict 89 - 133 + 111% Weapon Damage. Enemies under 35% health are critically hit for 133 - 200 + 167% Weapon Damage.	melee attack	instant	resource	1	0	0	1	5	cone	f	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
245	Keen Eye	keen-eye	http:/localhost/assets/images/keen-eye.png	http://localhost/assets/images/keen-eye.svg	Increase your Harvest Weak Spot Chance by 10% for 8 seconds.	buff	instant	harvest pips	2	6	8	1	0	self	t	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
246	Kick Sand	kick-sand	http:/localhost/assets/images/kick-sand.png	http://localhost/assets/images/kick-sand.svg	Kick sand at nearby enemies, blinding them for 4 seconds while dealing 158-214 + 186% Weapon Damage. Consumes a point of Dominance when used for a guaranteed critical hit.	crowd control	instant	rage	14	30	0	1	5	cone	f	t	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
247	Kidney Shot	kidney-shot	http:/localhost/assets/images/kidney-shot.png	http://localhost/assets/images/kidney-shot.svg	Stab an enemy with a crippling blow to the vitals causing 80-120 + 100% Weapon Damage and stunning for a duration scaling by Pips spent. 1 Pip: 3.25 seconds. 2 Pips: 4 seconds. 3 Pips: 4.75 seconds. 4 Pips: 5.5 seconds. 5 Pips: 6.25 seconds.	melee attack	instant	pips	1	9	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
248	Laceration	laceration	http:/localhost/assets/images/laceration.png	http://localhost/assets/images/laceration.svg	Slash in front of you for 93-126 + 110% Weapon Damage. Applies a Weapon Break which reduces all damage by 20% for 15 seconds.	debuff	instant	energy	34	23	0	1	5	cone	f	t	f	2019-02-10 17:10:24.938+00	2019-02-10 17:10:24.938+00
249	Lament of Sadness	lament-of-sadness	http:/localhost/assets/images/lament-of-sadness.png	http://localhost/assets/images/lament-of-sadness.svg	Sing for 12 seconds, affecting up to 5 enemies within 10m. Decreases their Attack Power by 150 as well as Support Power by 150. Type 4 Song.	debuff	toggle	resource	32	1	12	5	10	point blank area	t	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
250	Last Resort	last-resort	http:/localhost/assets/images/last-resort.png	http://localhost/assets/images/last-resort.svg	Put it all on the line increasing your critical hit chance by 25% when your Health drops below 25%.	passive	passive	N/A	N/A	0	15	1	0	self	t	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
251	Lay Low	lay-low	http:/localhost/assets/images/lay-low.png	http://localhost/assets/images/lay-low.svg	Take it easy tending to your wounds and recovering 13-15 + 56% Weapon Damage a second for 6 seconds while maintaining Stealth.	non-aggressive	instant	resource	16	23	6	1	0	self	t	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
252	Lead From The Front	lead-from-the-front	http:/localhost/assets/images/lead-from-the-front.png	http://localhost/assets/images/lead-from-the-front.svg	Whenever you successfully harvest, your group members gain Inspired, which adds 2% Weak Spot Chance, and 4% Weak Spot Amount for 20 seconds. Inspired stacks up to 5 times. Does not affect the caster.	passive	passive	N/A	N/A	0	20	1	0	self	t	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
253	Leap 2	leap-2	http:/localhost/assets/images/leap-2.png	http://localhost/assets/images/leap-2.svg	Leap forward, dealing 95-129 + 112% Weapon Damage as Crushing Damage as you land and grants a point of Dominance.	melee attack	instant	N/A	N/A	0	0	5	4	sphere	f	t	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
254	Leap Roll	leap-roll	http:/localhost/assets/images/leap-roll.png	http://localhost/assets/images/leap-roll.svg	Leap away moving 10m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 10 seconds.	dodge	instant	dodge	1	0	0	1	10	self	t	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
255	Leap	leap	http:/localhost/assets/images/leap.png	http://localhost/assets/images/leap.svg	Leap forward, dealing 65-88 + 77% Weapon Damage as Crushing Damage as you land and grants a point of Dominance. Briefly able to perform a second Leap for zero resource cost.	melee attack	instant	N/A	N/A	23	0	5	4	sphere	f	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
256	Leeching Seed	leeching-seed	http:/localhost/assets/images/leeching-seed.png	http://localhost/assets/images/leeching-seed.svg	Cause an enemy to become lethargic increasing all Power cooldowns and reducing their movement speed for 8 seconds.	debuff	instant	resource	35	30	8	1	0	area	f	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
257	Left Slash	left-slash	http:/localhost/assets/images/left-slash.png	http://localhost/assets/images/left-slash.svg	Attack with your left weapon for 77-94 + 85% Weapon Damage.	melee attack	instant	fury	19	0	0	1	5.5	cone	f	t	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
258	Lightning Burst	lightning-burst	http:/localhost/assets/images/lightning-burst.png	http://localhost/assets/images/lightning-burst.svg	Blast enemies with lightning for 110 - 165 + 138% Weapon Damage.	ranged attack	instant	resource	68	9	0	5	35	ray	f	f	f	2019-02-10 17:10:24.939+00	2019-02-10 17:10:24.939+00
259	Lightning Strike	lightning-strike	http:/localhost/assets/images/lightning-strike.png	http://localhost/assets/images/lightning-strike.svg	Strike enemies with lightning for 109 - 163 + 136% Weapon Damage and Dazing them.	ranged attack	instant	resource	46	24	0	5	35	ray	f	t	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
260	Long Live the Fighter	long-live-the-fighter	http:/localhost/assets/images/long-live-the-fighter.png	http://localhost/assets/images/long-live-the-fighter.svg	Inflict a Bleed with your last Basic attack.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
261	Mana Shield	mana-shield	http:/localhost/assets/images/mana-shield.png	http://localhost/assets/images/mana-shield.svg	Surround yourself with a protective barrier that drains your mana as it prevents damage as well as increasing your Damage Bonus by 5% for 15 seconds.	buff	instant	resource	16	23	15	5	0	self	t	f	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
262	Marshy Body	marshy-body	http:/localhost/assets/images/marshy-body.png	http://localhost/assets/images/marshy-body.svg	Cover yourself with a boggy enchantment that increase your Crushing Armor by 0.2 for each point of Stamina.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
376	Saber Attack 3	saber-attack-3	http:/localhost/assets/images/saber-attack-3.png	http://localhost/assets/images/saber-attack-3.svg	Attack for 69 - 104 + 86% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
263	Massive Cleave	massive-cleave	http:/localhost/assets/images/massive-cleave.png	http://localhost/assets/images/massive-cleave.svg	Strike in front of you for 142-192 + 167% Weapon Damage or 213-288 + 250% Weapon Damage when activated with Dominance. Consumes a point of Dominance when used for a guaranteed critical hit. 	melee attack	instant	rage	15	9	0	1	5	cone	f	f	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
264	Massive Smash	massive-smash	http:/localhost/assets/images/massive-smash.png	http://localhost/assets/images/massive-smash.svg	Strike in front of you for 152 - 206 + 179% Weapon Damage, generating 4 Rage if you hit. Applies Mortal Strike to all hit, which reduces the effectiveness of any Healing that target receives by 25% for 15 seconds.	debuff	instant	N/A	N/A	0	15	1	5	cone	f	t	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
265	Matching Leather	matching-leather	http:/localhost/assets/images/matching-leather.png	http://localhost/assets/images/matching-leather.svg	Increase your Support Power by 100 when wearing a full set of non-basic Leather armor.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
266	Matching Mail	matching-mail	http:/localhost/assets/images/matching-mail.png	http://localhost/assets/images/matching-mail.svg	Increase your Support Power by 100 when wearing a full set of non-basic Mail armor.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
267	Matching Plate	matching-plate	http:/localhost/assets/images/matching-plate.png	http://localhost/assets/images/matching-plate.svg	Increase your Support Power by 100 when wearing a full set of non-basic Plate armor.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.94+00	2019-02-10 17:10:24.94+00
268	Mental Fortitude	mental-fortitude	http:/localhost/assets/images/mental-fortitude.png	http://localhost/assets/images/mental-fortitude.svg	Reduce your Power Efficiency by 10%, which reduces the resource cost of using powers.	passive	passive	N/A	N/A	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
269	Meteor Purge	meteor-purge	http:/localhost/assets/images/meteor-purge.png	http://localhost/assets/images/meteor-purge.svg	Creates a Meteor which damages all enemies in 5m for 101 - 151 + 126% Weapon Damage when it explodes. Charges over 66% apply Black Mantle to all targets hit, which absorbs all incoming Healing until 5000 points of Health are healed of it expires after 30 seconds.	ranged attack	charged	resource	145	45	30	5	5	reticle	f	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
270	Mighty Shield Slam	mighty-shield-slam	http:/localhost/assets/images/mighty-shield-slam.png	http://localhost/assets/images/mighty-shield-slam.svg	Deliver a shield attack using all your might to consume all Stamina and scale damage with stamina spent.  MIGHTY SHIELD SLAM inflicts 32 Damage Bonus per Stamina spent + 97% Crushing Weapon Damage to multiple enemies, pushing them back.  While charging the attack you are considered Blocking.  The attack is guaranteed to crit when more than 2/3rds charged.	debuff	charged	resource	22	24	0	3	7.5	cone	t	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
271	Mind Revenge	mind-revenge	http:/localhost/assets/images/mind-revenge.png	http://localhost/assets/images/mind-revenge.svg	Empower your barriers to explode when they expire causing nearby enemies to suffer 56-84 + 70% Weapon Damage.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
272	Minor Accompaniment	minor-accompaniment	http:/localhost/assets/images/minor-accompaniment.png	http://localhost/assets/images/minor-accompaniment.svg	Increase your Song Damage by 20%.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
273	Minotaur Bloodline	minotaur-bloodline	http:/localhost/assets/images/minotaur-bloodline.png	http://localhost/assets/images/minotaur-bloodline.svg	Gain immunity to all Stun effects that hit you from the front.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
274	Miracle	miracle	http:/localhost/assets/images/miracle.png	http://localhost/assets/images/miracle.svg	Heal group members and yourself instantly for 225-275 + 1000% Weapon Damage, increasing their Critical Hit Chance by 5% for 15 seconds and restoring some of your own Mana. Ultimate Powers instantly remove and temporarily prevent control and expose effects and grant temporary damage invulnerability.	ultimate	instant	soul power	1000	9	0	5	50	group	f	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
275	Mithradatism	mithradatism	http:/localhost/assets/images/mithradatism.png	http://localhost/assets/images/mithradatism.svg	Remove all Poison effects from yourself.	buff	instant	resource	16	9	0	0	0	self	t	f	f	2019-02-10 17:10:24.941+00	2019-02-10 17:10:24.941+00
276	Molon Labe	molon-labe	http:/localhost/assets/images/molon-labe.png	http://localhost/assets/images/molon-labe.svg	Block high damage attacks with reduced cost and a 5% increase in bonus damage for 2 additional seconds.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
277	Mortal Sin	mortal-sin	http:/localhost/assets/images/mortal-sin.png	http://localhost/assets/images/mortal-sin.svg	You now apply Mortal Sin instead of Sin.  For each stack of Mortal Sin the target becomes more vulnerable to being Critically Hit by 2% per stack.  All powers that require Sin will also benefit from Mortal Sin.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
278	Muck Spatter	muck-spatter	http:/localhost/assets/images/muck-spatter.png	http://localhost/assets/images/muck-spatter.svg	Crushing attacks made against you have a chance to cause nearby enemies to be afflicted with Blindness and Severe Corruption.	debuff	instant	resource	16	30	15	0	5	self	t	f	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
279	Multi-Purpose Shot	multi-purpose-shot	http:/localhost/assets/images/multi-purpose-shot.png	http://localhost/assets/images/multi-purpose-shot.svg	Shoot and arrow towards your reticle that deals 227 - 307 + 267% Weapon Damage and apply additional effects when using exotic arrows. Check your arrow's description for details on additional effects.	ranged attack	charged	arrow	1	0	0	1	15	reticle	f	t	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
280	Multi-Shot	multi-shot	http:/localhost/assets/images/multi-shot.png	http://localhost/assets/images/multi-shot.svg	Skillfully launch three arrows at once to strike as many enemies in a cone for 45-60 + 53% Weapon Damage. This Power's Maximum Range cannot be modified.	ranged attack	instant	energy	12	9	0	3	30	cone	t	f	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
281	Natural Bond	natural-bond	http:/localhost/assets/images/natural-bond.png	http://localhost/assets/images/natural-bond.svg	Buffs Damage Bonus by 5% for group members and yourself for 45 seconds.	buff	instant	resource	18	5	45	5	0	group	f	t	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
282	Nature's Avatar	nature's-avatar	http:/localhost/assets/images/nature's-avatar.png	http://localhost/assets/images/nature's-avatar.svg	Empowers a targeted ally adding 30% Critical Hit Chance, 50% Critical Hit Damage, 25% Damage Bonus and 435 Attack Power	buff	charged	resource	35	0	0	1	0	reticle	f	f	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
283	Nature's Grace	nature's-grace	http:/localhost/assets/images/nature's-grace.png	http://localhost/assets/images/nature's-grace.svg	Increase Healing by 10% for 45 seconds.	buff	instant	resource	22	68	45	5	0	self	f	f	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
284	Neck Breaker	neck-breaker	http:/localhost/assets/images/neck-breaker.png	http://localhost/assets/images/neck-breaker.svg	Leap straight up. When you land, Knock Down all enemies in the area dealing 288-389 + 339% Weapon Damage as Crushing Damage.	ultimate	instant	N/A	N/A	5	0	5	5	sphere	f	f	f	2019-02-10 17:10:24.942+00	2019-02-10 17:10:24.942+00
285	Needlin Haystack	needlin-haystack	http:/localhost/assets/images/needlin-haystack.png	http://localhost/assets/images/needlin-haystack.svg	Cover your body with sharp needle-like straws increasing your Piercing Armor by 25.  Piercing attacks reflect 133% weapon damage and cause Severe Bleeding.	buff	instant	resource	16	24	15	1	0	self	t	f	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
286	Net Pull	net-pull	http:/localhost/assets/images/net-pull.png	http://localhost/assets/images/net-pull.svg	Pull your target toward you inflicting 95-116 + 106% Weapon Damage.	crowd control	instant	fury	17	0	0	1	30	reticle	f	t	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
287	Nethari Bloodline	nethari-bloodline	http:/localhost/assets/images/nethari-bloodline.png	http://localhost/assets/images/nethari-bloodline.svg	Increase your Out of Combat Health Regen by 20 and reduce the chance you will be Critically Hit by 3%.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
288	Noble Blood	noble-blood	http:/localhost/assets/images/noble-blood.png	http://localhost/assets/images/noble-blood.svg	Shout and deal 60-81 + 70% Weapon Damage to enemies in a cone and gaining a Barrier lasting up to 15 seconds.	buff	instant	energy	250	23	0	3	5	cone	f	f	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
289	Noble Purpose	noble-purpose	http:/localhost/assets/images/noble-purpose.png	http://localhost/assets/images/noble-purpose.svg	Inspire yourself, taking stock of your life saving endeavors and recover Resource for every 1000 Health you restore to others. This effect can only occur once every 15 seconds.	passive	passive	N/A	N/A	15	0	1	0	self	t	f	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
290	Nothing to Lose	nothing-to-lose	http:/localhost/assets/images/nothing-to-lose.png	http://localhost/assets/images/nothing-to-lose.svg	Sacrifice 500 Health to increase Critical Hit Chance by 5% and Critical Hit Damage by 10% for 15 seconds.	buff	instant	health	500	23	20	0	0	self	t	f	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
291	Nova	nova	http:/localhost/assets/images/nova.png	http://localhost/assets/images/nova.svg	Draw enemies toward you repeatedly inflicting 6-8 + 7% Weapon Damage.	debuff	instant	resource	2	9	10	5	15	area	t	f	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
292	Numbness	numbness	http:/localhost/assets/images/numbness.png	http://localhost/assets/images/numbness.svg	Reduce the cost of Blocking high damage attacks.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
293	Oath of Will	oath-of-will	http:/localhost/assets/images/oath-of-will.png	http://localhost/assets/images/oath-of-will.svg	Vowing never to surrender, you recover 350 Energy over 3 seconds.	buff	instant	N/A	N/A	23	0	1	0	self	f	t	f	2019-02-10 17:10:24.943+00	2019-02-10 17:10:24.943+00
294	Obliterate	obliterate	http:/localhost/assets/images/obliterate.png	http://localhost/assets/images/obliterate.svg	Slash twice for 45-60 + 52% Weapon Damage applying a moderate bleed to all hit.	melee attack	instant	energy	125	24	0	3	5	sphere	f	t	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
295	Onslaught	onslaught	http:/localhost/assets/images/onslaught.png	http://localhost/assets/images/onslaught.svg	Attack in front of you twice for 74-100 + 87% Weapon Damage each strike.	melee attack	instant	energy	156	5	0	1	5	cone	f	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
296	Opportunist	opportunist	http:/localhost/assets/images/opportunist.png	http://localhost/assets/images/opportunist.svg	Saber Attacks have a 20% chance to reset the cooldown on Flintlock shot.	passive	passive	N/A	N/A	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
297	Overwhelming Odds	overwhelming-odds	http:/localhost/assets/images/overwhelming-odds.png	http://localhost/assets/images/overwhelming-odds.svg	Increase you All Mitigations by 20% when three or more enemies are within 10m.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
298	Payback	payback	http:/localhost/assets/images/payback.png	http://localhost/assets/images/payback.svg	Get even with your opponents after using a Retaliate ability by increasing your Critical Hit Chance by 50 for 30 seconds or until you crit three times.	buff	passive	resource	16	0	30	1	0	self	t	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
299	Pepperbox Shot	pepperbox-shot	http:/localhost/assets/images/pepperbox-shot.png	http://localhost/assets/images/pepperbox-shot.svg	Indiscriminately blast up to three targets causing 57 - 86 + 72% Weapon Damage. Effects scale with Pips spent. 1 Pip: 57 - 86. 2 Pips: 114 - 172. 3 Pips: 171 - 258. 4 Pips: 228 - 344. 5 Pips: 285 - 430 and targets are stunned.	crowd control	instant	pips	1	9	0	3	15	cone	f	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
300	Peripheral Vision	peripheral-vision	http:/localhost/assets/images/peripheral-vision.png	http://localhost/assets/images/peripheral-vision.svg	Allows you to see into the shadows while actively harvesting.	passive		N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
301	Piercing Orb	piercing-orb	http:/localhost/assets/images/piercing-orb.png	http://localhost/assets/images/piercing-orb.svg	Conjure a slow moving doom-filled projectile that passes through enemies to damage them repeatedly for 53-80 + 67% Piercing Weapon Damage.	ranged attack	instant	resource	8	9	15	5	35	reticle	t	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
302	Pin Cushion	pin-cushion	http:/localhost/assets/images/pin-cushion.png	http://localhost/assets/images/pin-cushion.svg	Gain a Piercing damage immune Barrier for 15 seconds.	buff	instant	resource	16	45	15	1	0	self	t	f	f	2019-02-10 17:10:24.944+00	2019-02-10 17:10:24.944+00
303	Pistol Shot 2	pistol-shot-2	http:/localhost/assets/images/pistol-shot-2.png	http://localhost/assets/images/pistol-shot-2.svg	Shoot an enemy for 85 - 127 + 106% Weapon Damage while generating a Pip with a chance to reset the cooldown of Rapid Fire.	ranged attack	instant	resource	21	0	0	1	15	ray	t	t	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
304	Pistol Shot 3	pistol-shot-3	http:/localhost/assets/images/pistol-shot-3.png	http://localhost/assets/images/pistol-shot-3.svg	Shoot an enemy for 95 - 143 + 119% Weapon Damage while generating a Pip with a chance to reset the cooldown of Rapid Fire.	debuff	instant	resource	18	0	0	1	15	ray	t	t	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
305	Pistol Shot	pistol-shot	http:/localhost/assets/images/pistol-shot.png	http://localhost/assets/images/pistol-shot.svg	Shoot an enemy for 35 - 52 + 43% Weapon Damage while generating a Pip with a chance to reset the cooldown of Rapid Fire.	ranged attack	instant	resource	9	9	0	1	15	ray	t	f	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
306	Pix Fix	pix-fix	http:/localhost/assets/images/pix-fix.png	http://localhost/assets/images/pix-fix.svg	All 'chain type' heals jump to 1 additional target.  Also reduces the amount of healing falloff per jump by 50%.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
307	Pixie Dust	pixie-dust	http:/localhost/assets/images/pixie-dust.png	http://localhost/assets/images/pixie-dust.svg	Blanket the targeted area with Pixie Dust, increasing Incoming Healing by 25% for 25 seconds.	buff	instant	resource	14	45	25	5	5	area	t	f	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
308	Poison Food	poison-food	http:/localhost/assets/images/poison-food.png	http://localhost/assets/images/poison-food.svg	Coming Soon	buff	instant	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
309	Poisoned Blade 2	poisoned-blade-2	http:/localhost/assets/images/poisoned-blade-2.png	http://localhost/assets/images/poisoned-blade-2.svg	Attack for 86 - 117 + 101% Weapon Damage and cause the enemy to become Poisoned taking 8 - 9 + 1% Weapon Damage per tick.	debuff	instant	resource	10	9	0	1	5	cone	t	t	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
310	Poisoned Blade	poisoned-blade	http:/localhost/assets/images/poisoned-blade.png	http://localhost/assets/images/poisoned-blade.svg	Attack for 113 - 153 + 133% Weapon Damage and cause the enemy to become Poisoned taking 8 - 9 + 1% Weapon Damage per tick.	melee attack	instant	resource	16	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.945+00	2019-02-10 17:10:24.945+00
311	Poisoned Weapons	poisoned-weapons	http:/localhost/assets/images/poisoned-weapons.png	http://localhost/assets/images/poisoned-weapons.svg	All your Primary Attacks now deal Poison as their damage type.  In addition your final Primary attack deals an AoE poison damage to nearby enemies.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
312	Pound of Flesh	pound-of-flesh	http:/localhost/assets/images/pound-of-flesh.png	http://localhost/assets/images/pound-of-flesh.svg	Increase your Damage Bonus by 15% when an enemy's Health is above 90%.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
313	Power Shot	power-shot	http:/localhost/assets/images/power-shot.png	http://localhost/assets/images/power-shot.svg	Shoot and arrow towards your reticle that deals 227 - 307 + 267% Weapon Damage.	ranged attack	charged	arrow	1	0	0	1	15	reticle	f	t	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
314	Preparation	preparation	http:/localhost/assets/images/preparation.png	http://localhost/assets/images/preparation.svg	Plan your next attack when entering Stealth immediately recovering a pip if you don't have one and periodically gaining additional Pips every 30 seconds as you maintain Stealth.	passive	passive	N/A	N/A	0	30	1	0	self	t	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
315	Prickly Skin	prickly-skin	http:/localhost/assets/images/prickly-skin.png	http://localhost/assets/images/prickly-skin.svg	Increase your Bonus Thorns 10.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
316	Prosecute	prosecute	http:/localhost/assets/images/prosecute.png	http://localhost/assets/images/prosecute.svg	Convict an enemy causing damage based on their sin: 1 Sin or less: 117-158 + 138% Weapon Damage 2 Sin: 182-247 + 215% Weapon Damage 3 Sin: 253-343 + 298% Weapon Damage 4 Sin: 330-447 + 388% Weapon Damage 5 Sin: 413-558 + 485% Weapon Damage	melee attack	instant	resource	10	0	0	1	5	cone	t	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
317	Protective Thorns	protective-thorns	http:/localhost/assets/images/protective-thorns.png	http://localhost/assets/images/protective-thorns.svg	Fortify your Armor Bonus for 20 seconds when activating Thorns and gain one percent Bonus Armor for every 25 points Thorns and Bonus Thorns.	passive		N/A	N/A	0	20	0	0	self	t	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
318	Pulverize	pulverize	http:/localhost/assets/images/pulverize.png	http://localhost/assets/images/pulverize.svg	Paw at the ground menacingly and begin Raging before ramming head first into your target for 240-293 + 267% Weapon Damage. This attack is a guaranteed critical hit when over 65% charged.	crowd control	charged	fury	50	10	0	1	5.5	cone	f	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
319	Purgative	purgative	http:/localhost/assets/images/purgative.png	http://localhost/assets/images/purgative.svg	Cleanse your group and yourself of damage over time effects healing for 13-15 + 56% Weapon Damage for each effect removed.	buff	instant	resource	16	23	0	5	0	group	t	f	f	2019-02-10 17:10:24.946+00	2019-02-10 17:10:24.946+00
320	Pursuit	pursuit	http:/localhost/assets/images/pursuit.png	http://localhost/assets/images/pursuit.svg	Charge forward striking with your shield, dealing 119-161 + 140% Crushing Weapon Damage and stunning the closest enemy.	crowd control	instant	energy	375	30	0	3	7	reticle	f	f	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
321	Put Your Back Into It	put-your-back-into-it	http:/localhost/assets/images/put-your-back-into-it.png	http://localhost/assets/images/put-your-back-into-it.svg	Spend Health to gain 5 Harvest Pips on your next 2 harvests for 8 seconds or 2 hits, whichever comes first.	buff	instant	health	1000	12	8	1	0	self	t	f	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
322	Quick Burn	quick-burn	http:/localhost/assets/images/quick-burn.png	http://localhost/assets/images/quick-burn.svg	Tip the scales towards Death increasing your Essence Gain by 50%.	passive	passive	N/A	N/A	0	0	5	0	self	t	f	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
323	Radiant Sweep	radiant-sweep	http:/localhost/assets/images/radiant-sweep.png	http://localhost/assets/images/radiant-sweep.svg	Knock down multiple enemies dealing 72-108 + 90% Weapon Damage.	crowd control	instant	N/A	N/A	9	0	5	5	cone	f	t	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
324	Raging Bull	raging-bull	http:/localhost/assets/images/raging-bull.png	http://localhost/assets/images/raging-bull.svg	Begin Raging and flinging enemies away from you causing 39-48 + 44% Weapon Damage to nearby enemies.	ultimate	instant	N/A	N/A	0	0	5	5	cone	f	f	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
325	Rallying Banner	rallying-banner	http:/localhost/assets/images/rallying-banner.png	http://localhost/assets/images/rallying-banner.svg	Fortify nearby group members with a banner increasing Attack Power by 100, healing those under 35% Health and removing Slow effects.	buff	instant	resource	16	90	30	5	15	area	t	f	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
326	Rapid Fire (Pistols)	rapid-fire-(pistols)	http:/localhost/assets/images/rapid-fire-(pistols).png	http://localhost/assets/images/rapid-fire-(pistols).svg	Unleash a deadly barrage of hot lead causing 28 - 43 + 36% Weapon Damage.  If Rapid Fire hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	melee attack	instant	N/A	N/A	9	0	1	15	ray	t	f	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
327	Rapid Fire (Ranger)	rapid-fire-(ranger)	http:/localhost/assets/images/rapid-fire-(ranger).png	http://localhost/assets/images/rapid-fire-(ranger).svg	Hold to shoot up to 10 arrows towards your reticle that deal 40 - 54 + 47% Weapon Damage per arrow.  Adds 10 Critical Hit Chance for 2 seconds for each arrow that does not critically hit, effect is removed when you land a critical hit. If Rapid Fire hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	ranged attack	hold channeled	arrows	0	9	2	1	15	reticle	f	f	f	2019-02-10 17:10:24.947+00	2019-02-10 17:10:24.947+00
328	Recon (Assassin)	recon-(assassin)	http:/localhost/assets/images/recon-(assassin).png	http://localhost/assets/images/recon-(assassin).svg	Carefully studying a target from stealth, applying the Exposed debuff to reveal weaknesses you may capitalize on.	instant	instant	N/A	N/A	0	0	1	0	reticle	f	f	f	2019-02-10 17:10:24.948+00	2019-02-10 17:10:24.948+00
329	Recon (Duelist)	recon-(duelist)	http:/localhost/assets/images/recon-(duelist).png	http://localhost/assets/images/recon-(duelist).svg	Carefully studying a target from the comfort of your Burrow, you apply the Exposed debuff to reveal weaknesses you and other specialists may capitalize on.	debuff	instant	N/A	N/A	0	0	1	0	ray	f	f	f	2019-02-10 17:10:24.948+00	2019-02-10 17:10:24.948+00
330	Redemption	redemption	http:/localhost/assets/images/redemption.png	http://localhost/assets/images/redemption.svg	Rapidly throw up to ten fireballs in a row for 34 - 46 + 40% Fire Weapon Damage scaling up to 43 - 58 + 50% Weapon Damage based on the enemy's Sin.	ranged attack	channeled	N/A	N/A	5	0	1	30	reticle	t	f	f	2019-02-10 17:10:24.948+00	2019-02-10 17:10:24.948+00
377	Sacrifice	sacrifice	http:/localhost/assets/images/sacrifice.png	http://localhost/assets/images/sacrifice.svg	Sacrifice 1000 Health to add 25% Essence.	buff	instant	health	1000	5	0	1	0	self	f	f	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
331	Redirect Pain	redirect-pain	http:/localhost/assets/images/redirect-pain.png	http://localhost/assets/images/redirect-pain.svg	Focus your will ignoring pain with a damage preventing Barrier and then begin reflecting damage back to your attackers if the Barrier is broken. Effects scale with Pips spent. 1 Pip: Gain 400 Barrier and 15% Retribution for 6 seconds. 2 Pips: Gain 650 Barrier and 25% Retribution for 9 seconds. 3 Pips: Gain 900 Barrier and 35% Retribution for 12 seconds. 4 Pips: Gain 1150 Barrier and 45% Retribution for 15 seconds. 5 Pips: Gain 1400 Barrier and 55% Retribution for 18 seconds.	buff	instant	pips	1	45	0	1	0	self	f	f	f	2019-02-10 17:10:24.948+00	2019-02-10 17:10:24.948+00
332	Reflect Heat	reflect-heat	http:/localhost/assets/images/reflect-heat.png	http://localhost/assets/images/reflect-heat.svg	Reflects 50% Fire Weapon Damage back to the source of a Fire damage attack.	buff	instant	resource	6	45	0	1	0	self	t	f	f	2019-02-10 17:10:24.948+00	2019-02-10 17:10:24.948+00
333	Reflection	reflection	http:/localhost/assets/images/reflection.png	http://localhost/assets/images/reflection.svg	Reflect 50% Slashing Weapon Damage back to the source of a Slashing damage attack.	buff	instant	resource	16	24	15	0	0	self	t	f	f	2019-02-10 17:10:24.948+00	2019-02-10 17:10:24.948+00
334	Rehabilitation	rehabilitation	http:/localhost/assets/images/rehabilitation.png	http://localhost/assets/images/rehabilitation.svg	Tend an ally's relieving 53 + 84% Weapon Damage plus an additional 1.4 Health for every point of Stamina every two seconds for six seconds.	non-aggressive	instant	resource	16	9	6	2	35	reticle	t	f	f	2019-02-10 17:10:24.948+00	2019-02-10 17:10:24.948+00
335	Relentless (Champion)	relentless-(champion)	http:/localhost/assets/images/relentless-(champion).png	http://localhost/assets/images/relentless-(champion).svg	Generate 1.5 Rage every 1 second while in Combat.	passive	passive	N/A	N/A	0	0	0	0	self	f	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
336	Relentless (Destroyer)	relentless-(destroyer)	http:/localhost/assets/images/relentless-(destroyer).png	http://localhost/assets/images/relentless-(destroyer).svg	You no longer degenerate Rage.  Instead, you generate 1.5 Rage every 1 second while in Combat.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
337	Remold	remold	http:/localhost/assets/images/remold.png	http://localhost/assets/images/remold.svg	Reform like clay easily healing any Crushing damage inflicted upon you and an additional 63-77 + 280% Weapon Damage every five seconds for 15 seconds.	buff	instant	resource	16	45	15	1	0	self	t	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
338	Rend	rend	http:/localhost/assets/images/rend.png	http://localhost/assets/images/rend.svg	Rend in front of you, dealing 244-330 + 287% Weapon Damage. Applies a Severe Bleed to all hit. Consumes a point of Dominance when used for a guaranteed critical hit.	debuff	instant	rage	23	24	0	1	5	cone	f	t	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
339	Reproach	reproach	http:/localhost/assets/images/reproach.png	http://localhost/assets/images/reproach.svg	Swing at multiple enemies hitting for 54-81 + 67% Weapon Damage.	melee attack	instant	righteousness	1	0	0	5	5	cone	f	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
340	Requiem	requiem	http:/localhost/assets/images/requiem.png	http://localhost/assets/images/requiem.svg	Sing for 12 seconds, affecting up to 5 enemies within 10m. Increases their Damage Taken by 15%. Type 2 Song.	debuff	toggle	resource	32	1	12	5	10	point blank area	t	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
341	Rescue	rescue	http:/localhost/assets/images/rescue.png	http://localhost/assets/images/rescue.svg	Avert an ally's imminent death for 10 seconds preventing them from dropping below 1 Health and healing them for 189-231+ 840% Weapon Damage. Recently Rescued allies may not be effected by Rescue.	buff	instant	resource	16	45	10	1	35	reticle	t	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
342	Resolution	resolution	http:/localhost/assets/images/resolution.png	http://localhost/assets/images/resolution.svg	Increase your Damage Bonus by 15% when three or more enemies are within 15m.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
343	Resolve	resolve	http:/localhost/assets/images/resolve.png	http://localhost/assets/images/resolve.svg	Heal 4% of your maximum Health every second while recovering Stamina when your Health drops below 20%. This can happen once every 90 seconds.	passive	passive	N/A	N/A	90	0	1	0	self	f	f	f	2019-02-10 17:10:24.949+00	2019-02-10 17:10:24.949+00
344	Restoration Smash 2	restoration-smash-2	http:/localhost/assets/images/restoration-smash-2.png	http://localhost/assets/images/restoration-smash-2.svg	Crush an enemy for 116 - 156 + 136% Weapon Damage while restoring your Resource.	melee attack	instant	resource	13	23	0	1	5	cone	t	t	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
345	Restoration Smash	restoration-smash	http:/localhost/assets/images/restoration-smash.png	http://localhost/assets/images/restoration-smash.svg	Smash an enemy for 117 - 159 + 138% Weapon Damage.	melee attack	instant	resource	17	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
346	Restoration Strike 2	restoration-strike-2	http:/localhost/assets/images/restoration-strike-2.png	http://localhost/assets/images/restoration-strike-2.svg	Strike an enemy for 117-159 + 138% Weapon Damage while restoring your Resource.	melee attack	instant	energy	13	23	0	1	5	cone	t	t	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
347	Restoration Strike	restoration-strike	http:/localhost/assets/images/restoration-strike.png	http://localhost/assets/images/restoration-strike.svg	Slice an enemy for 117-159 + 138% Weapon Damage.	melee attack	instant	energy	17	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
348	Resurrection	resurrection	http:/localhost/assets/images/resurrection.png	http://localhost/assets/images/resurrection.svg	Target a small area and revive one unconscious vessel.	resurrection	10 seconds	N/A	N/A	600	0	1	0	area	f	f	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
349	Retaliate (Assassin)	retaliate-(assassin)	http:/localhost/assets/images/retaliate-(assassin).png	http://localhost/assets/images/retaliate-(assassin).svg	Jump to your feet, damaging all nearby enemies for 105-158 + 132% Weapon Damage and generating a Pip. Retaliating an Exposed enemy generates an additional Pip.	retaliate	instant	stamina	75	3	0	3	5	area	f	f	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
350	Retaliate (Champion)	retaliate-(champion)	http:/localhost/assets/images/retaliate-(champion).png	http://localhost/assets/images/retaliate-(champion).svg	Jump to your feet, dealing 113-153 + 133% Weapon Damage to nearby enemies.	retaliate	instant	stamina	75	3	0	3	5	sphere	f	f	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
351	Retaliate (Cleric)	retaliate-(cleric)	http:/localhost/assets/images/retaliate-(cleric).png	http://localhost/assets/images/retaliate-(cleric).svg	Recover from Knockdown or Stun effects and jump to your feet with a barrier preventing up to 500 damage for six seconds.	retaliate	instant	stamina	75	3	0	3	5	sphere	f	f	f	2019-02-10 17:10:24.95+00	2019-02-10 17:10:24.95+00
352	Retaliate (Confessor)	retaliate-(confessor)	http:/localhost/assets/images/retaliate-(confessor).png	http://localhost/assets/images/retaliate-(confessor).svg	Jump to your feet, damaging all nearby enemies twice for 107-160 + 133% Weapon Damage.	retaliate	instant	stamina	75	3	0	3	5	sphere	f	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
353	Retaliate (Druid)	retaliate-(druid)	http:/localhost/assets/images/retaliate-(druid).png	http://localhost/assets/images/retaliate-(druid).svg	Jump to your feet, healing yourself for x-y + z% Weapon Damage.	retaliate	instant	stamina	75	3	0	1	5	self	f	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
354	Retaliate (Duelist)	retaliate-(duelist)	http:/localhost/assets/images/retaliate-(duelist).png	http://localhost/assets/images/retaliate-(duelist).svg	Jump to your feet, damaging all nearby enemies for 105-158 + 132% Weapon Damage. Retaliating an Exposed enemy generates an additional Pip and resets Relaliate's cooldown.	retaliate	instant	stamina	75	3	0	3	5	sphere	f	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
355	Retaliate (Knight)	retaliate-(knight)	http:/localhost/assets/images/retaliate-(knight).png	http://localhost/assets/images/retaliate-(knight).svg	Jump to your feet, damaging all nearby enemies twice for 57-77 + 67% Weapon Damage. This attack may only be used while Knocked Down.	retaliate	instant	stamina	75	15	0	3	5	sphere	f	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
356	Retaliate (Myrmidon)	retaliate-(myrmidon)	http:/localhost/assets/images/retaliate-(myrmidon).png	http://localhost/assets/images/retaliate-(myrmidon).svg	Jump to your feet, dealing 39-48 + 44% Weapon Damage to nearby enemies.	retaliate	instant	stamina	75	30	0	3	5	sphere	f	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
357	Retaliate (Ranger)	retaliate-(ranger)	http:/localhost/assets/images/retaliate-(ranger).png	http://localhost/assets/images/retaliate-(ranger).svg	Jump to your feet, dealing 113-153 + 133% Weapon Damage to nearby enemies.	retaliate	instant	stamina	75	3	0	3	5	sphere	f	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
358	Retaliate (Templar)	retaliate-(templar)	http:/localhost/assets/images/retaliate-(templar).png	http://localhost/assets/images/retaliate-(templar).svg	Jump to your feet, damaging all nearby enemies for 53-80 + 67% Weapon Damage. Retaliating an enemy afflicted with Sin reduces cooldown of Retaliate.	retaliate	instant	stamina	75	3	0	5	5	cone	f	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
359	Retribution Slash	retribution-slash	http:/localhost/assets/images/retribution-slash.png	http://localhost/assets/images/retribution-slash.svg	Turn the tables on enemies with a strike granting 20% Retribution for 15 seconds and causing 113-153 + 133% Weapon Damage.	buff	instant	resource	16	45	15	1	5	cone	t	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
360	Reveal Shadows	reveal-shadows	http:/localhost/assets/images/reveal-shadows.png	http://localhost/assets/images/reveal-shadows.svg	Activates Shadow Sight for 12 seconds.	buff	instant	resource	32	23	12	1	0	self	t	f	f	2019-02-10 17:10:24.951+00	2019-02-10 17:10:24.951+00
361	Reveal Weakness	reveal-weakness	http:/localhost/assets/images/reveal-weakness.png	http://localhost/assets/images/reveal-weakness.svg	Enhance group members and yourself increasing Physical Armor Penetration by 10.	buff	instant	resource	13	45	30	5	0	group	t	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
362	Revenge	revenge	http:/localhost/assets/images/revenge.png	http://localhost/assets/images/revenge.svg	Increase your Critical Hit Chance and Critical Hit Damage by 25 for 30 seconds when damaged by a Stealth attack.	passive	passive	N/A	N/A	0	30	1	0	self	t	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
363	Reverberating Blow	reverberating-blow	http:/localhost/assets/images/reverberating-blow.png	http://localhost/assets/images/reverberating-blow.svg	Afflict an enemy with an aura causing other nearby enemies to suffer 15 - 20 + 18% Weapon Damage.	debuff	instant	energy	11	24	15	5	5	cone	t	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
364	Ricochet Shot (Ranger)	ricochet-shot-(ranger)	http:/localhost/assets/images/ricochet-shot-(ranger).png	http://localhost/assets/images/ricochet-shot-(ranger).svg	Charge an arrow and shoot it towards your reticle dealing 158 - 213 + 186% Weapon Damage. The arrow will ricochet to a second target within 6m and then ricochet to a third target. If you hit 3 targets with this power, you gain the Hot Shot buff which applies 10 Critical Hit Damage for 10 seconds.	ranged attack	charged	arrow	1	23	10	3	15	reticle	f	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
365	Ricochet Shot (Sharpshooter)	ricochet-shot-(sharpshooter)	http:/localhost/assets/images/ricochet-shot-(sharpshooter).png	http://localhost/assets/images/ricochet-shot-(sharpshooter).svg	Fire an arrow that can ricochet to strike up to four additional nearby enemies for 65-89 + 77% Weapon Damage and is a guaranteed Critical Hit after the second ricochet.	ranged attack	instant	resource	18	9	0	5	15	reticle	t	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
366	Right Slash	right-slash	http:/localhost/assets/images/right-slash.png	http://localhost/assets/images/right-slash.svg	Attack with your right weapon for 35-42 + 38% Weapon Damage.	melee attack	instant	fury	17	0	0	1	5.5	cone	f	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
367	Righteous Smash	righteous-smash	http:/localhost/assets/images/righteous-smash.png	http://localhost/assets/images/righteous-smash.svg	Spin with an overhead chop hitting multiple enemies for 117-176 + 146% Weapon Damage and generating Righteousness for each hit.	melee attack	instant	N/A	N/A	0	0	5	5	cone	f	t	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
368	Righteous Stand	righteous-stand	http:/localhost/assets/images/righteous-stand.png	http://localhost/assets/images/righteous-stand.svg	Raise your sword to defend yourself increasing your damage mitigation and becoming immune to crowd control effects. Being struck with a melee attack restores Righteousness and triggers Righteous Parry.	parry	hold channeled	righteousness	1	0	0	1	30	self	f	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
369	Righteousness	righteousness	http:/localhost/assets/images/righteousness.png	http://localhost/assets/images/righteousness.svg	Adds a chance to restore Mana when you deal damage to others. Also buffs Damage Bonus by 5% for 15 seconds whenever you hit reach maximum Zealotry.	passive	passive	N/A	N/A	0	15	1	0	self	f	f	f	2019-02-10 17:10:24.952+00	2019-02-10 17:10:24.952+00
370	Ruby Slash	ruby-slash	http:/localhost/assets/images/ruby-slash.png	http://localhost/assets/images/ruby-slash.svg	Slash in front of you for 60-82 + 71% Weapon Damage. Scoring three or more consecutive basic attacks activate Shield Bash.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	f	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
371	Rune Shield	rune-shield	http:/localhost/assets/images/rune-shield.png	http://localhost/assets/images/rune-shield.svg	Protect yourself increasing Elemental Armor by 20.	buff	instant	resource	12	45	30	1	0	self	t	f	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
372	Runecarve Flesh	runecarve-flesh	http:/localhost/assets/images/runecarve-flesh.png	http://localhost/assets/images/runecarve-flesh.svg	Carve Runes into your flesh absorbing 10% of damage taken for 15 seconds and then exploding to inflict 35% of total damage taken (max 1050) to nearby enemies as Fire damage.	buff	instant	resource	240	45	15	1	5	self	t	f	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
373	Rupture Barrier	rupture-barrier	http:/localhost/assets/images/rupture-barrier.png	http://localhost/assets/images/rupture-barrier.svg	Cause an additional 50% Weapon Damage when striking a Barrier and restore your Resource.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
374	Saber Attack 1	saber-attack-1	http:/localhost/assets/images/saber-attack-1.png	http://localhost/assets/images/saber-attack-1.svg	Attack for 41 - 61 + 51% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	f	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
375	Saber Attack 2	saber-attack-2	http:/localhost/assets/images/saber-attack-2.png	http://localhost/assets/images/saber-attack-2.svg	Attack for 54 - 81 + 68% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
378	Saltpeter Rounds	saltpeter-rounds	http:/localhost/assets/images/saltpeter-rounds.png	http://localhost/assets/images/saltpeter-rounds.svg	Pistol attacks have a chance to apply a movement speed reduction for the next 20 seconds, as well as increasing your Distance Bonus by 5.	buff	instant	N/A	N/A	24	20	1	0	self	t	f	f	2019-02-10 17:10:24.953+00	2019-02-10 17:10:24.953+00
379	Sanctuary	sanctuary	http:/localhost/assets/images/sanctuary.png	http://localhost/assets/images/sanctuary.svg	Defend an area with a runic symbol increasing allies' All Armor by 20%.	buff	instant	resource	12	23	15	5	10	area	t	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
380	Seasoned Hand	seasoned-hand	http:/localhost/assets/images/seasoned-hand.png	http://localhost/assets/images/seasoned-hand.svg	Decrease your Decay Rate: All Tools by 50%.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
381	Second Wind	second-wind	http:/localhost/assets/images/second-wind.png	http://localhost/assets/images/second-wind.svg	After not taking damage for 4 seconds and falling below 50% Health, Health Regeneration is greatly increased until reaching 50% Health. This can occur once every 90 seconds.	passive	passive	N/A	N/A	90	4	1	0	self	f	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
382	Shadow Mantle	shadow-mantle	http:/localhost/assets/images/shadow-mantle.png	http://localhost/assets/images/shadow-mantle.svg	Dark forces surround your target reducing their ability to heal by 25% and causing 79-107 + 93% Weapon Damage.	melee attack	instant	pips	1	45	0	1	1	reticle	t	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
383	Shadows Caress	shadows-caress	http:/localhost/assets/images/shadows-caress.png	http://localhost/assets/images/shadows-caress.svg	Increase your Health Regeneration by 35 while in Stealth.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
384	Shadows Linger	shadows-linger	http:/localhost/assets/images/shadows-linger.png	http://localhost/assets/images/shadows-linger.svg	After being removed from Stealth, your Critical Hit Chance is increased by 50% for 3 seconds.	passive	passive	N/A	N/A	0	3	1	0	self	t	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
385	Shadowstep	shadowstep	http:/localhost/assets/images/shadowstep.png	http://localhost/assets/images/shadowstep.svg	Retreat to the shadows instantly entering Stealth, Blinking forward a short distance, becoming invulnerable to damage and immune to Crowd Control effects and Blinding nearby enemies.	ultimate	instant	N/A	N/A	9	0	1	0	self	f	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
386	Shield Bash	shield-bash	http:/localhost/assets/images/shield-bash.png	http://localhost/assets/images/shield-bash.svg	Follow-up with a shield attack Dazing, removing one Dodge Pip and striking for 50-67 + 58% Crushing Weapon Damage. Shield Bash hits critically for 94-128 if used again within 5 seconds and is enabled after performing three consecutive basic attacks or when you fill your Block Meter.	crowd control	instant	N/A	N/A	5	5	1	5	sphere	f	f	f	2019-02-10 17:10:24.954+00	2019-02-10 17:10:24.954+00
387	Shield Breaker	shield-breaker	http:/localhost/assets/images/shield-breaker.png	http://localhost/assets/images/shield-breaker.svg	Crush an enemy who is actively using Block or Parry causing a Knockdown and dealing 91 - 123 + 107% Weapon Damage.	debuff	instant	resource	13	9	0	5	15	reticle	t	f	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
388	Shield Glare 2	shield-glare-2	http:/localhost/assets/images/shield-glare-2.png	http://localhost/assets/images/shield-glare-2.svg	Blind an enemy with light reflected from your shield causing 151-205 + 178% Weapon Damage.	melee attack	instant	resource	18	30	0	1	5	cone	t	t	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
389	Shield Glare	shield-glare	http:/localhost/assets/images/shield-glare.png	http://localhost/assets/images/shield-glare.svg	Smash an enemy if the face for 110-148 + 129% Weapon Damage.	melee attack	instant	resource	15	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
390	Shield Slam	shield-slam	http:/localhost/assets/images/shield-slam.png	http://localhost/assets/images/shield-slam.svg	Charge your shield slamming up to three enemies in front of you for 82-111 + 97% Crushing Weapon Damage and critically hitting and pushing them back if charged more than 66%.	melee attack	charged	energy	344	24	0	3	7.5	cone	f	f	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
391	Shield Stun	shield-stun	http:/localhost/assets/images/shield-stun.png	http://localhost/assets/images/shield-stun.svg	Attack and stun a target in front of you for 115-156 + 136% Crushing Weapon Damage.	crowd control	instant	energy	203	30	0	1	5	cone	f	t	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
392	Shield Swipe	shield-swipe	http:/localhost/assets/images/shield-swipe.png	http://localhost/assets/images/shield-swipe.svg	Attack in front of you for 113-153 + 133% Crushing Weapon Damage.	melee attack	instant	energy	250	23	0	1	5	cone	f	f	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
393	Shockwave	shockwave	http:/localhost/assets/images/shockwave.png	http://localhost/assets/images/shockwave.svg	Attack enemies in front of you for 171-232 + 202% Crushing Weapon Damage and knocking them down.	crowd control	instant	energy	281	30	0	3	5	cone	f	t	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
394	Shrivel	shrivel	http:/localhost/assets/images/shrivel.png	http://localhost/assets/images/shrivel.svg	Curse an enemy with Disease and Black Mantle, absorbing up to 500 points of Healing.  If Shrivel hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	debuff	charged	resource	13	45	0	1	30	ray	t	f	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
395	Shroud of Darkness	shroud-of-darkness	http:/localhost/assets/images/shroud-of-darkness.png	http://localhost/assets/images/shroud-of-darkness.svg	Attacks made against you have a chance of Stunning the enemy who struck you.	buff	instant	resource	31	45	0	1	0	self	f	f	f	2019-02-10 17:10:24.955+00	2019-02-10 17:10:24.955+00
396	Sidestep	sidestep	http:/localhost/assets/images/sidestep.png	http://localhost/assets/images/sidestep.svg	Roll quickly moving 10m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 10 seconds.	dodge	instant	dodge	1	0	0	1	10	self	t	f	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
397	Sinister Slash	sinister-slash	http:/localhost/assets/images/sinister-slash.png	http://localhost/assets/images/sinister-slash.svg	Slash in front of you twice for 37-51 + 44% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	f	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
398	Skullcracker 2	skullcracker-2	http:/localhost/assets/images/skullcracker-2.png	http://localhost/assets/images/skullcracker-2.svg	Smash an enemy, stunning them and causing 94-127 + 111% Weapon Damage.	debuff	instant	resource	12	30	0	1	5	cone	t	t	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
399	Skullcracker	skullcracker	http:/localhost/assets/images/skullcracker.png	http://localhost/assets/images/skullcracker.svg	Strike an enemy with your mace for 68-92 + 80% Weapon Damage.	melee attack	instant	energy	10	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
400	Slow Demise 2	slow-demise-2	http:/localhost/assets/images/slow-demise-2.png	http://localhost/assets/images/slow-demise-2.svg	Torment an enemy reducing their Healing Bonus and inflicting 141-191 + 166% Weapon Damage.	debuff	instant	resource	18	45	15	1	5	cone	t	t	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
401	Slow Demise	slow-demise	http:/localhost/assets/images/slow-demise.png	http://localhost/assets/images/slow-demise.svg	Stick an enemy for 87-118 + 102% Weapon Damage.	melee attack	instant	resource	12	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
403	Smash	smash	http:/localhost/assets/images/smash.png	http://localhost/assets/images/smash.svg	Strike in front of you for 68 - 92 + 80% Weapon Damage, generating 4 Rage if you hit.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	f	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
404	Song of Speed	song-of-speed	http:/localhost/assets/images/song-of-speed.png	http://localhost/assets/images/song-of-speed.svg	Increase the group's Movement Speed by 30% for 12 seconds while out of combat and Movement Speed by 10% for 12 seconds while in combat. Type 1 Song.	buff	2 Seconds	N/A	N/A	1	12	5	0	group	t	f	f	2019-02-10 17:10:24.956+00	2019-02-10 17:10:24.956+00
405	Song Twisting	song-twisting	http:/localhost/assets/images/song-twisting.png	http://localhost/assets/images/song-twisting.svg	Singing 4 different songs with 6 seconds activates Pure Voice buff on you, which greatly increases the effects of the next song played.	passive	passive	N/A	N/A	0	6	0	0	self	t	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
406	Soothing Winds	soothing-winds	http:/localhost/assets/images/soothing-winds.png	http://localhost/assets/images/soothing-winds.svg	Heals a targeted ally instantly for 13-15 + 56% Weapon Damage with additional healing over time. The Chain Healing Bonus Jumps statistic adds additional targets but healing is reduced by 30% per target, up to a maximum of a 60% reduction.	buff	instant	N/A	N/A	0	0	3	35	ray	t	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
407	Sparring	sparring	http:/localhost/assets/images/sparring.png	http://localhost/assets/images/sparring.svg	Increase your basic attack damage 10.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
408	Speedy Retaliate	speedy-retaliate	http:/localhost/assets/images/speedy-retaliate.png	http://localhost/assets/images/speedy-retaliate.svg	Regain your senses recovering immediately from Knockdown or Stun effects with an attack inflicting #min_damage_1# - #max_damage_1# + #weapon_damage_value#% Weapon Damage and then increasing your Movement Speed by 30% for 8 seconds.	debuff	instant	N/A	N/A	30	8	5	5	area	t	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
409	Spin Step	spin-step	http:/localhost/assets/images/spin-step.png	http://localhost/assets/images/spin-step.svg	Roll quickly moving 10 in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 10 seconds.	dodge	instant	dodge	1	0	0	1	10	self	t	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
410	Spinning Backfist	spinning-backfist	http:/localhost/assets/images/spinning-backfist.png	http://localhost/assets/images/spinning-backfist.svg	Spin in front of you dealing 125-169 + 147% Weapon Damage as Crushing Damage. Consumes a point of Dominance when used for a guaranteed critical hit.	melee attack	instant	rage	14	9	0	1	5	cone	f	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
411	Spirit Dart	spirit-dart	http:/localhost/assets/images/spirit-dart.png	http://localhost/assets/images/spirit-dart.svg	Pop out of stealth briefly launching a Spirit Dart at an enemy and applying your currently equipped Toxin before returning automatically to Stealth. If the target is Exposed, the cooldown of your next Spirit Dart is reduced.	debuff	instant	N/A	N/A	0	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
412	Spirit Whip	spirit-whip	http:/localhost/assets/images/spirit-whip.png	http://localhost/assets/images/spirit-whip.svg	Whip additional targets within #range# with Melee Basic attacks but with damage reducing by 50% for the first whip and 25% for the second.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
413	Spite	spite	http:/localhost/assets/images/spite.png	http://localhost/assets/images/spite.svg	Seethe dangerously each time you suffer a Knockdown or Stun and recover 4 - 6% of your maximum Health over 5 seconds.	passive	passive	N/A	N/A	0	5	1	0	self	t	f	f	2019-02-10 17:10:24.957+00	2019-02-10 17:10:24.957+00
414	Spotting	spotting	http:/localhost/assets/images/spotting.png	http://localhost/assets/images/spotting.svg	Each time you damage a Resource Node, you become Dizzy Immune for 16 seconds.	passive	passive	N/A	N/A	0	16	1	0	self	f	f	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
415	Stab 2	stab-2	http:/localhost/assets/images/stab-2.png	http://localhost/assets/images/stab-2.svg	Jab for 48-72 + 60% Weapon Damage.	instant	instant	N/A	N/A	0	0	1	5	reticle	f	t	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
416	Stab 3	stab-3	http:/localhost/assets/images/stab-3.png	http://localhost/assets/images/stab-3.svg	Jab for 128-192 + 160% Weapon Damage.	instant	instant	N/A	N/A	0	0	1	5	reticle	f	t	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
417	Stab	stab	http:/localhost/assets/images/stab.png	http://localhost/assets/images/stab.svg	Jab for 80-120 + 100% Weapon Damage.	instant	instant	N/A	N/A	0	0	1	5	reticle	f	f	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
418	Stars Align	stars-align	http:/localhost/assets/images/stars-align.png	http://localhost/assets/images/stars-align.svg	Invoke forces of death increasing your Damage Bonus by 30% and reducing Weapon Resource Cost.	buff	instant	resource	16	45	0	5	0	self	t	f	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
419	Steal Soul	steal-soul	http:/localhost/assets/images/steal-soul.png	http://localhost/assets/images/steal-soul.svg	Gain the Lifesteal effect on your Basic attacks.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
420	Stink Bomb	stink-bomb	http:/localhost/assets/images/stink-bomb.png	http://localhost/assets/images/stink-bomb.svg	Torment enemies with a noxious targeted area attack Stunning and afflicting them with Moderate Corruption while maintaining Stealth.	crowd control	ground aimed	resource	13	30	0	5	35	area	t	f	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
421	Stormcaller	stormcaller	http:/localhost/assets/images/stormcaller.png	http://localhost/assets/images/stormcaller.svg	Forgoing access to Life abilities, your focus on Death allows you to generate Essence while in Combat.  In order to maintain balance, damaging enemies has a chance to Coalesce Life.	passive	passive	N/A	N/A	0	60	0	0	self	t	f	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
422	Straight Shot	straight-shot	http:/localhost/assets/images/straight-shot.png	http://localhost/assets/images/straight-shot.svg	Shoot and arrow towards your reticle that deals 227 - 307 + 267% Weapon Damage.	ranged attack	charged	arrow	1	0	0	1	15	reticle	f	f	f	2019-02-10 17:10:24.958+00	2019-02-10 17:10:24.958+00
423	Strength of the Legion	strength-of-the-legion	http:/localhost/assets/images/strength-of-the-legion.png	http://localhost/assets/images/strength-of-the-legion.svg	Increases the groups Attack Power by 100 while within 50m of you.	passive	toggle	N/A	N/A	1	0	5	50	group	t	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
424	Sturdy	sturdy	http:/localhost/assets/images/sturdy.png	http://localhost/assets/images/sturdy.svg	Reinforce your body reducing Health loss by 33% when your Health is above 80%.	passive	instant	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
425	Suns of Worvan	suns-of-worvan	http:/localhost/assets/images/suns-of-worvan.png	http://localhost/assets/images/suns-of-worvan.svg	Gain a Fire damage immune Barrier for 15 seconds.	buff	instant	resource	13	23	15	0	0	cone	t	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
426	Suppression Shot	suppression-shot	http:/localhost/assets/images/suppression-shot.png	http://localhost/assets/images/suppression-shot.svg	Shoot at a ground location dealing 93 - 126 + 109% Weapon Damage. Applies a Suppression effect to all hit. This Power's Maximum Range can not be modified.	crowd control	ground aimed	resource	1	30	0	5	35	area	f	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
427	Supreme Element	supreme-element	http:/localhost/assets/images/supreme-element.png	http://localhost/assets/images/supreme-element.svg	Grants various effects based on type of incoming elemental damage. Incoming Fire damage heals you for 20% of the damage taken. Incoming Electric damage deals 10% of the damage back to the caster. Incoming Ice damage applies a stack of Phase Transition which grants Healing Modifier by 10% per stack. Maximum 3 stacks.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
428	Sustain	sustain	http:/localhost/assets/images/sustain.png	http://localhost/assets/images/sustain.svg	Grants 40% Lifesteal for 30 seconds or until you have restored 30% of Maximum Health and grants temporary damage immunity.	ultimate	instant	N/A	N/A	30	0	1	0	self	f	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
429	Sweep	sweep	http:/localhost/assets/images/sweep.png	http://localhost/assets/images/sweep.svg	Slash in front of you for 68-92 + 80% Weapon Damage. Applies Cunning Sweep to one nearby group member, which adds 5% Bonus Damage to their next attack.	crowd control self	instant	energy	31	23	0	1	5	cone	f	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
430	Sword Ward	sword-ward	http:/localhost/assets/images/sword-ward.png	http://localhost/assets/images/sword-ward.svg	Enchant your armor with a ward against Slashing attacks increasing your Slashing Armor by 25.  Slashing attacks cause Sword Ward to slowly weaken temporarily.	passive	passive	resource	16	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
431	Take It Down	take-it-down	http:/localhost/assets/images/take-it-down.png	http://localhost/assets/images/take-it-down.svg	Reduces Ore Mitigation and Stone Mitigation of Ore and Stone Mother Lodes by 45% for 8 seconds.	buff	instant	harvest pips	2	6	8	1	0	self	t	f	f	2019-02-10 17:10:24.959+00	2019-02-10 17:10:24.959+00
432	Take Root	take-root	http:/localhost/assets/images/take-root.png	http://localhost/assets/images/take-root.svg	Standing still for 2 seconds increases Healing Bonus by 10% and Physical Mitigations by 5% until you move.	passive	passive	N/A	N/A	0	2	0	0	self	t	f	f	2019-02-10 17:10:24.96+00	2019-02-10 17:10:24.96+00
433	Taste For Blood	taste-for-blood	http:/localhost/assets/images/taste-for-blood.png	http://localhost/assets/images/taste-for-blood.svg	Striking a Bleeding target grants you the Blood Craze for 3 seconds, which while active will partially reduce the Health loss from Berserk Crash. Striking a Bleeding target also has a chance to grant Blood Thirst for 20 seconds, which greatly increases the damage of your basic attacks.	passive	passive	N/A	N/A	0	20	1	0	self	f	f	f	2019-02-10 17:10:24.96+00	2019-02-10 17:10:24.96+00
434	Tear Reality	tear-reality	http:/localhost/assets/images/tear-reality.png	http://localhost/assets/images/tear-reality.svg	Tear Reality 8m around you every 3 seconds for 9 seconds, all targets hit have all powers with an active cooldown increased by 3 seconds.	debuff	instant	resource	13	45	9	1	8	self	t	f	f	2019-02-10 17:10:24.96+00	2019-02-10 17:10:24.96+00
435	Tend Wounds	tend-wounds	http:/localhost/assets/images/tend-wounds.png	http://localhost/assets/images/tend-wounds.svg	Aid the ally under your target reticle, healing them and yourself for 16-19 + 71% Weapon Damage per second over eight seconds.	buff	instant	mana	85	9	8	1	20	reticle	f	f	f	2019-02-10 17:10:24.96+00	2019-02-10 17:10:24.96+00
436	Tenderize 2	tenderize-2	http:/localhost/assets/images/tenderize-2.png	http://localhost/assets/images/tenderize-2.svg	Cut an enemy for 136-184 + 160% Weapon Damage and reducing their Bleed Armor for 15 seconds.	debuff	instant	resource	16	23	15	1	5	cone	t	t	f	2019-02-10 17:10:24.96+00	2019-02-10 17:10:24.96+00
437	Tenderize	tenderize	http:/localhost/assets/images/tenderize.png	http://localhost/assets/images/tenderize.svg	Slice an enemy for 113-153 + 133% Weapon Damage.	debuff	instant	resource	16	9	0	1	5	cone	t	f	f	2019-02-10 17:10:24.96+00	2019-02-10 17:10:24.96+00
438	Tendon Slice	tendon-slice	http:/localhost/assets/images/tendon-slice.png	http://localhost/assets/images/tendon-slice.svg	Slash in front of you for 134-181 + 158% Weapon Damage. Applies a 50% movement reduction to the target.	debuff	instant	energy	22	24	0	1	5	cone	f	t	f	2019-02-10 17:10:24.96+00	2019-02-10 17:10:24.96+00
439	Terrifying Features	terrifying-features	http:/localhost/assets/images/terrifying-features.png	http://localhost/assets/images/terrifying-features.svg	Protect yourself with a powerful enchantment periodically stunning attackers.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.961+00	2019-02-10 17:10:24.961+00
440	Thornshield	thornshield	http:/localhost/assets/images/thornshield.png	http://localhost/assets/images/thornshield.svg	Envelope yourself with dangerous Thorns for 20 seconds causing any who strike you to take damage.	buff	instant	resource	16	45	20	0	0	self	t	f	f	2019-02-10 17:10:24.961+00	2019-02-10 17:10:24.961+00
441	Throw Hurlbat	throw-hurlbat	http:/localhost/assets/images/throw-hurlbat.png	http://localhost/assets/images/throw-hurlbat.svg	Throw a projectile forward, dealing 125-169 + 147% Weapon Damage as Piercing Damage. Applies a 50% movement speed reduction to those hit.	ranged attack	instant	rage	14	24	1.10000002	1	0	reticle	f	f	f	2019-02-10 17:10:24.961+00	2019-02-10 17:10:24.961+00
442	Throw Illusion Shield	throw-illusion-shield	http:/localhost/assets/images/throw-illusion-shield.png	http://localhost/assets/images/throw-illusion-shield.svg	Throw an illusion shield and ricochet off multiple nearby enemies for 85 - 115 + 100% Weapon Damage.  THROW ILLUSION SHIELD will ricochet to as many as 2 with damage reduced by 30% each ricochet.	melee attack	instant	resource	16	9	0	2	15	cone	t	f	f	2019-02-10 17:10:24.964+00	2019-02-10 17:10:24.964+00
443	Touch of Rot	touch-of-rot	http:/localhost/assets/images/touch-of-rot.png	http://localhost/assets/images/touch-of-rot.svg	Your basic attacks apply a stacking Support Power debuff.	passive		N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.964+00	2019-02-10 17:10:24.964+00
444	Toughness	toughness	http:/localhost/assets/images/toughness.png	http://localhost/assets/images/toughness.svg	Strengthen group members and yourself increasing their Maximum Health by 20% for 45 seconds.	buff	instant	resource	16	68	45	5	0	group	t	f	f	2019-02-10 17:10:24.965+00	2019-02-10 17:10:24.965+00
445	Tunnel	tunnel	http:/localhost/assets/images/tunnel.png	http://localhost/assets/images/tunnel.svg	Quickly excavate a path directly ahead of you, ignoring walls and object in your path.	non-aggressive	instant	N/A	N/A	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.965+00	2019-02-10 17:10:24.965+00
446	Twin Assault	twin-assault	http:/localhost/assets/images/twin-assault.png	http://localhost/assets/images/twin-assault.svg	Attack in front of you twice for 15-20 + 17% Weapon Damage each hit.	melee attack	instant	energy	172	9	0	1	7.5	cone	f	t	f	2019-02-10 17:10:24.965+00	2019-02-10 17:10:24.965+00
447	Twin Surge	twin-surge	http:/localhost/assets/images/twin-surge.png	http://localhost/assets/images/twin-surge.svg	Slash in front of you with both blades dealing 57 - 77 + 67% Weapon Damage twice.	melee attack	instant	energy	25	5	0	1	5	cone	f	f	f	2019-02-10 17:10:24.965+00	2019-02-10 17:10:24.965+00
448	Ultimate Warrior	ultimate-warrior	http:/localhost/assets/images/ultimate-warrior.png	http://localhost/assets/images/ultimate-warrior.svg	Harness your Hatred and grow in size, increase Bonus Damage by up to 10%, heal restore Rage and grant two points of Dominance. This effect can stack twice.	non-aggressive	instant	hate	100	0	0	1	0	self	f	f	f	2019-02-10 17:10:24.965+00	2019-02-10 17:10:24.965+00
449	Underdog	underdog	http:/localhost/assets/images/underdog.png	http://localhost/assets/images/underdog.svg	Come back even stronger after suffering a Knockdown or Stun with your Attack Power increasing by 300 for 30 seconds. This effect can stack with itself.	passive	passive	resource	16	0	30	1	0	self	t	f	f	2019-02-10 17:10:24.966+00	2019-02-10 17:10:24.966+00
450	Uniform Leather	uniform-leather	http:/localhost/assets/images/uniform-leather.png	http://localhost/assets/images/uniform-leather.svg	Increase your Attack Power by 100 when wearing a full set of non-basic Leather armor.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.966+00	2019-02-10 17:10:24.966+00
451	Uniform Mail	uniform-mail	http:/localhost/assets/images/uniform-mail.png	http://localhost/assets/images/uniform-mail.svg	Increase your Attack Power by 100 when wearing a full set of non-basic Mail armor.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.966+00	2019-02-10 17:10:24.966+00
452	Uniform Plate	uniform-plate	http:/localhost/assets/images/uniform-plate.png	http://localhost/assets/images/uniform-plate.svg	Increase your Attack Power by 100 when wearing a full set of non-basic Plate armor.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.966+00	2019-02-10 17:10:24.966+00
453	Unstoppable	unstoppable	http:/localhost/assets/images/unstoppable.png	http://localhost/assets/images/unstoppable.svg	Embrace overwhelming mania, maximuze your Resolve and trigger Crowd Control Immunity for a short time.	buff	instant	resource	16	45	0	1	0	self	t	f	f	2019-02-10 17:10:24.966+00	2019-02-10 17:10:24.966+00
454	Usurious Bargain	usurious-bargain	http:/localhost/assets/images/usurious-bargain.png	http://localhost/assets/images/usurious-bargain.svg	Sacrifice <cost> Health for 50 Stamina	buff	instant	health	0	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.967+00	2019-02-10 17:10:24.967+00
455	Vanish	vanish	http:/localhost/assets/images/vanish.png	http://localhost/assets/images/vanish.svg	Immediately dive into your Burrow becoming immune to damage and control effects for a short time and leaving an explosive decoy in your place that explodes for 213 - 320 + 267% Weapon Damage.	ultimate	instant	N/A	N/A	9	0	1	0	self	f	f	f	2019-02-10 17:10:24.967+00	2019-02-10 17:10:24.967+00
456	Vengeful Aura	vengeful-aura	http:/localhost/assets/images/vengeful-aura.png	http://localhost/assets/images/vengeful-aura.svg	Fortify group members and yourself with otherworldly strength increasing their maximum Attack Power by 75 while you maintain the effect.	aura	toggle	mana	175	1	0	5	50	group	f	f	f	2019-02-10 17:10:24.967+00	2019-02-10 17:10:24.967+00
457	Verses of Victory	verses-of-victory	http:/localhost/assets/images/verses-of-victory.png	http://localhost/assets/images/verses-of-victory.svg	Increases your groups Attack Power by 75 and Support Power by 75 for 12 seconds. Type 4 Song.	buff	2 Seconds	N/A	N/A	1	12	5	0	group	t	f	f	2019-02-10 17:10:24.967+00	2019-02-10 17:10:24.967+00
458	Vicious Stomp	vicious-stomp	http:/localhost/assets/images/vicious-stomp.png	http://localhost/assets/images/vicious-stomp.svg	Stomp the ground in front of you, dealing 113-153 + 133% Weapon Damage and slowing your target. Consumes a point of Dominance when used for a guaranteed critical hit.	debuff	instant	rage	12	24	0	1	6	cone	f	f	f	2019-02-10 17:10:24.967+00	2019-02-10 17:10:24.967+00
459	Vile Slash	vile-slash	http:/localhost/assets/images/vile-slash.png	http://localhost/assets/images/vile-slash.svg	Slash in front of you twice for 45-61 + 53% Weapon Damage and gain the Spot Weakness buff inccreasing your Physical Armor Penetration by 5%.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.968+00	2019-02-10 17:10:24.968+00
460	Vision of the All Father	vision-of-the-all-father	http:/localhost/assets/images/vision-of-the-all-father.png	http://localhost/assets/images/vision-of-the-all-father.svg	Gain Immunity to Blind effects.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.968+00	2019-02-10 17:10:24.968+00
461	Warp Metal	warp-metal	http:/localhost/assets/images/warp-metal.png	http://localhost/assets/images/warp-metal.svg	Curse an enemy with a destructive aura increasing Resource Cost for each Slashing damage attack they commit.	debuff	instant	resource	16	30	8	1	15	ray	t	f	f	2019-02-10 17:10:24.968+00	2019-02-10 17:10:24.968+00
462	Water Spirits	water-spirits	http:/localhost/assets/images/water-spirits.png	http://localhost/assets/images/water-spirits.svg	Summon and launch a Water Spirit forward which heals allies within 5m of the Water Spirit. Water Spirits last 20 seconds or 30 heals. Only heals each player a maximum of 5 times. Enemies hit by the Water Spirit suffer a 30% to Damage Bonus Fire for 20 seconds.	buff	charged	resource	46	25	20	3	5	area	t	f	f	2019-02-10 17:10:24.968+00	2019-02-10 17:10:24.968+00
463	Way of the Leader	way-of-the-leader	http:/localhost/assets/images/way-of-the-leader.png	http://localhost/assets/images/way-of-the-leader.svg	Increases a variety of stats for groups members based on the Leader's skill training in the Leadership skill tree. The group leader must have this Passive loaded out in order to function.	passive	passive	N/A	N/A	0	0	5	0	group	f	f	f	2019-02-10 17:10:24.968+00	2019-02-10 17:10:24.968+00
464	Way of the Trails	way-of-the-trails	http:/localhost/assets/images/way-of-the-trails.png	http://localhost/assets/images/way-of-the-trails.svg	Grants Trailblazer passive, which increases Out of Combat Movement Speed by 15%. If you already have the Trailblazer passive, this upgrades to Trailmaster, which increases Out of Combat Movement Speed by 25%.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.969+00	2019-02-10 17:10:24.969+00
465	Weapon Finesse	weapon-finesse	http:/localhost/assets/images/weapon-finesse.png	http://localhost/assets/images/weapon-finesse.svg	Reduce your Power Efficiency by 20%, which reduces the resource cost of using powers.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.969+00	2019-02-10 17:10:24.969+00
466	Weapon Oil	weapon-oil	http:/localhost/assets/images/weapon-oil.png	http://localhost/assets/images/weapon-oil.svg	Restore group members and yourself to full combat readiness removing and gaining immunity to Attack Crowd Control effects for 5 seconds. Weapon Oil can be used while Suppressed.	buff	instant	resource	16	45	5	5	0	group	t	f	f	2019-02-10 17:10:24.969+00	2019-02-10 17:10:24.969+00
467	Wee One	wee-one	http:/localhost/assets/images/wee-one.png	http://localhost/assets/images/wee-one.svg	Shrink the targeted area down to size, reducing Damage Bonus by 20% for 25 seconds.  This debuff stacks up to 3 times.	debuff	instant	resource	14	45	25	5	5	area	t	f	f	2019-02-10 17:10:24.969+00	2019-02-10 17:10:24.969+00
468	Whirling Leap	whirling-leap	http:/localhost/assets/images/whirling-leap.png	http://localhost/assets/images/whirling-leap.svg	Leap into the air creating a vacuum at your feet pulling in nearby enemies and damaging them for 232-314 + 273% Crushing Weapon Damage and becoming immune to damage and control effects for a short period of time.	ultimate	instant	N/A	N/A	5	0	5	8	sphere	f	f	f	2019-02-10 17:10:24.969+00	2019-02-10 17:10:24.969+00
469	Whirling Pain	whirling-pain	http:/localhost/assets/images/whirling-pain.png	http://localhost/assets/images/whirling-pain.svg	Sweep seven times around you dealing 59-79 + 69% Weapon Damage per swing. You may move while spinning. Consumes a point of Dominance when used for guaranteed critical hits.	melee attack	instant	rage	11	24	0	5	4.30000019	sphere	f	t	f	2019-02-10 17:10:24.97+00	2019-02-10 17:10:24.97+00
470	Whirlwind	whirlwind	http:/localhost/assets/images/whirlwind.png	http://localhost/assets/images/whirlwind.svg	Spin around rapidly hitting nearby enemies multiple times for 24-30 + 27% Weapon Damage and causing them to Bleed for 18-24 damage.	melee attack	channeled	fury	9	0	0	5	5	sphere	f	t	f	2019-02-10 17:10:24.97+00	2019-02-10 17:10:24.97+00
471	Wicked Slash	wicked-slash	http:/localhost/assets/images/wicked-slash.png	http://localhost/assets/images/wicked-slash.svg	Slash in front of you twice for 50-68 + 59% Weapon Damage.	melee attack	instant	N/A	N/A	0	0	1	5	cone	f	t	f	2019-02-10 17:10:24.97+00	2019-02-10 17:10:24.97+00
472	Wicked Winds	wicked-winds	http:/localhost/assets/images/wicked-winds.png	http://localhost/assets/images/wicked-winds.svg	Launch a swirling maelstrom to fling enemies around and causing 193 - 290 + 242% Weapon Damage.	ranged attack	instant	resource	79	24	0	5	0	reticle	f	t	f	2019-02-10 17:10:24.97+00	2019-02-10 17:10:24.97+00
473	Wild Charge	wild-charge	http:/localhost/assets/images/wild-charge.png	http://localhost/assets/images/wild-charge.svg	Charge forward while the input key is depressed, dealing 104 - 141 + 123% Weapon Damage to anything in your way. Applies an Armor Break to all hit, which reduces all Physical Mitigations by 20% for 15 seconds.	melee attack	hold channeled	N/A	N/A	45	15	1	12	rectangle	t	f	f	2019-02-10 17:10:24.971+00	2019-02-10 17:10:24.971+00
474	Will o' Wisps	will-o'-wisps	http:/localhost/assets/images/will-o'-wisps.png	http://localhost/assets/images/will-o'-wisps.svg	Charge up and fling a Will o' Wisp to heal allies in a #range# area for 270 - 330 + 300% Weapon Damage.	non-aggressive	charged	resource	63	25	0	5	0	area	f	f	f	2019-02-10 17:10:24.971+00	2019-02-10 17:10:24.971+00
475	Will of the Stoneborn	will-of-the-stoneborn	http:/localhost/assets/images/will-of-the-stoneborn.png	http://localhost/assets/images/will-of-the-stoneborn.svg	Fortify your defense increasing your Crushing armor and improving weapon efficiency.	buff	instant	energy	16	45	30	1	0	self	t	f	f	2019-02-10 17:10:24.971+00	2019-02-10 17:10:24.971+00
476	Wood-Elf Bloodline	wood-elf-bloodline	http:/localhost/assets/images/wood-elf-bloodline.png	http://localhost/assets/images/wood-elf-bloodline.svg	Gain Trailmaster and increase Out of Combat Movement Speed by 25%.	passive	passive	N/A	N/A	0	0	1	0	self	t	f	f	2019-02-10 17:10:24.971+00	2019-02-10 17:10:24.971+00
477	You Shall Be Avenged	you-shall-be-avenged	http:/localhost/assets/images/you-shall-be-avenged.png	http://localhost/assets/images/you-shall-be-avenged.svg	Increase your Attack Power when a group member dies.	passive	passive	N/A	N/A	0	0	0	0	self	t	f	f	2019-02-10 17:10:24.971+00	2019-02-10 17:10:24.971+00
478	Zealot Rush	zealot-rush	http:/localhost/assets/images/zealot-rush.png	http://localhost/assets/images/zealot-rush.svg	Dash quickly moving 20m in your WASD direction at the cost of one Dodge pip. You recover one Dodge pip every 20 seconds.	dodge	instant	dodge	1	0	0	1	20	self	t	f	f	2019-02-10 17:10:24.971+00	2019-02-10 17:10:24.971+00
\.


--
-- Data for Name: race_disciplines; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.race_disciplines (discipline_id, race_id) FROM stdin;
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: h3lix
--

COPY public.races (id, name, slug, icon, icon_svg, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix
--

SELECT pg_catalog.setval('public.classes_id_seq', 11, true);


--
-- Name: disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix
--

SELECT pg_catalog.setval('public.disciplines_id_seq', 90, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 13, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: powers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix
--

SELECT pg_catalog.setval('public.powers_id_seq', 478, true);


--
-- Name: races_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix
--

SELECT pg_catalog.setval('public.races_id_seq', 1, false);


--
-- Name: classes classes_name_unique; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_name_unique UNIQUE (name);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: classes classes_slug_unique; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_slug_unique UNIQUE (slug);


--
-- Name: disciplines disciplines_name_unique; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_name_unique UNIQUE (name);


--
-- Name: disciplines disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (id);


--
-- Name: disciplines disciplines_slug_unique; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_slug_unique UNIQUE (slug);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: powers powers_name_unique; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.powers
    ADD CONSTRAINT powers_name_unique UNIQUE (name);


--
-- Name: powers powers_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.powers
    ADD CONSTRAINT powers_pkey PRIMARY KEY (id);


--
-- Name: powers powers_slug_unique; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.powers
    ADD CONSTRAINT powers_slug_unique UNIQUE (slug);


--
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (id);


--
-- Name: class_disciplines class_disciplines_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.class_disciplines
    ADD CONSTRAINT class_disciplines_class_id_foreign FOREIGN KEY (class_id) REFERENCES public.classes(id);


--
-- Name: class_disciplines class_disciplines_discipline_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.class_disciplines
    ADD CONSTRAINT class_disciplines_discipline_id_foreign FOREIGN KEY (discipline_id) REFERENCES public.disciplines(id);


--
-- Name: class_powers class_powers_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.class_powers
    ADD CONSTRAINT class_powers_class_id_foreign FOREIGN KEY (class_id) REFERENCES public.classes(id);


--
-- Name: class_powers class_powers_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.class_powers
    ADD CONSTRAINT class_powers_power_id_foreign FOREIGN KEY (power_id) REFERENCES public.powers(id);


--
-- Name: class_races class_races_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.class_races
    ADD CONSTRAINT class_races_class_id_foreign FOREIGN KEY (class_id) REFERENCES public.classes(id);


--
-- Name: class_races class_races_race_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.class_races
    ADD CONSTRAINT class_races_race_id_foreign FOREIGN KEY (race_id) REFERENCES public.races(id);


--
-- Name: discipline_powers discipline_powers_discipline_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.discipline_powers
    ADD CONSTRAINT discipline_powers_discipline_id_foreign FOREIGN KEY (discipline_id) REFERENCES public.disciplines(id);


--
-- Name: discipline_powers discipline_powers_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.discipline_powers
    ADD CONSTRAINT discipline_powers_power_id_foreign FOREIGN KEY (power_id) REFERENCES public.powers(id);


--
-- Name: power_combos power_combos_child_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.power_combos
    ADD CONSTRAINT power_combos_child_power_id_foreign FOREIGN KEY (child_power_id) REFERENCES public.powers(id);


--
-- Name: power_combos power_combos_parent_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.power_combos
    ADD CONSTRAINT power_combos_parent_power_id_foreign FOREIGN KEY (parent_power_id) REFERENCES public.powers(id);


--
-- Name: race_disciplines race_disciplines_discipline_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.race_disciplines
    ADD CONSTRAINT race_disciplines_discipline_id_foreign FOREIGN KEY (discipline_id) REFERENCES public.disciplines(id);


--
-- Name: race_disciplines race_disciplines_race_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix
--

ALTER TABLE ONLY public.race_disciplines
    ADD CONSTRAINT race_disciplines_race_id_foreign FOREIGN KEY (race_id) REFERENCES public.races(id);


--
-- PostgreSQL database dump complete
--

