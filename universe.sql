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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    discovered_by character varying(100),
    discovered_date date,
    is_potentially_hazardous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: ateroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ateroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ateroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: ateroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ateroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text NOT NULL,
    size integer NOT NULL,
    num_of_stars integer,
    has_black_hole boolean NOT NULL,
    num_of_planets integer
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    has_water boolean NOT NULL,
    orbital_period numeric(4,1)
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    distance_from_star numeric(3,1) NOT NULL,
    has_life boolean NOT NULL,
    num_of_moons integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    num_of_planets integer,
    mass numeric(3,1) NOT NULL
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

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.ateroid_asteroid_id_seq'::regclass);


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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Dwarf Planet', 'Giuseppe Piazzi', '1801-01-01', false);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Asteroid', 'Heinrich Olbers', '1802-03-28', false);
INSERT INTO public.asteroid VALUES (3, 'Juno', 'Asteroid', 'Karl Harding', '1804-09-01', false);
INSERT INTO public.asteroid VALUES (4, 'Vesta', 'Asteroid', 'Heinrich Olbers', '1807-03-29', false);
INSERT INTO public.asteroid VALUES (5, 'Astraea', 'Asteroid', 'Karl Hencke', '1845-12-08', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 250000000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, 100000, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, 40000, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 14000, 300000, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 7000, 3000000, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 76000, 10000, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, false, 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, false, 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, false, 1.3);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, false, 1.8);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, true, 3.5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, false, 7.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, false, 16.7);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, 16.0);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 763, false, 4.5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 734, false, 79.0);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561, false, 2.7);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 533, false, 1.9);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 252, true, 1.4);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 236, false, 1.4);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 579, false, 2.5);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 584, false, 4.1);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 788, false, 8.7);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 761, false, 13.5);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1353, true, 5.9);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 170, false, 360.1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.4, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.7, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.0, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.5, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 5.2, false, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 9.6, false, 82);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 19.2, false, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 30.1, false, 14);
INSERT INTO public.planet VALUES (9, 'Proxima b', 6, 0.1, false, 0);
INSERT INTO public.planet VALUES (10, 'Alpha Cen Bb', 2, 0.0, false, 0);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 3, 0.1, false, 0);
INSERT INTO public.planet VALUES (12, 'Sirius b', 4, 0.1, false, 0);
INSERT INTO public.planet VALUES (13, 'Vega b', 7, 0.1, false, 0);
INSERT INTO public.planet VALUES (14, 'Canopus b', 8, 0.1, false, 0);
INSERT INTO public.planet VALUES (15, 'Arcturus b', 9, 0.2, false, 0);
INSERT INTO public.planet VALUES (16, 'Aldebaran b', 10, 0.2, false, 0);
INSERT INTO public.planet VALUES (17, 'Capella b', 11, 0.0, false, 0);
INSERT INTO public.planet VALUES (18, 'Capella c', 11, 0.1, false, 0);
INSERT INTO public.planet VALUES (19, 'Spica b', 12, 0.0, false, 0);
INSERT INTO public.planet VALUES (20, 'Spica c', 12, 0.1, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 8, 1.0);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, true, 3, 1.1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, false, 0, 20.0);
INSERT INTO public.star VALUES (4, 'Sirius', 1, true, 1, 2.0);
INSERT INTO public.star VALUES (5, 'Rigel', 1, false, 0, 18.0);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, true, 1, 0.1);
INSERT INTO public.star VALUES (7, 'Vega', 2, true, 2, 2.1);
INSERT INTO public.star VALUES (8, 'Canopus', 2, false, 0, 8.0);
INSERT INTO public.star VALUES (9, 'Arcturus', 3, true, 1, 1.5);
INSERT INTO public.star VALUES (10, 'Aldebaran', 3, false, 0, 1.7);
INSERT INTO public.star VALUES (11, 'Capella', 4, true, 2, 2.5);
INSERT INTO public.star VALUES (12, 'Spica', 5, false, 0, 10.2);


--
-- Name: ateroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ateroid_asteroid_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: asteroid ateroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT ateroid_name_key UNIQUE (name);


--
-- Name: asteroid ateroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT ateroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

