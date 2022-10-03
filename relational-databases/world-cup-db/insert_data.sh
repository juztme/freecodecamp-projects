#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

# insert teams
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # get winner team_id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    #if winner team isn't found in the db
    if [[ -z $WINNER_TEAM_ID ]]
    then
      # insert winner team name
      INSERT_WINNER_TEAM_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      if [[ $INSERT_WINNER_TEAM_NAME_RESULT == "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $WINNER
      fi

      # get new team id
      WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # get opponent team_id
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    #if winner team isn't found in the db
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      # insert winner team name
      INSERT_OPPONENT_TEAM_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      if [[ $INSERT_OPPONENT_TEAM_NAME_RESULT == "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $OPPONENT
      fi

      # get new team id
      OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # get game id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_TEAM_ID'")

    #if game isn't found in the db
    if [[ -z $GAME_ID ]]
    then
      # insert game
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_TEAM_ID', '$OPPONENT_TEAM_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")

      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted game $YEAR $ROUND with $WINNER as winner
      fi 
    fi
  fi
done

