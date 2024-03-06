![Cover]()

## Goals  

Membuat script bash untuk mendapatkan informasi detail yang sesuai dengan unsur kimia tertentu dari database periodik unsur, berdasarkan input yang kita berikan, baik berupa nomor atom, simbol, dan nama elemennya. Database sudah tersedia dan tugas kita adalah memperbaiki kesalahan yang ada dalam database tersebut.

## Alur Kerja

### Memperbaiki Database

1. Hubungkan perangkat ke database periodic_table yang sudah tersedia. Kenali tabel, kolom, dan baris yang ada agar mendapatkan gambaran awal.
2. Ada beberapa kesalahan dalam database yang perlu diperbaiki atau diubah.

   - Menyesuaikan nama kolom, tipe data, dan menerapkan constraint seperti unique, primary key, foreign key.
   - Membuat tabel baru agar database lebih terorganisir, menghapus tabel dan kolom yang tidak dibutuhkan, dan mengupdate data.
  
### Algoritma Bash Script
  
1. Memeriksa dulu input yang boleh diterima (nomor atom, simbol, atau nama unsur).

   - Inputnya kosong atau tidak
   - Inputnya berupa angka atau bukan
   - Inputnya berupa nama atau simbol (bisa menghitung jumlah karakter input).

2. Setelah input sesuai, cek database apakah ada data yang berkaitan dengan input yang diberikan.

   - Jika tidak ada, tampilkan pesan bahwa informasi tidak tersedia
   - Jika ada, tampilkan informasi detail yang sesuai dengan unsur kimia tersebut.
