#!/bin/bash
# Evan Gary freeCodeCamp RDB project
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username:"
read USERNAME

USER_QUERY=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_QUERY ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)")
  USER=$USERNAME
  GAMES_PLAYED=0
  BEST_GAME=9999
else
  IFS="|" read USER GAMES_PLAYED BEST_GAME <<< $USER_QUERY
  echo -e "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUM=$(( $RANDOM % 1000 + 1 ))
GUESS_COUNT=0
# echo $SECRET_NUM
echo "Guess the secret number between 1 and 1000:"
read GUESS
GUESS_COUNT=$(( $GUESS_COUNT + 1 ))

while (( GUESS != SECRET_NUM ))
do
  if ! [[ $GUESS =~ ^\-?[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  elif (( GUESS < SECRET_NUM ))
  then
    echo "It's higher than that, guess again:"
    read GUESS
    GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
  elif (( GUESS > SECRET_NUM ))
  then
    echo "It's lower than that, guess again:"
    read GUESS
    GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
  fi
done

echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUM. Nice job!"
# See if this was the best game and update database if so
if (( GUESS_COUNT < BEST_GAME ))
then
  BEST_GAME=$GUESS_COUNT
  UPDATE_BEST=$($PSQL "UPDATE users SET best_game=$BEST_GAME WHERE username='$USER'")
fi
# Update the database for games played

UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED + 1 WHERE username='$USER'")

  


