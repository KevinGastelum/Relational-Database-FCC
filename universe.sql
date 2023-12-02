
-- CREATE DB universe
CREATE DATABASE universe;

-- CREATE TABLES [galaxy, star, planet, moon, and kevin]

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


-- INSERT ROW VALUES

-- Into table Galaxy
INSERT INTO galaxy ( name, description, distance_in_light_years, galaxy_type )
VALUES
( 'Milky Way Galaxy', 'contains star Sun', 26000, 'spiral'),
( 'Andromeda Galaxy', 'contains star Mayall', 2537000, 'spiral'),
( 'Triangulum Galaxy', 'contains star X-7', 2730000, 'spiral'),
( 'Whirlpool Galaxy', 'contains star ULS-1', 23000000 , 'spiral' ),
( 'Sombrero Galaxy', 'contains star Sol', 31000000 , 'lenticular'),
( 'Large Magellanic Galaxy', 'contains star R136a1', 163000 , 'magellanic');


-- Into table Star
INSERT INTO star ( name, galaxy_id, age_in_million, description )
VALUES
( 'R136a1', 6, 2, 'near planet Vortixia' ),
( 'Mayall', 2, 3200, 'near planet Androsia Prima and Celastara' ),
( 'Sun', 1, 4600, 'near planet Earth, Jupiter, Saturn, and Neptune' ),
( 'X-7', 3, 1500, 'near planet Triangulum Majoris and Sylphidia' ),
( 'ULS-1', 4, 2000, 'near planet Ogle and Dogle' ),
( 'Sol', 5, 840, 'near planet Sombrax' );


-- Into table Planet
INSERT INTO planet ( name, star_id, distance_in_light_years, has_life )
VALUES
('Earth', 3, 0, TRUE),
('Jupiter', 3, 0, FALSE),
('Saturn', 3, 0, FALSE),
('Neptune', 3, 0, FALSE),
('Ogle', 5, 3900, FALSE),
('Dogle', 5, 6200, FALSE),
('Androsia Prime', 2, 7200, FALSE),
('Celestara', 2, 5000, FALSE),
('Triangulum Majoris', 4, 7300, FALSE),
('Sylphidia', 4, 8100, FALSE),
('Sombrax', 6, 4500, FALSE),
('Vortixia', 1, 5600, FALSE);


-- Into table Moon
INSERT INTO moon ( name, planet_id, is_spherical, description )
VALUES
('Luna', 1, TRUE, 'inside Milky Way Galaxy'),
('Europa', 2, TRUE, 'inside Milky Way Galaxy'),
('Ganymede', 2, FALSE, 'inside Milky Way Galaxy'),
('Callisto', 2, TRUE, 'inside Milky Way Galaxy'),
('Lo', 2, FALSE, 'inside Milky Way Galaxy'),
('Titan', 3, TRUE, 'inside Milky Way Galaxy'),
('Mimas', 3, FALSE, 'inside Milky Way Galaxy'),
('Lapetus', 3, TRUE, 'inside Milky Way Galaxy'),
('Triton', 4, TRUE, 'inside Milky Way Galaxy'),
('Nereid', 4, FALSE, 'inside Milky Way Galaxy'),
('Og-Moon 1', 5, FALSE, 'inside Whirlpool Galaxy'),
('Og-Moon 2', 5, FALSE, 'inside Whirlpool Galaxy'),
('Dogle Moon', 6, FALSE, 'inside Whirlpool Galaxy'),
('Prime Moon 1', 7, TRUE, 'inside Andromeda Galaxy'),
('Prime Moon 2', 7, TRUE, 'inside Andromeda Galaxy'),
('Cel Moon', 8, FALSE, 'inside Andromeda Galaxy'),
('Tri-Moon', 9, TRUE, 'inside Triangulum Galaxy'),
('SylyMoon', 10, TRUE, 'inside Triangulum Galaxy'),
('SomLuna', 11, TRUE, 'inside Sombrero Galaxy'),
('Moon Vortex', 12, FALSE, 'inside Large Magellanic Galaxy');


-- Into table Kevin
INSERT INTO kevin ( name, description )
VALUES
( 'Kevin', 'From' ),
( 'Alexis', 'Arizona' ),
( 'Gastelum', 'USA' );