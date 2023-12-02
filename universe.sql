
-- CREATE DB universe
CREATE DATABASE universe;

-- Create tables [galaxy, star, planet, moon, and kevin]

-- Table Galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    distance_from_earth_in_light_years NUMERIC,
    galaxy_type VARCHAR(255) NOT NULL);


--  Table Star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    galaxy_id INT,
    age_in_million INT,
    description TEXT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id));


--  Table Planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    star_id INT,
    distance_in_light_years INT,
    has_life BOOLEAN,
    FOREIGN KEY (star_id) REFERENCES star(star_id));


--  Table Moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    moon_id INT,
    is_spherical BOOLEAN,
    description TEXT,
    FOREIGN KEY (star_id) REFERENCES star(star_id));


--  Table Kevin
CREATE TABLE kevin (
    kevin_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT );


-- Insert Row values



