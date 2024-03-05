-- PART 1: Fix the database

ALTER TABLE properties RENAME weight TO atomic_mass;
ALTER TABLE properties RENAME melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME boiling_point TO boiling_point_celsius;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE elements ADD CONSTRAINT symbol UNIQUE(symbol), ADD CONSTRAINT name UNIQUE(name);
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL, ALTER COLUMN name SET NOT NULL;
ALTER TABLE ONLY properties ADD CONSTRAINT properties_elements_fk FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);
CREATE TABLE types (type_id integer PRIMARY KEY NOT NULL, type character varying(30) NOT NULL);
INSERT INTO types VALUES (1, 'nonmetal');
INSERT INTO types VALUES (2, 'metal');
INSERT INTO types VALUES (3, 'metalloid');
ALTER TABLE properties add column type_id int not null default 1;
ALTER TABLE ONLY properties ADD CONSTRAINT properties_type_id_fkey FOREIGN KEY (type_id) REFERENCES types(type_id);
UPDATE elements SET symbol=INITCAP(LOWER(symbol));
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass = atomic_mass::REAL;
INSERT INTO elements VALUES (9, 'F', 'Fluorine');
INSERT INTO public.elements VALUES (10, 'Ne', 'Neon');
INSERT INTO properties VALUES(9, 'nonmetal', 18.998, -220, -188.1, 2);
INSERT INTO properties VALUES(10, 'nonmetal', 20.18, -248.6, -246.1, 2);
UPDATE properties SET type_id = 1 WHERE atomic_number = 9;
UPDATE properties SET type_id = 1 WHERE atomic_number = 10;
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;
ALTER TABLE properties DROP COLUMN type;

-- PART 2: Create your git repository

  mkdir periodic_table && cd periodic_table && git init && git checkout -b main && touch element.sh && chmod +x element.sh
  
  -- Membuat tabel bernama periodic_table
  mkdir periodic_table
  
  -- Masuk ke dalam folder periodic_table
  cd periodic_table
  
  -- Inisialisasi dan hubungkan dengan main branch dari dalam folder periodic_table
  git init && git checkout -b main
  
  -- Buat file element.sh dalam folder periodic_table lalu berikan akses execute ke element.sh
  touch element.sh && chmod +x element.sh

  -- Version control
  
  git add .
  git commit -m "Initial commit"
  
  git add .
  git commit -m "fix: Add functional programming method to improve understanding and readability"

