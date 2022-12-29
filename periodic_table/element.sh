#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
# Function for when the element could not be found, exits the script
BAD_ELEMENT(){
  echo "I could not find that element in the database."
  exit 1
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit 1
  # If the user entered a number
elif [[ "$1" =~ [0-9]+ ]]
then

  QUERY_RESPONSE=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements NATURAL JOIN properties NATURAL JOIN types WHERE atomic_number=$1")
  read ATOMIC_NUM BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT <<< $QUERY_RESPONSE
  if [[ -z $ATOMIC_NUM ]]
  then
    BAD_ELEMENT
  fi
  # If the user entered a symbol
elif [[ "$1" =~ [A-Z][a-z]?$ ]]
then
  QUERY_RESPONSE=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements NATURAL JOIN properties NATURAL JOIN types WHERE symbol='$1'")
  read ATOMIC_NUM BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT <<< $QUERY_RESPONSE
  if [[ -z $ATOMIC_NUM ]]
  then
    BAD_ELEMENT
  fi
  # If the user entered a name
elif [[ "$1" =~ [A-Z][a-z]* ]]
then
  QUERY_RESPONSE=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements NATURAL JOIN properties NATURAL JOIN types WHERE name='$1'")
  read ATOMIC_NUM BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT <<< $QUERY_RESPONSE
  if [[ -z $ATOMIC_NUM ]]
  then
    BAD_ELEMENT
  fi
else
  BAD_ELEMENT
fi

echo -e "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."



