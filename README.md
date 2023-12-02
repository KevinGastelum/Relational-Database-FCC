# Relation Database SQL Course by FreeCodeCamp My notes, solutions & files

Relational-Database-fcc

### The following challenges along with my notes used to complete and obtain FreeCodeCamp's Relation Database Certificate consisting of 300+ hours of coursework

## **Challenges**

|                  Challenge                  | Name                                                                |                      Description                      |                     FileName |
| :-----------------------------------------: | :------------------------------------------------------------------ | :---------------------------------------------------: | ---------------------------: |
| [1](#1-celestial-bodies-database-challenge) | [Celestial Bodies Database](#1-celestial-bodies-database-challenge) | Build a database of celestial bodies using PostgreSQL | [universe.sql](universe.sql) |
|                      2                      |                                                                     |                                                       |                              |
|                      3                      |                                                                     |                                                       |                              |
|                      4                      |                                                                     |                                                       |                              |
|                      5                      |                                                                     |                                                       |                              |

---

# 1. Celestial Bodies Database Challenge

## Create Database

```sql
CREATE DATABASE universe;
```

### Database MUST contain at least :

5 Primary keys <br>
3 Foreign keys <br>
1 NUMERIC data type<br>
1 TEXT data type<br>
2 BOOLEAN data types<br>
2 INT data types (NOT Primary Key or Foreign Key)<br>
1 UNIQUE data type per table<br>
2 NOT NULL data types per table<br>

# Creating Table: [galaxy, star, planet, moon, and kevin]

### **t.galaxy** (6 rows , 5 cols)

- galaxy_id - SERIAL PRIMARY KEY
- name - VARCHAR(255) NOT NULL UNIQUE
- description - TEXT
- distance_in_light_years - NUMERIC
- galaxy_type - VARCHAR(255) NOT NULL

```sql
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    distance_from_earth_in_light_years NUMERIC,
    galaxy_type VARCHAR(255) NOT NULL);
```

---

### **t.star** (6r , 5c)

- star_id - SERIAL PRIMARY KEY
- name - VARCHAR(255) NOT NULL UNIQUE
- galaxy_id - INT FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
- age_in_million - INT
- description - TEXT

```sql
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    galaxy_id INT,
    age_in_million INT,
    description TEXT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id));
```

---

### **t.planet** (12r , 5c)

- planet_id - SERIAL PRIMARY KEY
- name - VARCHAR(255) NOT NULL UNIQUE
- star_id - INT FKEY (star_id) REF star(star_id)
- distance_in_light_years - INT
- has_life - BOOLEAN

```sql
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    star_id INT,
    distance_in_light_years INT,
    has_life BOOLEAN,
    FOREIGN KEY (star_id) REFERENCES star(star_id));
```

---

### **t.moon** (20r , 5c)

- moon_id - SERIAL PRIMARY KEY
- name - VARCHAR(255) NOT NULL UNIQUE
- planet_id - INT FKEY (planet_id) REF planet(planet_id)
- is_spherical - BOOLEAN
- description - TEXT

```sql
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    moon_id INT,
    is_spherical BOOLEAN,
    description TEXT,
    FOREIGN KEY (star_id) REFERENCES star(star_id));
```

---

### **t.kevin** (3r , 3c)

- kevin_id - SERIAL PRIMARY KEY
- name - VARCHAR(255) NOT NULL UNIQUE
- description - TEXT

```sql
CREATE TABLE kevin (
    kevin_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT );
```

---

# Inserting Row Values

## Creating the Data model, inserting Row values and establishing Relationship between my Tables

### Galaxy Table (Must contain at least 6 rows)

| id  | Galaxy name             |     description      | distance in light years | Galaxy type |
| :-- | :---------------------- | :------------------: | :---------------------: | ----------: |
| 1   | Milky Way Galaxy        |  contains star Sun   |          26000          |      spiral |
| 2   | Andromeda Galaxy        | contains star Mayall |         2537000         |      spiral |
| 3   | Triangulum Galaxy       |  contains star X-7   |         2730000         |      spiral |
| 4   | Whirlpool Galaxy        | contains star ULS-1  |        23000000         |      spiral |
| 5   | Sombrero Galaxy         |  contains star Sol   |        31000000         |  lenticular |
| 6   | Large Magellanic Galaxy | contains star R136a1 |         163000          |  magellanic |

```sql
INSERT INTO galaxy ( name, description, distance_in_light_years, galaxy_type )
VALUES
( 'Milky Way Galaxy', 'contains star Sun', 26000, 'spiral'),
( 'Andromeda Galaxy', 'contains star Mayall', 2537000, 'spiral'),
( 'Triangulum Galaxy', 'contains star X-7', 2730000, 'spiral'),
( 'Whirlpool Galaxy', 'contains star ULS-1', 23000000 , 'spiral' ),
( 'Sombrero Galaxy', 'contains star Sol', 31000000 , 'lenticular'),
( 'Large Magellanic Galaxy', 'contains star R136a1', 163000 , 'magellanic');
```

---

### Star Table (Must contain at least 6 rows)

| id  | Star name | galaxy_id | age in million |                                         description |
| :-- | :-------- | :-------: | :------------: | --------------------------------------------------: |
| 1   | R136a1    |     6     |       2        |                            contains planet Vortixia |
| 2   | Mayall    |     2     |      3200      |        contains planet Androsia Prima and Celastara |
| 3   | Sun       |     1     |      4600      | contains planet Earth, Jupiter, Saturn, and Neptune |
| 4   | X-7       |     3     |      1500      |    contains planet Triangulum Majoris and Sylphidia |
| 5   | ULS-1     |     4     |      2000      |                      contains planet Ogle and Dogle |
| 6   | Sol       |     5     |      840       |                             contains planet Sombrax |

---

### Planet Table (Must contain at least 12 rows)

| id  | Planet name        | star_id | distance in light years | has life |
| :-- | :----------------- | :-----: | :---------------------: | -------: |
| 1   | Earth              |    3    |            0            |     TRUE |
| 2   | Jupiter            |    3    |            0            |    FALSE |
| 3   | Saturn             |    3    |            0            |    FALSE |
| 4   | Neptune            |    3    |            0            |    FALSE |
| 5   | Ogle               |    5    |          3900           |    FALSE |
| 6   | Dogle              |    5    |          6200           |    FALSE |
| 7   | Androsia Prime     |    2    |          7200           |    FALSE |
| 8   | Celestara          |    2    |          5000           |    FALSE |
| 9   | Triangulum Majoris |    4    |          7300           |    FALSE |
| 10  | Sylphidia          |    4    |          8100           |    FALSE |
| 11  | Sombrax            |    6    |          4500           |    FALSE |
| 12  | Vortixia           |    1    |          5600           |    FALSE |

---

### Moon Table (Must contain at least 20 rows)

| id  | Moon name    | planet_id | is spherical |                    description |
| :-- | :----------- | :-------: | :----------: | -----------------------------: |
| 1   | Luna         |     1     |     TRUE     |        inside Milky Way Galaxy |
| 2   | Europa       |     2     |     TRUE     |        inside Milky Way Galaxy |
| 3   | Ganymede     |     2     |    FALSE     |        inside Milky Way Galaxy |
| 4   | Callisto     |     2     |     TRUE     |        inside Milky Way Galaxy |
| 5   | Lo           |     2     |    FALSE     |        inside Milky Way Galaxy |
| 6   | Titan        |     3     |     TRUE     |        inside Milky Way Galaxy |
| 7   | Mimas        |     3     |    FALSE     |        inside Milky Way Galaxy |
| 8   | Lapetus      |     3     |     TRUE     |        inside Milky Way Galaxy |
| 9   | Triton       |     4     |     TRUE     |        inside Milky Way Galaxy |
| 10  | Nereid       |     4     |    FALSE     |        inside Milky Way Galaxy |
| 11  | Og-Moon 1    |     5     |    FALSE     |        inside Whirlpool Galaxy |
| 12  | Og-Moon 2    |     5     |    FALSE     |        inside Whirlpool Galaxy |
| 13  | Dogle Moon   |     6     |    FALSE     |        inside Whirlpool Galaxy |
| 14  | Prime Moon 1 |     7     |     TRUE     |        inside Andromeda Galaxy |
| 15  | Prime Moon 2 |     7     |     TRUE     |        inside Andromeda Galaxy |
| 16  | Cel Moon     |     8     |    FALSE     |        inside Andromeda Galaxy |
| 17  | Tri-Moon     |     9     |     TRUE     |       inside Triangulum Galaxy |
| 18  | SylyMoon     |    10     |     TRUE     |       inside Triangulum Galaxy |
| 19  | SomLuna      |    11     |     TRUE     |         inside Sombrero Galaxy |
| 20  | Moon Vortex  |    12     |    FALSE     | inside Large Magellanic Galaxy |

---

### Kevin Table (Must contain at least 3 rows)

| id  |   name   | description |
| :-- | :------: | :---------: |
| 1   |  Kevin   |    From     |
| 2   |  Alexis  |   Phoenix   |
| 3   | Gastelum |   Arizona   |

- kevin_id - SERIAL PRIMARY KEY
- name - VARCHAR(255) NOT NULL UNIQUE
- description - TEXT

---
