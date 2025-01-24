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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(6,1),
    distance_from_earth numeric(6,2),
    description text
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_type_id integer NOT NULL,
    galaxy_type character varying(30)
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric(6,1) NOT NULL,
    distance_from_earth numeric(6,2) NOT NULL,
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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    description text,
    age_in_millions_of_years numeric(6,1),
    distance_from_earth numeric(6,2),
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_type_id integer NOT NULL,
    planet_type character varying(30) NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric(6,2),
    age_in_millions_of_years numeric(6,1),
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
-- Name: galaxy_types galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 999.9, 0.00, 'The galaxy containing our solar system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 999.9, 253.70, 'The nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 880.0, 300.00, 'The third-largest galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400.0, 230.00, 'Famous for its spiral structure.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 999.9, 290.00, 'Notable for its bright nucleus and large central bulge.');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 640.0, 170.00, 'A galaxy with a dark band of absorbing dust.');


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 'A small moon of Mars, known for its irregular shape.', 4.5, 56.00, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Another small moon of Mars, smaller and further away than Phobos.', 4.5, 56.50, 1);
INSERT INTO public.moon VALUES (3, 'Europa', 'A moon of Jupiter, known for its ice-covered surface and potential for life.', 4.8, 628.30, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter''s moon, the most volcanically active body in the solar system.', 4.5, 628.20, 2);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon in the solar system, belonging to Jupiter.', 4.5, 628.10, 2);
INSERT INTO public.moon VALUES (6, 'Callisto', 'A heavily cratered moon of Jupiter.', 4.5, 628.40, 2);
INSERT INTO public.moon VALUES (7, 'Titan', 'The largest moon of Saturn, with a thick atmosphere.', 4.6, 1275.00, 3);
INSERT INTO public.moon VALUES (8, 'Rhea', 'A moon of Saturn, composed largely of water ice.', 4.6, 1275.30, 3);
INSERT INTO public.moon VALUES (9, 'Tethys', 'Another moon of Saturn, with a large valley on its surface.', 4.6, 1275.50, 3);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'A moon of Saturn, known for its icy plumes and potential subsurface ocean.', 4.6, 1275.70, 3);
INSERT INTO public.moon VALUES (11, 'Miranda', 'A small and irregular moon of Uranus.', 3.5, 2872.50, 4);
INSERT INTO public.moon VALUES (12, 'Ariel', 'A moon of Uranus, with a young surface and canyons.', 3.5, 2872.70, 4);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'Another moon of Uranus, with a very dark surface.', 3.5, 2873.00, 4);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus.', 3.5, 2873.30, 4);
INSERT INTO public.moon VALUES (15, 'Oberon', 'A moon of Uranus, with a reddish surface.', 3.5, 2873.50, 4);
INSERT INTO public.moon VALUES (16, 'Triton', 'The largest moon of Neptune, known for its retrograde orbit.', 4.0, 4500.00, 5);
INSERT INTO public.moon VALUES (17, 'Nereid', 'A distant moon of Neptune, with a highly elliptical orbit.', 4.0, 4500.30, 5);
INSERT INTO public.moon VALUES (18, 'Proteus', 'A moon of Neptune, known for its irregular shape.', 4.0, 4500.50, 5);
INSERT INTO public.moon VALUES (19, 'Charon', 'The largest moon of Pluto.', 4.2, 5906.40, 6);
INSERT INTO public.moon VALUES (20, 'Styx', 'A small moon of Pluto.', 4.2, 5906.50, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 'The only known planet with life.', 4540.0, 0.00, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 'Known as the Red Planet.', 4500.0, 0.52, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, true, 'The second planet from the Sun.', 4500.0, 0.28, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, true, 'The largest planet in the Solar System.', 4500.0, 4.20, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, true, 'Famous for its prominent ring system.', 4500.0, 8.50, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', false, true, 'The seventh planet from the Sun.', 4500.0, 18.20, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, true, 'The farthest known planet from the Sun.', 4500.0, 29.10, 1);
INSERT INTO public.planet VALUES (8, 'Proxima b', false, true, 'An exoplanet in the habitable zone of Proxima Centauri.', 4300.0, 4.24, 3);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', false, true, 'A potential candidate for habitability.', 2200.0, 620.00, 4);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', false, true, 'An exoplanet that may have conditions for life.', 3000.0, 20.30, 3);
INSERT INTO public.planet VALUES (11, 'HD 209458b', false, true, 'An exoplanet known as a "hot Jupiter."', 2000.0, 150.40, 4);
INSERT INTO public.planet VALUES (12, 'Tau Ceti f', false, true, 'An exoplanet in the Tau Ceti system.', 5000.0, 11.90, 5);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system.', 0.00, 4600.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky.', 8.60, 242.0, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'The closest star system to the Sun.', 4.37, 5500.0, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star nearing the end of its life.', 642.50, 10000.0, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant and the brightest star in Orion.', 863.00, 8700.0, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the constellation Lyra.', 25.05, 455.0, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 1, false);


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
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_types planet_types_planet_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_type_key UNIQUE (planet_type);


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

