#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USERNAME_RESULT=$($PSQL "select * from users where username='$USERNAME';")

if [[ -z $USERNAME_RESULT ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_USER_TO_DB=$($PSQL "insert into users(username) values('$USERNAME')")

else
  USER_GAMES=$($PSQL "select count(*) as TOTAL_GAMES, min(tries) as BEST from games where username='$USERNAME'")
  echo $USER_GAMES | while IFS="|" read TOTAL_GAMES BEST
  do
    echo "Welcome back, $USERNAME! You have played $TOTAL_GAMES games, and your best game took $BEST guesses."
  done
fi

TOTAL_GUESS=0

RANDOM_NUMBER=$((RANDOM % 1000 + 1))

# Function to read and validate the guess
READ_NUMBER() {
  read GUESS_NUMBER
  ((TOTAL_GUESS++))

  while [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS_NUMBER
    ((TOTAL_GUESS++))
  done
}

echo "Guess the secret number between 1 and 1000:"
READ_NUMBER

# Loop until the correct number is guessed
while (( RANDOM_NUMBER != GUESS_NUMBER ))
do
  if (( RANDOM_NUMBER < GUESS_NUMBER ))
  then
    echo "It's lower than that, guess again:"
    READ_NUMBER
  elif (( RANDOM_NUMBER > GUESS_NUMBER ))
  then
    echo "It's higher than that, guess again:"
    READ_NUMBER
  fi
done

# Insert game data in db
INSERT_GAME_DATA=$($PSQL "insert into games(username,tries) values('$USERNAME',$TOTAL_GUESS)")

# Output
echo "You guessed it in $TOTAL_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"