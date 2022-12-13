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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (45, 46, 2018, 'Final', 4, 2, 1);
INSERT INTO public.games VALUES (47, 48, 2018, 'Third Place', 2, 0, 2);
INSERT INTO public.games VALUES (46, 48, 2018, 'Semi-Final', 2, 1, 3);
INSERT INTO public.games VALUES (45, 47, 2018, 'Semi-Final', 1, 0, 4);
INSERT INTO public.games VALUES (46, 49, 2018, 'Quarter-Final', 3, 2, 5);
INSERT INTO public.games VALUES (48, 50, 2018, 'Quarter-Final', 2, 0, 6);
INSERT INTO public.games VALUES (47, 51, 2018, 'Quarter-Final', 2, 1, 7);
INSERT INTO public.games VALUES (45, 52, 2018, 'Quarter-Final', 2, 0, 8);
INSERT INTO public.games VALUES (48, 53, 2018, 'Eighth-Final', 2, 1, 9);
INSERT INTO public.games VALUES (50, 54, 2018, 'Eighth-Final', 1, 0, 10);
INSERT INTO public.games VALUES (47, 55, 2018, 'Eighth-Final', 3, 2, 11);
INSERT INTO public.games VALUES (51, 56, 2018, 'Eighth-Final', 2, 0, 12);
INSERT INTO public.games VALUES (46, 57, 2018, 'Eighth-Final', 2, 1, 13);
INSERT INTO public.games VALUES (49, 58, 2018, 'Eighth-Final', 2, 1, 14);
INSERT INTO public.games VALUES (52, 59, 2018, 'Eighth-Final', 2, 1, 15);
INSERT INTO public.games VALUES (45, 60, 2018, 'Eighth-Final', 4, 3, 16);
INSERT INTO public.games VALUES (61, 60, 2014, 'Final', 1, 0, 17);
INSERT INTO public.games VALUES (62, 51, 2014, 'Third Place', 3, 0, 18);
INSERT INTO public.games VALUES (60, 62, 2014, 'Semi-Final', 1, 0, 19);
INSERT INTO public.games VALUES (61, 51, 2014, 'Semi-Final', 7, 1, 20);
INSERT INTO public.games VALUES (62, 63, 2014, 'Quarter-Final', 1, 0, 21);
INSERT INTO public.games VALUES (60, 47, 2014, 'Quarter-Final', 1, 0, 22);
INSERT INTO public.games VALUES (51, 53, 2014, 'Quarter-Final', 2, 1, 23);
INSERT INTO public.games VALUES (61, 45, 2014, 'Quarter-Final', 1, 0, 24);
INSERT INTO public.games VALUES (51, 64, 2014, 'Eighth-Final', 2, 1, 25);
INSERT INTO public.games VALUES (53, 52, 2014, 'Eighth-Final', 2, 0, 26);
INSERT INTO public.games VALUES (45, 65, 2014, 'Eighth-Final', 2, 0, 27);
INSERT INTO public.games VALUES (61, 66, 2014, 'Eighth-Final', 2, 1, 28);
INSERT INTO public.games VALUES (62, 56, 2014, 'Eighth-Final', 2, 1, 29);
INSERT INTO public.games VALUES (63, 67, 2014, 'Eighth-Final', 2, 1, 30);
INSERT INTO public.games VALUES (60, 54, 2014, 'Eighth-Final', 1, 0, 31);
INSERT INTO public.games VALUES (47, 68, 2014, 'Eighth-Final', 2, 1, 32);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (45, 'France');
INSERT INTO public.teams VALUES (46, 'Croatia');
INSERT INTO public.teams VALUES (47, 'Belgium');
INSERT INTO public.teams VALUES (48, 'England');
INSERT INTO public.teams VALUES (49, 'Russia');
INSERT INTO public.teams VALUES (50, 'Sweden');
INSERT INTO public.teams VALUES (51, 'Brazil');
INSERT INTO public.teams VALUES (52, 'Uruguay');
INSERT INTO public.teams VALUES (53, 'Colombia');
INSERT INTO public.teams VALUES (54, 'Switzerland');
INSERT INTO public.teams VALUES (55, 'Japan');
INSERT INTO public.teams VALUES (56, 'Mexico');
INSERT INTO public.teams VALUES (57, 'Denmark');
INSERT INTO public.teams VALUES (58, 'Spain');
INSERT INTO public.teams VALUES (59, 'Portugal');
INSERT INTO public.teams VALUES (60, 'Argentina');
INSERT INTO public.teams VALUES (61, 'Germany');
INSERT INTO public.teams VALUES (62, 'Netherlands');
INSERT INTO public.teams VALUES (63, 'Costa Rica');
INSERT INTO public.teams VALUES (64, 'Chile');
INSERT INTO public.teams VALUES (65, 'Nigeria');
INSERT INTO public.teams VALUES (66, 'Algeria');
INSERT INTO public.teams VALUES (67, 'Greece');
INSERT INTO public.teams VALUES (68, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 68, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


