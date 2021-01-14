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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


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
    tag_id "char"[] NOT NULL,
    name "char"[],
    surname "char"[],
    email "char"[],
    cf "char"[],
    address "char"[],
    dob "char"[],
    balance "char"[]
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card (
    pan "char"[] NOT NULL,
    holder "char"[],
    expiration_date "char"[],
    cvv "char"[],
    datetime "char"[],
    account "char"[]
);


ALTER TABLE public.card OWNER TO postgres;

--
-- Name: colletta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colletta (
    id "char"[] NOT NULL,
    datetime "char"[],
    amount "char"[],
    quote "char"[],
    amount_temp "char"[],
    beneficiary "char"[]
);


ALTER TABLE public.colletta OWNER TO postgres;

--
-- Name: contribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contribute (
    contributor "char"[] NOT NULL,
    colletta "char"[] NOT NULL
);


ALTER TABLE public.contribute OWNER TO postgres;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendship (
    datetime "char"[],
    account1 "char"[] NOT NULL,
    account2 "char"[] NOT NULL
);


ALTER TABLE public.friendship OWNER TO postgres;

--
-- Name: recharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recharge (
    id "char"[] NOT NULL,
    amount "char"[],
    datetime "char"[],
    account "char"[],
    card "char"[]
);


ALTER TABLE public.recharge OWNER TO postgres;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id "char"[] NOT NULL,
    amount "char"[],
    datetime "char"[],
    category "char"[],
    sender "char"[],
    recipient "char"[]
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (tag_id);


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
    ADD CONSTRAINT card_account_fkey FOREIGN KEY (account) REFERENCES public.account(tag_id) NOT VALID;


--
-- Name: colletta colletta_beneficiary_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colletta
    ADD CONSTRAINT colletta_beneficiary_fkey FOREIGN KEY (beneficiary) REFERENCES public.account(tag_id) NOT VALID;


--
-- Name: contribute contribute_colletta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contribute
    ADD CONSTRAINT contribute_colletta_fkey FOREIGN KEY (colletta) REFERENCES public.colletta(id) NOT VALID;


--
-- Name: contribute contribute_contributor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contribute
    ADD CONSTRAINT contribute_contributor_fkey FOREIGN KEY (contributor) REFERENCES public.account(tag_id) NOT VALID;


--
-- Name: friendship friendship_account1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_account1_fkey FOREIGN KEY (account1) REFERENCES public.account(tag_id) NOT VALID;


--
-- Name: friendship friendship_account2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_account2_fkey FOREIGN KEY (account2) REFERENCES public.account(tag_id) NOT VALID;


--
-- Name: recharge recharge_account_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge
    ADD CONSTRAINT recharge_account_fkey FOREIGN KEY (account) REFERENCES public.account(tag_id) NOT VALID;


--
-- Name: recharge recharge_card_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge
    ADD CONSTRAINT recharge_card_fkey FOREIGN KEY (card) REFERENCES public.card(pan) NOT VALID;


--
-- Name: transaction transaction_recipient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_recipient_fkey FOREIGN KEY (recipient) REFERENCES public.account(tag_id) NOT VALID;


--
-- Name: transaction transaction_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_sender_fkey FOREIGN KEY (sender) REFERENCES public.account(tag_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

