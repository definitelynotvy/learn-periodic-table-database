#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



if [[ $1 ]]
then
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    # echo "Argument is a number."
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number = $1;")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      SYMBOL=$($PSQL "select symbol from elements where atomic_number = $1;")
      NAME=$($PSQL "select name from elements where atomic_number = $1;")
      TYPE_ID=$($PSQL "select type_id from properties where atomic_number = $1;")
      TYPE=$($PSQL "select type from types where type_id = $TYPE_ID;")
      ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number = $1;")
      MELTING_POINT_CELSIUS=$($PSQL "select melting_point_celsius from properties where atomic_number = $1;")
      BOILING_POINT_CELSIUS=$($PSQL "select boiling_point_celsius from properties where atomic_number = $1;")
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    fi
  elif [[ "$1" =~ ^[a-zA-Z]{1,2}$ ]]; then
    # echo "Argument is a 2-character string." symbob
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol = '$1';")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      # SYMBOL=$($PSQL "select symbol from elements where atomic_number = $1;")
      NAME=$($PSQL "select name from elements where atomic_number = $ATOMIC_NUMBER;")
      # TYPE=$($PSQL "select type from properties where atomic_number = $ATOMIC_NUMBER;")
      TYPE_ID=$($PSQL "select type_id from properties where atomic_number = $ATOMIC_NUMBER;")
      TYPE=$($PSQL "select type from types where type_id = $TYPE_ID;")
      ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number = $ATOMIC_NUMBER;")
      MELTING_POINT_CELSIUS=$($PSQL "select melting_point_celsius from properties where atomic_number = $ATOMIC_NUMBER;")
      BOILING_POINT_CELSIUS=$($PSQL "select boiling_point_celsius from properties where atomic_number = $ATOMIC_NUMBER;")
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($1). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    fi
  elif [[ "$1" =~ ^[a-zA-Z]{3,}$ ]]; then
    # echo "Argument is a 40-character string." name
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name = '$1';")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      SYMBOL=$($PSQL "select symbol from elements where atomic_number = $ATOMIC_NUMBER;")
      # NAME=$($PSQL "select name from elements where atomic_number = $ATOMIC_NUMBER;")
      # TYPE=$($PSQL "select type from properties where atomic_number = $ATOMIC_NUMBER;")
      TYPE_ID=$($PSQL "select type_id from properties where atomic_number = $ATOMIC_NUMBER;")
      TYPE=$($PSQL "select type from types where type_id = $TYPE_ID;")
      ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number = $ATOMIC_NUMBER;")
      MELTING_POINT_CELSIUS=$($PSQL "select melting_point_celsius from properties where atomic_number = $ATOMIC_NUMBER;")
      BOILING_POINT_CELSIUS=$($PSQL "select boiling_point_celsius from properties where atomic_number = $ATOMIC_NUMBER;")
      echo "The element with atomic number $ATOMIC_NUMBER is $1 ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $1 has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    fi
  else
    echo "I could not find that element in the database."
  fi
else
  echo "Please provide an element as an argument."
fi




