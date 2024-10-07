--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    tries integer NOT NULL,
    username character varying(22) NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3, 'd', 1);
INSERT INTO public.games VALUES (6, 'd', 2);
INSERT INTO public.games VALUES (842, 'user_1728286777821', 3);
INSERT INTO public.games VALUES (834, 'user_1728286777821', 4);
INSERT INTO public.games VALUES (841, 'user_1728286777820', 5);
INSERT INTO public.games VALUES (190, 'user_1728286777820', 6);
INSERT INTO public.games VALUES (20, 'user_1728286777821', 7);
INSERT INTO public.games VALUES (330, 'user_1728286777821', 8);
INSERT INTO public.games VALUES (796, 'user_1728286777821', 9);
INSERT INTO public.games VALUES (143, 'user_1728286804039', 10);
INSERT INTO public.games VALUES (865, 'user_1728286804039', 11);
INSERT INTO public.games VALUES (118, 'user_1728286804038', 12);
INSERT INTO public.games VALUES (246, 'user_1728286804038', 13);
INSERT INTO public.games VALUES (795, 'user_1728286804039', 14);
INSERT INTO public.games VALUES (592, 'user_1728286804039', 15);
INSERT INTO public.games VALUES (211, 'user_1728286804039', 16);
INSERT INTO public.games VALUES (470, 'user_1728286852970', 17);
INSERT INTO public.games VALUES (643, 'user_1728286852970', 18);
INSERT INTO public.games VALUES (333, 'user_1728286852969', 19);
INSERT INTO public.games VALUES (201, 'user_1728286852969', 20);
INSERT INTO public.games VALUES (388, 'user_1728286852970', 21);
INSERT INTO public.games VALUES (305, 'user_1728286852970', 22);
INSERT INTO public.games VALUES (109, 'user_1728286852970', 23);
INSERT INTO public.games VALUES (10, 'd', 24);
INSERT INTO public.games VALUES (760, 'user_1728286917769', 25);
INSERT INTO public.games VALUES (599, 'user_1728286917769', 26);
INSERT INTO public.games VALUES (207, 'user_1728286917768', 27);
INSERT INTO public.games VALUES (664, 'user_1728286917768', 28);
INSERT INTO public.games VALUES (869, 'user_1728286917769', 29);
INSERT INTO public.games VALUES (480, 'user_1728286917769', 30);
INSERT INTO public.games VALUES (508, 'user_1728286917769', 31);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1728286411631');
INSERT INTO public.users VALUES ('user_1728286411630');
INSERT INTO public.users VALUES ('d');
INSERT INTO public.users VALUES ('user_1728286560309');
INSERT INTO public.users VALUES ('user_1728286560308');
INSERT INTO public.users VALUES ('dhruv');
INSERT INTO public.users VALUES ('user_1728286777821');
INSERT INTO public.users VALUES ('user_1728286777820');
INSERT INTO public.users VALUES ('user_1728286804039');
INSERT INTO public.users VALUES ('user_1728286804038');
INSERT INTO public.users VALUES ('user_1728286852970');
INSERT INTO public.users VALUES ('user_1728286852969');
INSERT INTO public.users VALUES ('user_1728286917769');
INSERT INTO public.users VALUES ('user_1728286917768');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 31, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

