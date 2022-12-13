#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $YEAR != "year" ]]
  then
  #GET winner's team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    #IF id does not exist add it
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    
      if [[ $INSERT_WINNER_TEAM == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi

      #Get new winner id
       WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi

  #GET loser's team id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    #IF id does not exist add it
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    
      if [[ $INSERT_OPPONENT_TEAM == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi

      #Get new opponent ID
       OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    fi

    #Insert game
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WGOALS, $OGOALS);")
    echo Inserted into games, $YEAR $ROUND $WINNER $OPPONENT





  fi



done
