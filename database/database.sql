--
-- PostgreSQL database dump
--

\restrict 3b5uxh51qN2FCXiTrSR0nb5lqZIFTn0BWpvfT834z4xmqSibKYVtR3acZuqdcdE

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-01-16 17:11:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4809 (class 1262 OID 52970)
-- Name: projNeki; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "projNeki" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


\unrestrict 3b5uxh51qN2FCXiTrSR0nb5lqZIFTn0BWpvfT834z4xmqSibKYVtR3acZuqdcdE
\connect "projNeki"
\restrict 3b5uxh51qN2FCXiTrSR0nb5lqZIFTn0BWpvfT834z4xmqSibKYVtR3acZuqdcdE

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 52972)
-- Name: administrador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.administrador (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(100) NOT NULL,
    senha character varying(255) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 52971)
-- Name: administrador_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.administrador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 217
-- Name: administrador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.administrador_id_seq OWNED BY public.administrador.id;


--
-- TOC entry 220 (class 1259 OID 52981)
-- Name: evento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evento (
    id bigint NOT NULL,
    data_evento date NOT NULL,
    imagem_url character varying(255),
    localizacao character varying(150) NOT NULL,
    titulo character varying(150) NOT NULL,
    administrador_id bigint NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 52980)
-- Name: evento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 219
-- Name: evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evento_id_seq OWNED BY public.evento.id;


--
-- TOC entry 4646 (class 2604 OID 52975)
-- Name: administrador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrador ALTER COLUMN id SET DEFAULT nextval('public.administrador_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 52984)
-- Name: evento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.evento_id_seq'::regclass);


--
-- TOC entry 4801 (class 0 OID 52972)
-- Dependencies: 218
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.administrador VALUES (1, 'Bmarchiori4@gmail.com', 'Bruno Marchiori', '$2a$10$os4M2jEEbXxzcZFUcegDOuL6PHRfR.j.vKVQBV63oaFZ0eo9S0nJS');
INSERT INTO public.administrador VALUES (2, 'tvksszm@gmail.com', 'Bruno Marchiori', '$2a$10$4j9GPtOpa.uUoxNkpZPDBuV79fQ6i.t2.Tcpx1I5dPNDFhgOjow5i');
INSERT INTO public.administrador VALUES (3, 'teste@teste.com', 'Admin Teste', '$2a$10$5wdtd9y./mrRx7RZADleIeCk3Pbyoo96oBkkxhm7pT/wjU7a8uDsG');
INSERT INTO public.administrador VALUES (4, 'teste1@teste.com', 'Admin Teste', '$2a$10$KywTlVBazuxHgl/R5Yu1MOPhDif/7KuDaztIOFxhOkXoppseNvhwK');
INSERT INTO public.administrador VALUES (5, 'teste@teste1.com', 'Admin', '$2a$10$7zJ2oa2nmKvkjjT6qN4UM.dUnnysDPoNBLqcI0MY5H2JwWEZ82ck.');
INSERT INTO public.administrador VALUES (6, 'teste@test2e.com', 'Admin a', '$2a$10$USFmVXQFMUxnAUQqh0ioh.x/UoBMAgJMNd9u.RFR69nX3OzbZvQBy');


--
-- TOC entry 4803 (class 0 OID 52981)
-- Dependencies: 220
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.evento VALUES (1, '2026-01-12', 'string', 'stringaa', 'string', 2);
INSERT INTO public.evento VALUES (2, '2026-10-03', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800&h=600&fit=crop%27', 'Petrópolis, Centro', 'Festival de Música ao Vivo', 2);
INSERT INTO public.evento VALUES (3, '2026-02-01', 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800&h=600&fit=crop%27', 'Rio de Janeiro, Botafogo', 'Workshop de Gastronomia', 1);
INSERT INTO public.evento VALUES (4, '2026-03-22', 'https://images.unsplash.com/photo-1551836022-d5d88e9218df', 'São Paulo – SP', 'Tech Summit Brasil 2025', 1);
INSERT INTO public.evento VALUES (5, '2026-05-05', 'https://images.unsplash.com/photo-1519389950473-47ba0277781c', 'Rio de Janeiro – RJ', 'Hackathon Dev Experience', 1);
INSERT INTO public.evento VALUES (6, '2026-04-18', 'https://images.unsplash.com/photo-1521737604893-d14cc237f11d', 'Belo Horizonte – MG', 'Startup Weekend Inovação', 1);
INSERT INTO public.evento VALUES (7, '2026-05-10', 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d', 'Curitiba – PR', 'Expo Tecnologia & Negócios', 1);
INSERT INTO public.evento VALUES (8, '2026-05-25', 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4', 'Petrópolis – RJ', 'Workshop Fullstack na Prática', 1);
INSERT INTO public.evento VALUES (16, '2026-07-04', 'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=600&h=400&fit=crop&auto=format&quality=80', 'Porto Alegre - RS', 'Cloud & DevOps Summit', 3);
INSERT INTO public.evento VALUES (17, '2026-07-18', 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600&h=400&fit=crop&auto=format&quality=80', 'Recife - PE', 'Tech Education Expo', 3);
INSERT INTO public.evento VALUES (18, '2026-08-01', 'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=600&h=400&fit=crop&auto=format&quality=80', 'Brasília - DF', 'Digital Innovation Summit', 3);
INSERT INTO public.evento VALUES (20, '2026-09-10', 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600&h=400&fit=crop&auto=format&quality=80', 'Fortaleza - CE', 'Encontro de Engenheiros de Software', 3);
INSERT INTO public.evento VALUES (21, '2026-09-26', 'https://images.unsplash.com/photo-1511578314322-379afb476865?w=600&h=400&fit=crop&auto=format&quality=80', 'Natal - RN', 'Semana da Inovação Digital', 3);
INSERT INTO public.evento VALUES (22, '2026-10-14', 'https://images.unsplash.com/photo-1522199710521-72d69614c702?w=600&h=400&fit=crop&auto=format&quality=80', 'Goiânia - GO', 'Tech Leaders Conference', 3);
INSERT INTO public.evento VALUES (23, '2026-11-03', 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=600&h=400&fit=crop&auto=format&quality=80', 'Manaus - AM', 'Amazon Tech Experience', 3);
INSERT INTO public.evento VALUES (26, '2026-04-06', 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600&h=400&fit=crop&auto=format&quality=80', 'Niterói - RJ', 'Code & Architecture Day', 3);
INSERT INTO public.evento VALUES (27, '2026-04-19', 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=600&h=400&fit=crop&auto=format&quality=80', 'Belo Horizonte - MG', 'Tech Builders Conference', 3);
INSERT INTO public.evento VALUES (28, '2026-05-02', 'https://images.unsplash.com/photo-1517433456452-f9633a875f6f?w=600&h=400&fit=crop&auto=format&quality=80', 'Uberlândia - MG', 'Software Design Summit', 3);
INSERT INTO public.evento VALUES (29, '2026-05-16', 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600&h=400&fit=crop&auto=format&quality=80', 'Campinas - SP', 'Backend Engineering Experience', 3);
INSERT INTO public.evento VALUES (32, '2026-06-27', 'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?w=600&h=400&fit=crop&auto=format&quality=80', 'Joinville - SC', 'Engineering Leadership Forum', 3);
INSERT INTO public.evento VALUES (34, '2026-07-25', 'https://images.unsplash.com/photo-1487058792275-0ad4aaf24ca7?w=600&h=400&fit=crop&auto=format&quality=80', 'Caxias do Sul - RS', 'Infraestrutura e Escalabilidade', 3);
INSERT INTO public.evento VALUES (35, '2026-08-09', 'https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?w=600&h=400&fit=crop&auto=format&quality=80', 'Curitiba - PR', 'Arquitetura de Sistemas Modernos', 3);
INSERT INTO public.evento VALUES (36, '2026-08-23', 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600&h=400&fit=crop&auto=format&quality=80', 'Londrina - PR', 'Tech Performance Conference', 3);
INSERT INTO public.evento VALUES (38, '2026-09-20', 'https://images.unsplash.com/photo-1522071901873-411886a10004?w=600&h=400&fit=crop&auto=format&quality=80', 'João Pessoa - PB', 'Construção de Software em Escala', 3);
INSERT INTO public.evento VALUES (44, '2026-12-10', 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=600&h=400&fit=crop&auto=format&quality=80', 'São Paulo - SP', 'Software Architecture Forum', 3);
INSERT INTO public.evento VALUES (45, '2027-01-08', 'https://images.unsplash.com/photo-1504639725590-34d0984388bd?w=600&h=400&fit=crop&auto=format&quality=80', 'Rio de Janeiro - RJ', 'Frontend Engineering Summit', 3);
INSERT INTO public.evento VALUES (47, '2027-02-14', 'https://images.unsplash.com/photo-1497493292307-31c376b6e479?w=600&h=400&fit=crop&auto=format&quality=80', 'Campinas - SP', 'Clean Code & Boas Práticas', 3);
INSERT INTO public.evento VALUES (48, '2027-03-03', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=600&h=400&fit=crop&auto=format&quality=80', 'Florianópolis - SC', 'Microservices & Cloud Native Day', 3);
INSERT INTO public.evento VALUES (51, '2027-04-22', 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600&h=400&fit=crop&auto=format&quality=80', 'São Paulo - SP', 'Advanced Backend Engineering', 3);
INSERT INTO public.evento VALUES (55, '2027-07-03', 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600&h=400&fit=crop&auto=format&quality=80', 'Curitiba - PR', 'Clean Architecture & SOLID', 3);
INSERT INTO public.evento VALUES (61, '2026-01-13', 'https://ravel.com.br/blog/wp-content/uploads/2023/02/Tendencias-de-tecnologia-2023-Capa.jpg', 'Petrópolis – RJ', 'Aprendizado de IA', 3);
INSERT INTO public.evento VALUES (66, '2026-01-17', 'https://i0.wp.com/blog.portaleducacao.com.br/wp-content/uploads/2022/02/365-O-que-e%CC%81-tecnologia_.jpg?fit=740%2C416&ssl=1', 'Sao paulo centro', 'Aaaaa', 6);
INSERT INTO public.evento VALUES (24, '2026-03-12', 'https://images.unsplash.com/photo-1492724441997-5dc865305da7?w=600&h=400&fit=crop&auto=format&quality=80', 'São Paulo - SP', 'Future Tech Forum', 3);


--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 217
-- Name: administrador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.administrador_id_seq', 6, true);


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 219
-- Name: evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.evento_id_seq', 67, true);


--
-- TOC entry 4649 (class 2606 OID 52979)
-- Name: administrador administrador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (id);


--
-- TOC entry 4653 (class 2606 OID 52988)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);


--
-- TOC entry 4651 (class 2606 OID 52990)
-- Name: administrador uk_h121ki47maojpkmvdvqf87ybo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT uk_h121ki47maojpkmvdvqf87ybo UNIQUE (email);


--
-- TOC entry 4654 (class 2606 OID 52991)
-- Name: evento fk8qei6lmqo0s0jkip5yj07yk1b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT fk8qei6lmqo0s0jkip5yj07yk1b FOREIGN KEY (administrador_id) REFERENCES public.administrador(id);


-- Completed on 2026-01-16 17:11:35

--
-- PostgreSQL database dump complete
--

\unrestrict 3b5uxh51qN2FCXiTrSR0nb5lqZIFTn0BWpvfT834z4xmqSibKYVtR3acZuqdcdE

