# [Relational Database SQL Course by FreeCodeCamp](https://www.freecodecamp.org/learn/relational-database/)

### My solution and notes used to complete and obtain FreeCodeCamp's Relational Database Certificate consisting of 300+ hours of coursework

## **Challenges**

|                  Challenge                  | Name                                                                |                                                           Description                                                            |                                                                                 FileName |
| :-----------------------------------------: | :------------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------------: | ---------------------------------------------------------------------------------------: |
| [1](#1-celestial-bodies-database-challenge) | [Celestial Bodies Database](#1-celestial-bodies-database-challenge) |                                      Build a database of celestial bodies using PostgreSQL                                       |                                                             [universe.sql](universe.sql) |
|    [2](#2-world-cup-database-challenge)     | [World Cup Database](#2-world-cup-database-challenge)               | Create a Bash script that enters information from World Cup games into PostgreSQL, then query the database for useful statistics | [worldcup.sql](worldcup.sql), [insert_data.sh](insert_data.sh), [queries.sh](queries.sh) |
|                    [3]()                    | [Salon Appt Scheduler]()                                            |          Create an interactive Bash program that uses PostgreSQL to track the customers and appointments for your salon          |                                             [salon.sql](salon.sql), [salon.sh](salon.sh) |
|                    [4]()                    | [Periodic Table Database]()                                         |                  Create Bash a script to get information about chemical elements from a periodic table database                  |                       [periodic_table.sql](periodic_table.sql), [element.sh](element.sh) |
|                    [5]()                    | [Number Guessing Game]()                                            |  Use Bash scripting, PostgreSQL, and Git to create a number guessing game that runs in the terminal and saves user information   |                 [number_guess.sql](number_guess.sql), [number_guess.sh](number_guess.sh) |

---

# 1. Celestial Bodies Database Challenge

## Create Database

```sql
CREATE DATABASE universe;
```

### Database MUST contain at least :

5 Tables [galaxy, star, planet, moon, kevin (5th table can be any name)] <br>
5 Primary keys <br>
3 Foreign keys <br>
1 NUMERIC data type<br>
1 TEXT data type<br>
2 BOOLEAN data types<br>
2 INT data types (NOT Primary Key or Foreign Key)<br>
1 UNIQUE data type per table<br>
2 NOT NULL data types per table<br>

## Creating Table: [galaxy, star, planet, moon, and kevin]

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
    planet_id INT,
    is_spherical BOOLEAN,
    description TEXT,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id));
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

| id  | Star name | galaxy_id | age in million |                                     description |
| :-- | :-------- | :-------: | :------------: | ----------------------------------------------: |
| 1   | R136a1    |     6     |       2        |                            near planet Vortixia |
| 2   | Mayall    |     2     |      3200      |        near planet Androsia Prima and Celastara |
| 3   | Sun       |     1     |      4600      | near planet Earth, Jupiter, Saturn, and Neptune |
| 4   | X-7       |     3     |      1500      |    near planet Triangulum Majoris and Sylphidia |
| 5   | ULS-1     |     4     |      2000      |                      near planet Ogle and Dogle |
| 6   | Sol       |     5     |      840       |                             near planet Sombrax |

```sql
INSERT INTO star ( name, galaxy_id, age_in_million, description )
VALUES
( 'R136a1', 6, 2, 'near planet Vortixia' ),
( 'Mayall', 2, 3200, 'near planet Androsia Prima and Celastara' ),
( 'Sun', 1, 4600, 'near planet Earth, Jupiter, Saturn, and Neptune' ),
( 'X-7', 3, 1500, 'near planet Triangulum Majoris and Sylphidia' ),
( 'ULS-1', 4, 2000, 'near planet Ogle and Dogle' ),
( 'Sol', 5, 840, 'near planet Sombrax' );
```

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

```sql
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
```

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

```sql
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
```

---

### Kevin Table (Must contain at least 3 rows)

| id  |   name   | description |
| :-- | :------: | :---------: |
| 1   |  Kevin   |    From     |
| 2   |  Alexis  |   Arizona   |
| 3   | Gastelum |     USA     |

```sql
INSERT INTO kevin ( name, description )
VALUES
( 'Kevin', 'From' ),
( 'Alexis', 'Arizona' ),
( 'Gastelum', 'USA' );
```

---

# 2. World Cup Database Challenge

In order to complete this challenge we need to pull and store data from the World Cup games of 2014 and 2018 inside an SQL database (currently in a csv file 'games.csv'). <br>
**First** we need to create a database compatible with our games.csv, which has the following structure:

| year |    round    | winner  | opponent | winner_goals | opponent_goals |
| :--- | :---------: | :-----: | :------: | :----------: | :------------: |
| 2018 |    Final    | France  | Croatia  |      4       |       2        |
| 2018 | Third Place | Belgium | England  |      2       |       0        |
| 2018 | Semi-Final  | Croatia | England  |      2       |       1        |

**Second** we need to create a bash script to automize fetching and storing our data into the **"worldcup"** database.

**Lastly** we need to update the queries.sh file provided in this projects directory in order to outout the correct answers as listed in the "expected_output.sh" file

### Database MUST contain :

**teams** Table - teams needs columns [team_id and name]<br>
**games** Table - games needs columns [game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals]<br>
2 Primary keys <br>
2 Foreign keys <br>
All columns should have NOT NULL constraint<br>
**teams** Table should contain 24 rows after running bash script to pull our data into our DB<br>
**games** table should contain 32 rows after runnning bash script to pull our data into our DB<br>
Make sure each row and column contains a value and correct team ids are assigned to games table <br>

<!--
t.teams needs columns team_id(Serial PKEY), name(UNIQUE), <br>
t.games needs columns game_id(Serial PKEY), year(INT), round(VARCHAR), winner_id(FKEY Ref team_id), opponent_id(FKEY Ref team_id), winner_goals(INT), oponnent_goals(INT) <br>
-->

## Step 1 Create Database

```sql
CREATE DATABASE worldcup;
```

## Create Tables teams and games

### Table teams

- team_id - SERIAL PRIMARY KEY
- name - NOT NULL UNIQUE

```sql
-- Table Teams
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE );
```

### Table games

- game_id - SERIAL PRIMARY KEY
- year - INT NOT NULL
- round - VARCHAR(255) NOT NULL
- winner_id - INT NOT NULL FKey REF teams(team_id)
- oppponent_id - INT NOT NULL FKey REF teams(team_id)
- winner_goals - INT NOT NULL
- opponent_goals - INT NOT NULL

```sql
-- Table Games
CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR(255) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
    FOREIGN KEY (winner_id) REFERENCES teams(team_id),
    FOREIGN KEY (opponent_id) REFERENCES teams(team_id));
```

---

## Step 2 Automize fetching and storing data with our bash script

```bash
#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# MY CODE BEGINS HERE: Read from games.csv and split each line by commas
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip the header line
  if [[ $YEAR != "year" ]]
  then
    # Retrieve team_id for the winner
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    # If winner team is not in the database, insert it
    if [[ -z $WINNER_ID ]]
    then
      # Insert the winner team into the teams table
      $($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
      # Retrieve the newly added team_id for the winner
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    fi

    # Retrieve team_id for the opponent
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
    # If opponent team is not in the database, insert it
    if [[ -z $OPPONENT_ID ]]
    then
      # Insert the opponent team into the teams table
      $($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
      # Retrieve the newly added team_id for the opponent
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # Insert the game data into the games table
    $($PSQL "INSERT INTO games(winner_id, opponent_id, winner_goals, opponent_goals, year, round) VALUES ($WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS, $YEAR, '$ROUND')");
  fi
done


cat games.csv | while IFS="," read  YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

```

---

## Query Database

Run queries.sh to make sure our outputs are correct
