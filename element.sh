-- PART 3: Create the script

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

show_argument_error() {
  echo "Please provide an element as an argument."
}

get_column() {
  local SYMBOL="$1"
  local LENGTH=$(echo -n "$SYMBOL" | wc -m)

  if [[ ! $SYMBOL =~ ^[0-9]+$ && $LENGTH -gt 2 ]]; then echo "name"
  else [[ $SYMBOL =~ ^[0-9]+$ ]] && echo "atomic_number" || echo "symbol"
  fi
}

execute_query() {
  local COLUMN="$1"
  local SYMBOL="$2"
  local DATA=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING (type_id) WHERE $COLUMN='$SYMBOL'")

  if [[ -z $DATA ]]; then echo "I could not find that element in the database."
  else
    echo "$DATA" | while read -r BAR BAR NUMBER BAR SYMBOL BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
}

# Main Script
SYMBOL=$1

if [[ -z $SYMBOL ]]; then show_argument_error
else
  COLUMN=$(get_column "$SYMBOL")
  execute_query "$COLUMN" "$SYMBOL"
fi
