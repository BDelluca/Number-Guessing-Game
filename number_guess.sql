--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    cd_game integer NOT NULL,
    attempts integer,
    cd_username integer
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_cd_game_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_cd_game_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_cd_game_seq OWNER TO freecodecamp;

--
-- Name: game_cd_game_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_cd_game_seq OWNED BY public.game.cd_game;


--
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    nm_username character varying(22),
    cd_username integer NOT NULL
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Name: player_cd_username_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_cd_username_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_cd_username_seq OWNER TO freecodecamp;

--
-- Name: player_cd_username_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_cd_username_seq OWNED BY public.player.cd_username;


--
-- Name: game cd_game; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN cd_game SET DEFAULT nextval('public.game_cd_game_seq'::regclass);


--
-- Name: player cd_username; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player ALTER COLUMN cd_username SET DEFAULT nextval('public.player_cd_username_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (70, 2, 25);
INSERT INTO public.game VALUES (71, 1, 25);
INSERT INTO public.game VALUES (72, 4, 26);
INSERT INTO public.game VALUES (73, 250, 27);
INSERT INTO public.game VALUES (74, 948, 27);
INSERT INTO public.game VALUES (75, 281, 28);
INSERT INTO public.game VALUES (76, 965, 28);
INSERT INTO public.game VALUES (77, 922, 27);
INSERT INTO public.game VALUES (78, 508, 27);
INSERT INTO public.game VALUES (79, 811, 27);
INSERT INTO public.game VALUES (80, 699, 29);
INSERT INTO public.game VALUES (81, 238, 29);
INSERT INTO public.game VALUES (82, 62, 30);
INSERT INTO public.game VALUES (83, 848, 30);
INSERT INTO public.game VALUES (84, 509, 29);
INSERT INTO public.game VALUES (85, 592, 29);
INSERT INTO public.game VALUES (86, 745, 29);
INSERT INTO public.game VALUES (87, 872, 31);
INSERT INTO public.game VALUES (88, 923, 31);
INSERT INTO public.game VALUES (89, 988, 32);
INSERT INTO public.game VALUES (90, 500, 32);
INSERT INTO public.game VALUES (91, 427, 31);
INSERT INTO public.game VALUES (92, 457, 31);
INSERT INTO public.game VALUES (93, 499, 31);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES ('a', 25);
INSERT INTO public.player VALUES ('b', 26);
INSERT INTO public.player VALUES ('user_1687978543987', 27);
INSERT INTO public.player VALUES ('user_1687978543986', 28);
INSERT INTO public.player VALUES ('user_1687978568255', 29);
INSERT INTO public.player VALUES ('user_1687978568254', 30);
INSERT INTO public.player VALUES ('user_1687978588412', 31);
INSERT INTO public.player VALUES ('user_1687978588411', 32);


--
-- Name: game_cd_game_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_cd_game_seq', 93, true);


--
-- Name: player_cd_username_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_cd_username_seq', 32, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (cd_game);


--
-- Name: player player_nm_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_nm_username_key UNIQUE (nm_username);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (cd_username);


--
-- Name: game game_cd_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_cd_username_fkey FOREIGN KEY (cd_username) REFERENCES public.player(cd_username);


--
-- PostgreSQL database dump complete
--

