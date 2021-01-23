--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id character varying(255) NOT NULL,

    name character varying(255),
    surname character varying(255),
    email character varying(255),
    cf character varying(255),
    address character varying(255),
    dob character varying(255),
    balance numeric
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card (
    pan character varying(255) NOT NULL,
    holder character varying(255),
    expiration_date character varying(255),
    cvv character varying(255),
    datetime character varying(255),
    account character varying(255)
);


ALTER TABLE public.card OWNER TO postgres;

--
-- Name: colletta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colletta (
    id integer NOT NULL,
    datetime character varying(255),
    quote numeric,
    beneficiary character varying(255),
    amount numeric,
    amount_temp numeric
);


ALTER TABLE public.colletta OWNER TO postgres;

--
-- Name: colletta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colletta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colletta_id_seq OWNER TO postgres;

--
-- Name: colletta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colletta_id_seq OWNED BY public.colletta.id;


--
-- Name: contribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contribute (
    contributor character varying(255) NOT NULL,
    colletta bigint NOT NULL
);


ALTER TABLE public.contribute OWNER TO postgres;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendship (
    datetime character varying(255),
    account1 character varying(255) NOT NULL,
    account2 character varying(255) NOT NULL
);


ALTER TABLE public.friendship OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: recharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recharge (
    id integer NOT NULL,
    datetime character varying(255),
    account character varying(255),
    card character varying(255),
    amount numeric
);


ALTER TABLE public.recharge OWNER TO postgres;

--
-- Name: recharge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recharge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recharge_id_seq OWNER TO postgres;

--
-- Name: recharge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recharge_id_seq OWNED BY public.recharge.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    datetime character varying(255),
    category character varying(255),
    sender character varying(255),
    recipient character varying(255),
    amount numeric
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: colletta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colletta ALTER COLUMN id SET DEFAULT nextval('public.colletta_id_seq'::regclass);


--
-- Name: recharge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge ALTER COLUMN id SET DEFAULT nextval('public.recharge_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, name, surname, email, cf, address, dob, balance) FROM stdin;
\.


--
-- Data for Name: card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card (pan, holder, expiration_date, cvv, datetime, account) FROM stdin;
\.


--
-- Data for Name: colletta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colletta (id, datetime, quote, beneficiary, amount, amount_temp) FROM stdin;
\.


--
-- Data for Name: contribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contribute (contributor, colletta) FROM stdin;
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendship (datetime, account1, account2) FROM stdin;
\.


--
-- Data for Name: recharge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recharge (id, datetime, account, card, amount) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id, datetime, category, sender, recipient, amount) FROM stdin;
\.


--
-- Name: colletta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colletta_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: recharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recharge_id_seq', 1, false);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 1, false);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: card card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (pan);


--
-- Name: colletta colletta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colletta
    ADD CONSTRAINT colletta_pkey PRIMARY KEY (id);


--
-- Name: contribute contribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contribute
    ADD CONSTRAINT contribute_pkey PRIMARY KEY (contributor, colletta);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (account1, account2);


--
-- Name: recharge recharge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge
    ADD CONSTRAINT recharge_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: card card_account_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_account_fkey FOREIGN KEY (account) REFERENCES public.account(id) NOT VALID;


--
-- Name: colletta colletta_beneficiary_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colletta
    ADD CONSTRAINT colletta_beneficiary_fkey FOREIGN KEY (beneficiary) REFERENCES public.account(id) NOT VALID;


--
-- Name: contribute contribute_colletta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contribute
    ADD CONSTRAINT contribute_colletta_fkey FOREIGN KEY (colletta) REFERENCES public.colletta(id) NOT VALID;


--
-- Name: contribute contribute_contributor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contribute
    ADD CONSTRAINT contribute_contributor_fkey FOREIGN KEY (contributor) REFERENCES public.account(id) NOT VALID;


--
-- Name: friendship friendship_account1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_account1_fkey FOREIGN KEY (account1) REFERENCES public.account(id) NOT VALID;


--
-- Name: friendship friendship_account2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_account2_fkey FOREIGN KEY (account2) REFERENCES public.account(id) NOT VALID;


--
-- Name: recharge recharge_account_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge
    ADD CONSTRAINT recharge_account_fkey FOREIGN KEY (account) REFERENCES public.account(id) NOT VALID;


--
-- Name: recharge recharge_card_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge
    ADD CONSTRAINT recharge_card_fkey FOREIGN KEY (card) REFERENCES public.card(pan) NOT VALID;


--
-- Name: transaction transaction_recipient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_recipient_fkey FOREIGN KEY (recipient) REFERENCES public.account(id) NOT VALID;


--
-- Name: transaction transaction_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_sender_fkey FOREIGN KEY (sender) REFERENCES public.account(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

