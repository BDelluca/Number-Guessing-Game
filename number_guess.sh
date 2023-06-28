#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Get username from usernames
echo "Enter your username:"
read USERNAME

#Search username in database
SEARCH_USERNAME=$($PSQL "SELECT cd_username FROM player WHERE nm_username='$USERNAME'")
#If username not found in database
if [[ -z $SEARCH_USERNAME ]] 
then
INSERT_USERNAME=$($PSQL "INSERT INTO player(nm_username) VALUES('$USERNAME')")
SEARCH_USERNAME=$($PSQL "SELECT cd_username FROM player WHERE nm_username='$USERNAME'")
echo "Welcome, $USERNAME! It looks like this is your first time here."
else
#If username found in database
#Count games played by username
COUNT_GAMES=$($PSQL "SELECT COUNT(cd_username) FROM game WHERE cd_username = $SEARCH_USERNAME")
#Search for best game with fewest tries
BEST_GAME=$($PSQL "SELECT MIN(attempts) FROM game WHERE cd_username = $SEARCH_USERNAME")
#Print welcome user
echo "Welcome back, $USERNAME! You have played $COUNT_GAMES games, and your best game took $BEST_GAME guesses."
fi
#Guess the number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
GUESS=0
ATTEMPTS=0
REGEX_NUMBER="^[0-9]+$"
echo "Guess the secret number between 1 and 1000:"
echo $SECRET_NUMBER
while [ $GUESS -ne $SECRET_NUMBER ]
do
  read GUESS
  if [[ $GUESS =~ $REGEX_NUMBER ]]
  then
    ATTEMPTS=$(( $ATTEMPTS + 1 ))
    if [ $GUESS -gt $SECRET_NUMBER ]
    then
    echo "It's lower than that, guess again:"
    fi
    if [[ $GUESS -lt $SECRET_NUMBER ]]
    then
    echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
    GUESS=0
  fi
done
INSERT_RESULTS=$($PSQL "INSERT INTO game(cd_username, attempts) VALUES($SEARCH_USERNAME, $ATTEMPTS)")
echo "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
