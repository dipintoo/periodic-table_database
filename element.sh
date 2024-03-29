# PART 3: Create the script

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Fungsi seleksi input, apakah berupa simbol, nama ataupun nomor unsur kimia
get_column() {
  SYMBOL="$1"
  LENGTH=$(echo -n "$SYMBOL" | wc -m)

  if [[ ! $SYMBOL =~ ^[0-9]+$ && $LENGTH -gt 2 ]]; then
    echo "name"
  else
    if [[ $symbol =~ ^[0-9]+$ ]]; then
      echo "atomic_number"
    else
      echo "symbol"
    fi
  fi
}

# Fungsi untuk mencetak informasi unsur kimia beserta detailnya
print_result() {
  while read -r BAR BAR NUMBER BAR SYMBOL BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE; do
    echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $WEIGHT amu. \
          $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
}

# Fungsi untuk mengambil informasi unsur kimia dari database
get_data() {
  COLUMN="$1"
  SYMBOL="$2"
  DATA=$($PSQL "SELECT * FROM elements \
                INNER JOIN properties USING(atomic_number) INNER JOIN types USING (type_id) \
                WHERE $COLUMN='$SYMBOL'")

  if [[ -z $DATA ]]; then
    echo "I could not find that element in the database."
  else
    echo "$DATA" | print_result
  fi
}


# MENJALANKAN SCRIPT

# Input argumen (bisa berupa simbol, nama ataupun nomor unsur kimia)
SYMBOL=$1

# Jika input kosong, cetak pesan error
if [[ -z $SYMBOL ]]; then
  echo "Please provide an element as an argument."
else
  # Ambil data yang sesuai dengan input dari database
  COLUMN=$(get_column "$SYMBOL")
  get_data "$COLUMN" "$SYMBOL"
fi
