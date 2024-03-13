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
    class character varying(30),
    distance_in_billion_light_years numeric(10,2),
    date_of_discovery character varying(30),
    name character varying(100) NOT NULL
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
    days_of_orbit integer,
    distance_to_planet_in_km integer,
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL
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
    age integer,
    history text,
    is_explored boolean,
    star_id integer NOT NULL,
    name character varying(100) NOT NULL
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
-- Name: planetary_lifeform; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_lifeform (
    planetary_lifeform_id integer NOT NULL,
    asexual boolean,
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.planetary_lifeform OWNER TO freecodecamp;

--
-- Name: planetary_lifeform_planetary_lifeform_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_lifeform_planetary_lifeform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_lifeform_planetary_lifeform_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_lifeform_planetary_lifeform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_lifeform_planetary_lifeform_id_seq OWNED BY public.planetary_lifeform.planetary_lifeform_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    type character varying(30),
    age_in_billion_years numeric(10,2),
    is_clustered boolean,
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planetary_lifeform planetary_lifeform_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_lifeform ALTER COLUMN planetary_lifeform_id SET DEFAULT nextval('public.planetary_lifeform_planetary_lifeform_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'spiral', 0.00, '19/09/1010', 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'elliptical', 2.60, '19/09/4544', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'spiral', 1.30, '12/08/2322', 'M16');
INSERT INTO public.galaxy VALUES (4, 'elliptical', 2.90, '12/18/1212', 'Pinwheel');
INSERT INTO public.galaxy VALUES (5, 'spiral', 3.50, '12/65/4545', 'Sombrero');
INSERT INTO public.galaxy VALUES (6, 'elliptical', 5.60, '23/12/6564', 'Whirlpool');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 55, 300000, 1, 'Mkat');
INSERT INTO public.moon VALUES (2, 21, 30400, 1, 'Jhat');
INSERT INTO public.moon VALUES (3, 35, 600000, 2, 'Krot');
INSERT INTO public.moon VALUES (4, 40, 180000, 3, 'Moon_4');
INSERT INTO public.moon VALUES (5, 70, 450000, 4, 'Moon_5');
INSERT INTO public.moon VALUES (6, 15, 12000, 5, 'Moon_6');
INSERT INTO public.moon VALUES (7, 25, 60000, 6, 'Moon_7');
INSERT INTO public.moon VALUES (8, 33, 300000, 7, 'Moon_8');
INSERT INTO public.moon VALUES (9, 28, 230000, 8, 'Moon_9');
INSERT INTO public.moon VALUES (10, 60, 380000, 9, 'Moon_10');
INSERT INTO public.moon VALUES (11, 42, 240000, 10, 'Moon_11');
INSERT INTO public.moon VALUES (12, 55, 500000, 11, 'Moon_12');
INSERT INTO public.moon VALUES (13, 48, 180000, 12, 'Moon_13');
INSERT INTO public.moon VALUES (14, 20, 80000, 1, 'Moon_14');
INSERT INTO public.moon VALUES (15, 36, 280000, 2, 'Moon_15');
INSERT INTO public.moon VALUES (16, 45, 350000, 3, 'Moon_16');
INSERT INTO public.moon VALUES (17, 30, 200000, 4, 'Moon_17');
INSERT INTO public.moon VALUES (18, 65, 420000, 5, 'Moon_18');
INSERT INTO public.moon VALUES (19, 38, 320000, 6, 'Moon_19');
INSERT INTO public.moon VALUES (20, 23, 150000, 7, 'Moon_20');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 460000, 'The earth is 4.6 billion years old', true, 1, 'Earth');
INSERT INTO public.planet VALUES (2, 43556655, 'It is also in the solar system', true, 1, 'Mars');
INSERT INTO public.planet VALUES (3, 35434345, 'Not in the solar system', false, 2, 'M31');
INSERT INTO public.planet VALUES (4, 654656, 'Not in the solar system', true, 2, 'M54');
INSERT INTO public.planet VALUES (5, 540000, 'It has a thick atmosphere', true, 3, 'Venus');
INSERT INTO public.planet VALUES (6, 4600000, 'Largest planet in the solar system', true, 3, 'Jupiter');
INSERT INTO public.planet VALUES (7, 4200000, 'It has prominent rings', true, 4, 'Saturn');
INSERT INTO public.planet VALUES (8, 3600000, 'It rotates on its side', true, 4, 'Uranus');
INSERT INTO public.planet VALUES (9, 3400000, 'It has strong winds', true, 5, 'Neptune');
INSERT INTO public.planet VALUES (10, 430000, 'Formerly considered a planet', false, 5, 'Pluto');
INSERT INTO public.planet VALUES (11, 4400000, 'Closest planet to the Sun', true, 6, 'Mercury');
INSERT INTO public.planet VALUES (12, 3500000, 'First Earth-sized exoplanet discovered in the habitable zone', true, 6, 'Kepler-186f');


--
-- Data for Name: planetary_lifeform; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_lifeform VALUES (3, true, 1, 'Spyrogira');
INSERT INTO public.planetary_lifeform VALUES (4, true, 3, 'Algae');
INSERT INTO public.planetary_lifeform VALUES (5, true, 3, 'Fungi');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'mega dwarf', 6.00, false, 1, 'Sun');
INSERT INTO public.star VALUES (2, 'mega dwarf', 10.00, false, 2, 'Betelgeuse');
INSERT INTO public.star VALUES (3, 'super giant', 7.60, true, 3, 'Vega');
INSERT INTO public.star VALUES (4, 'Super dwarf', 5.00, false, 4, 'Arcturus');
INSERT INTO public.star VALUES (5, 'mega giant', 12.80, false, 5, 'Rigel');
INSERT INTO public.star VALUES (6, 'mega dwarf', 3.20, false, 2, 'Anteres');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planetary_lifeform_planetary_lifeform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_lifeform_planetary_lifeform_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planetary_lifeform planetary_lifeform_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_lifeform
    ADD CONSTRAINT planetary_lifeform_name_key UNIQUE (name);


--
-- Name: planetary_lifeform planetary_lifeform_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_lifeform
    ADD CONSTRAINT planetary_lifeform_pkey PRIMARY KEY (planetary_lifeform_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
-- Name: planetary_lifeform planetary_lifeform_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_lifeform
    ADD CONSTRAINT planetary_lifeform_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

