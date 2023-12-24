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
      $PSQL "INSERT INTO teams(name) VALUES ('$WINNER')"
      # Retrieve the newly added team_id for the winner
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    fi

    # Retrieve team_id for the opponent
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
    # If opponent team is not in the database, insert it
    if [[ -z $OPPONENT_ID ]]
    then
      # Insert the opponent team into the teams table
      $PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')"
      # Retrieve the newly added team_id for the opponent
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # Insert the game data into the games table
    $PSQL "INSERT INTO games(winner_id, opponent_id, winner_goals, opponent_goals, year, round) VALUES ($WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS, $YEAR, '$ROUND')";
  fi
done