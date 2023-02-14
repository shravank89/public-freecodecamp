#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
  #Insert into teams table: name from winner and opponent column
  #winner column
    INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams name, $WINNER
    else
      echo Duplicate entry, can not be added
    fi
  #opponent column
    INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams name, $OPPONENT
    else
      echo Duplicate entry, can not be added
    fi
  #getting winner_id and opponent_id from teams table by team_id column
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

  #inserting data into games table
  INSERT_NAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,opponent_goals,winner_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$OPPONENT_GOALS,$WINNER_GOALS)")
    if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, $WINNER
    else
      echo Duplicate entry, can not be added
    fi

  fi
done


