![Cover](https://github.com/dipintoo/periodic-table_database/blob/main/img/Coverb_4.jpg)

## Goals  

Kita diberikan database yang berisi tabel periodik unsur kimia. Tugas kita adalah memperbaiki kesalahan yang ada dalam database tersebut terlebih dahulu. Selanjutnya, membuat script bash untuk mendapatkan informasi yang sesuai dengan unsur kimia tertentu dari database berdasarkan input yang diberikan, baik berupa nomor atom, simbol, atau nama elemennya.

## Alur Kerja

### Database
1. Hubungkan perangkat ke [database periodic_table](https://github.com/dipintoo/periodic-table_database/blob/main/command.sql) yang sudah tersedia. Kenali tabel, kolom, dan baris yang ada agar mendapatkan gambaran awal.
2. Ada beberapa kesalahan dalam database yang perlu diperbaiki atau diubah.

   - Menyesuaikan nama kolom, tipe data, dan menerapkan constraint seperti unique, primary key, foreign key.
   - Membuat tabel baru agar database lebih terorganisir, menghapus tabel dan kolom yang tidak dibutuhkan, dan mengupdate data.
  
### [Algoritma Bash Script](https://github.com/dipintoo/periodic-table_database/blob/main/element.sh)
  
1. Memeriksa dulu input yang boleh diterima (nomor atom, simbol, atau nama unsur).

   - Inputnya kosong atau tidak
   - Inputnya berupa angka atau bukan
   - Inputnya berupa nama atau simbol (menghitung jumlah karakter input).

2. Setelah input sesuai, cek database apakah ada data yang berkaitan dengan input yang diberikan.

   - Jika tidak ada, tampilkan pesan bahwa informasi tidak tersedia
   - Jika ada, tampilkan informasi detail yang sesuai dengan unsur kimia tersebut.
  
## Sumber

freeCodeCamp. (2024). Relational Database. Diakses dari https://www.freecodecamp.org/learn/relational-database/build-a-periodic-table-database-project/build-a-periodic-table-database
  
[**_Next Project - Game Tebak Angka >>_**](https://github.com/dipintoo/guessing-game_database)
