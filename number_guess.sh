#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read NAME

USER_DETAILS=$($PSQL "SELECT username,games_played,best_game FROM number_guess WHERE username = '$NAME'")

if [[ -z $USER_DETAILS ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO number_guess(username,games_played,best_game) values('$NAME',0,0)")
else
  echo $USER_DETAILS | while IFS=\| read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
RANDOM_NUMBER=$(((RANDOM % 1000) + 1))
#echo $RANDOM_NUMBER
NUMBER_OF_GUESS=0
GUESS_FUNC(){
  echo $1
  read USER_GUESS
  NUMBER_OF_GUESS=$(($NUMBER_OF_GUESS+1))
}

GUESS_FUNC "Guess the secret number between 1 and 1000:"

while true
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_FUNC "That is not an integer, guess again:"
  else
    if [[ $USER_GUESS < $RANDOM_NUMBER ]]
    then
      GUESS_FUNC "It's higher than that, guess again:"
    else
      GUESS_FUNC "It's lower than that, guess again:"
    fi
  fi
  if [[ $USER_GUESS == $RANDOM_NUMBER ]]
  then break
  fi
done
BEST_GAME_TABLE=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$NAME'")
if [[ $NUMBER_OF_GUESS -le $BEST_GAME_TABLE ]] || [[ $BEST_GAME_TABLE == 0 ]]
then
  BEST_GAME=$NUMBER_OF_GUESS
else
  BEST_GAME=$BEST_GAME_TABLE
fi

UPDATE_TABLE=$($PSQL "UPDATE number_guess SET games_played = $(($GAMES_PLAYED + 1)),best_game = $BEST_GAME WHERE username = '$NAME'")
echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
