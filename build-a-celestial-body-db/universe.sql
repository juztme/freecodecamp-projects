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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    amount_of_stars integer,
    shape text,
    constellation character varying
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
-- Name: inactive_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inactive_galaxy (
    inactive_galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    shape character varying
);


ALTER TABLE public.inactive_galaxy OWNER TO freecodecamp;

--
-- Name: inactive_galaxy_inactive_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inactive_galaxy_inactive_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inactive_galaxy_inactive_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: inactive_galaxy_inactive_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inactive_galaxy_inactive_galaxy_id_seq OWNED BY public.inactive_galaxy.inactive_galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    is_small boolean,
    is_made_of_cheese boolean,
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    highest_temperature_c numeric,
    amount_of_rings integer,
    star_id integer NOT NULL
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
    name character varying NOT NULL,
    is_visible_from_earth boolean,
    galaxy_id integer NOT NULL,
    color character varying
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: inactive_galaxy inactive_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inactive_galaxy ALTER COLUMN inactive_galaxy_id SET DEFAULT nextval('public.inactive_galaxy_inactive_galaxy_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 'Spiral', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 100000000, 'Spiral', 'Virgo');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 200000000, 'Spiral', 'Sagittarius');
INSERT INTO public.galaxy VALUES (4, 'II Zwicky 28', 15400, 'Ring', 'Orion');
INSERT INTO public.galaxy VALUES (5, 'Hoags Object', 22030, 'Ring', 'Serpens Caput');
INSERT INTO public.galaxy VALUES (6, 'NGC 5793', 97383, 'Spiral', 'Libra');


--
-- Data for Name: inactive_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inactive_galaxy VALUES (2, 'NGC 1387', 'Ring');
INSERT INTO public.inactive_galaxy VALUES (1, 'NGC 2787', 'Lenticular');
INSERT INTO public.inactive_galaxy VALUES (3, 'NGC 1460', 'Lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Lilith', false, true, 1);
INSERT INTO public.moon VALUES (3, 'Phobos', true, false, 4);
INSERT INTO public.moon VALUES (4, 'Deimos', true, false, 4);
INSERT INTO public.moon VALUES (5, 'Io', false, false, 5);
INSERT INTO public.moon VALUES (6, 'Europa', false, false, 5);
INSERT INTO public.moon VALUES (7, 'Ganymede', false, false, 5);
INSERT INTO public.moon VALUES (8, 'Callisto', false, false, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', true, false, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', true, false, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', true, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', true, false, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', true, false, 6);
INSERT INTO public.moon VALUES (14, 'Titan', false, true, 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', true, false, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', true, false, 6);
INSERT INTO public.moon VALUES (17, 'Phoebe', true, false, 6);
INSERT INTO public.moon VALUES (18, 'Proteus', true, false, 8);
INSERT INTO public.moon VALUES (19, 'Triton', false, true, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', true, false, 8);
INSERT INTO public.moon VALUES (21, 'Charon', true, true, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 56.7, 0, 3);
INSERT INTO public.planet VALUES (2, 'Mercury', 430, 0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 462, 0, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 21, 0, 5);
INSERT INTO public.planet VALUES (5, 'Jupiter', 725, 1, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 11700, 0, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 4982, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', -201.15, 1, 5);
INSERT INTO public.planet VALUES (9, 'Pluto', -369, 0, 5);
INSERT INTO public.planet VALUES (10, 'Ceres', -368, 0, 5);
INSERT INTO public.planet VALUES (11, 'Haumea', -241, 0, 5);
INSERT INTO public.planet VALUES (12, 'Eris', -217, 0, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', true, 1, 'blue');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', true, 1, 'red');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', true, 1, 'red');
INSERT INTO public.star VALUES (4, 'Epsilon Eridani', true, 1, 'yellow');
INSERT INTO public.star VALUES (5, 'Tau Ceti', true, 1, 'yellow');
INSERT INTO public.star VALUES (6, 'Alpheratz', false, 2, 'blue');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: inactive_galaxy_inactive_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inactive_galaxy_inactive_galaxy_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: inactive_galaxy inactive_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inactive_galaxy
    ADD CONSTRAINT inactive_galaxy_name UNIQUE (name);


--
-- Name: inactive_galaxy inactive_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inactive_galaxy
    ADD CONSTRAINT inactive_galaxy_pkey PRIMARY KEY (inactive_galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


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

