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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth numeric(4,3),
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth numeric(4,3),
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth numeric(4,3),
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth numeric(4,3),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth numeric(4,3),
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'dhull', 111, 8.333, 'can you go past it!!');
INSERT INTO public.asteroid VALUES (2, 'dhull2', 1011, 7.333, 'may be  you go past it!!');
INSERT INTO public.asteroid VALUES (3, 'dhull3', 10411, 6.333, 'wonder may be  you go past it!!');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1025, NULL, 'our own galaxy', 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 10025, 4.835, 'love this galaxy too!!', 2);
INSERT INTO public.galaxy VALUES ('S maglenic', 100225, 6.835, 'love this too!!', 3);
INSERT INTO public.galaxy VALUES ('l Maglenic', 1002225, 8.835, 'oh my favorite', 4);
INSERT INTO public.galaxy VALUES ('Butterfly', 1000335, 9.835, 'oh its colorful', 5);
INSERT INTO public.galaxy VALUES ('Cigar', 10676, 7.835, 'let me smoke it!!', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1111, 9.999, 'our owmn moon', 3);
INSERT INTO public.moon VALUES (2, 'Moon1', 1111, 9.999, 'Not our moon', 1);
INSERT INTO public.moon VALUES (3, 'Moon2', 1111, 9.999, 'Not our moon', 1);
INSERT INTO public.moon VALUES (4, 'Moon3', 1111, 9.999, 'Not our moon', 2);
INSERT INTO public.moon VALUES (5, 'Moon4', 1111, 9.999, 'Not our moon', 4);
INSERT INTO public.moon VALUES (6, 'Moon5', 1111, 9.999, 'Not our moon', 5);
INSERT INTO public.moon VALUES (7, 'Moon6', 1111, 9.999, 'Not our moon', 5);
INSERT INTO public.moon VALUES (8, 'Moon7', 1111, 9.999, 'Not our moon', 5);
INSERT INTO public.moon VALUES (9, 'Moon8', 1111, 9.999, 'Not our moon', 5);
INSERT INTO public.moon VALUES (10, 'Moon9', 1111, 9.999, 'Not our moon', 5);
INSERT INTO public.moon VALUES (11, 'Moon10', 1111, 9.999, 'Not our moon', 5);
INSERT INTO public.moon VALUES (12, 'Moon11', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (13, 'Moon12', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (14, 'Moon32', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (15, 'Moon14', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (16, 'Moon15', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (17, 'Moon65', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (18, 'Moon17', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (19, 'Moon18', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (20, 'Moo19', 1111, 9.999, 'Not our moon', 6);
INSERT INTO public.moon VALUES (21, 'Moon20', 1111, 9.999, 'Not our moon', 7);
INSERT INTO public.moon VALUES (22, 'Moon21', 1111, 9.999, 'Not our moon', 8);
INSERT INTO public.moon VALUES (23, 'Moon22', 1111, 9.999, 'Not our moon', 8);
INSERT INTO public.moon VALUES (24, 'Moon23', 1111, 9.999, 'Not our moon', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 100, 2.999, 'small hot pot', false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 200, 1.999, 'women born here', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 300, 0.000, 'we are here!!', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 400, 1.000, 'men born here!!', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Ceres', 500, 2.000, 'new planet!!', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 6500, 3.000, 'old planet!!', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 7500, 4.000, 'ring planet', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 8500, 5.000, 'another ring planet', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 98500, 6.000, 'two ring planet', false, true, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 985070, 7.000, 'dwarf planet', false, true, 1);
INSERT INTO public.planet VALUES (11, 'Charon', 9850709, 8.000, 'new guest planet', false, true, 1);
INSERT INTO public.planet VALUES (12, 'xena', 9850709, 8.000, 'new guest planet', false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 999, 8.888, 'very hot!!', 1);
INSERT INTO public.star VALUES (2, 'Lyra', 1000999, 7.888, 'very very hot!!', 2);
INSERT INTO public.star VALUES (3, 'Leo', 1000999, 6.888, 'very very very hot!!', 3);
INSERT INTO public.star VALUES (4, 'andromeda', 1000999, 6.888, 'very very very hot!!', 2);
INSERT INTO public.star VALUES (5, 'grus', 1880999, 9.888, 'very very very very hot!!', 4);
INSERT INTO public.star VALUES (6, 'Orion', 18770999, 4.888, 'very very very very hot hot!!', 5);
INSERT INTO public.star VALUES (7, 'Hydra', 18778809, 6.888, 'very very very very hothoty  hot!!', 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

