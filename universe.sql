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
    type character varying(40),
    stars double precision,
    diameter integer
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
    name character varying(20) NOT NULL,
    diameter numeric,
    atmosphere boolean,
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
-- Name: npo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.npo (
    npo_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer
);


ALTER TABLE public.npo OWNER TO freecodecamp;

--
-- Name: non_planetary_object_npo_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.non_planetary_object_npo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.non_planetary_object_npo_id_seq OWNER TO freecodecamp;

--
-- Name: non_planetary_object_npo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.non_planetary_object_npo_id_seq OWNED BY public.npo.npo_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    comp text,
    diameter integer,
    star_id integer,
    life boolean NOT NULL
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
    name character varying(30),
    type character varying,
    solar_mass double precision,
    distance double precision NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: npo npo_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.npo ALTER COLUMN npo_id SET DEFAULT nextval('public.non_planetary_object_npo_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral galaxy', 400, 200000);
INSERT INTO public.galaxy VALUES (2, 'Barnards Galaxy', 'barred spiral galaxy', 0.01, 3500);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'spiral galaxy', 1000, 220000);
INSERT INTO public.galaxy VALUES (4, 'Messier 32', 'compact eliptical galaxy', 0.4, 1000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'spiral galaxy', 40, 60000);
INSERT INTO public.galaxy VALUES (6, 'NGC 3109', 'Magellanic type irregular galaxy', 0.1, 41700);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3474, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, false, 4);
INSERT INTO public.moon VALUES (4, 'Metis', 43, false, 5);
INSERT INTO public.moon VALUES (5, 'Adrastea', 20, false, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 270, false, 5);
INSERT INTO public.moon VALUES (7, 'Thebe', 99, false, 5);
INSERT INTO public.moon VALUES (8, 'Io', 3643, true, 5);
INSERT INTO public.moon VALUES (9, 'Europa', 3121, true, 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 5268, false, 5);
INSERT INTO public.moon VALUES (11, 'Callisto', 4820, true, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 5149, true, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 1060, false, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 1122, false, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 1527, false, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', 139, false, 6);
INSERT INTO public.moon VALUES (17, 'Enceladus', 500, false, 6);
INSERT INTO public.moon VALUES (18, 'Hyperion', 270, false, 6);
INSERT INTO public.moon VALUES (19, 'Titania', 1578, false, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 1522, false, 7);


--
-- Data for Name: npo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.npo VALUES (1, 'Pluto', 1);
INSERT INTO public.npo VALUES (2, 'Ceres', 1);
INSERT INTO public.npo VALUES (3, 'Haileys Comet', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'rocky', 4880, 1, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'rocky', 12756, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'rocky', 6779, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gaseous', 139820, 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'rocky', 12104, 1, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gaseous', 116460, 1, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', 50724, 1, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', 55528, 1, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'rocky', 5990, 2, false);
INSERT INTO public.planet VALUES (12, 'Barnards Star b', 'rocky', 17407, 4, false);
INSERT INTO public.planet VALUES (10, 'Proxima c', 'rocky', 0, 2, false);
INSERT INTO public.planet VALUES (11, 'Proxima d', 'rocky', 0, 2, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'yellow-dwarf', 1, 0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'red-dwarf', 0.123, 4.1246, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'triple star system', 2.121, 4.37, 1);
INSERT INTO public.star VALUES (4, 'Barnards Star', 'red-dwarf', 0.16, 5.96, 1);
INSERT INTO public.star VALUES (5, 'Wolf 359', 'red-dwarf', 0.1, 7.78, 1);
INSERT INTO public.star VALUES (6, 'Lalande 21185', 'red-dwarf', 0.46, 8.3, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: non_planetary_object_npo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.non_planetary_object_npo_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: npo non_planetary_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.npo
    ADD CONSTRAINT non_planetary_object_pkey PRIMARY KEY (npo_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: npo unique_name_npo; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.npo
    ADD CONSTRAINT unique_name_npo UNIQUE (name);


--
-- Name: planet unq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unq_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

