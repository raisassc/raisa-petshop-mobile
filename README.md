# 🌸 Welcome to Raisa Petshop in Mobile App 🌸

## 🐰 Assignment 1 🐰

<details>
<summary></summary>

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

<details>
<summary></summary>

Stateless widget adalah widget dalam Flutter yang tidak memiliki state (keadaan) yang dapat berubah. Widget ini mendeskripsikan bagian dari antarmuka pengguna dengan cara membangun struktur widget lain yang menggambarkan antarmuka tersebut secara lebih konkret. Proses ini dilakukan secara rekursif hingga antarmuka pengguna benar-benar terbentuk. Stateless widget sangat berguna ketika antarmuka yang ditampilkan tidak tergantung pada kondisi yang berubah-ubah, tetapi hanya bergantung pada informasi konfigurasi yang ada pada widget itu sendiri dan konteks tempat widget tersebut digunakan (dalam bentuk `BuildContext`). Contohnya, jika suatu tampilan statis hanya bergantung pada informasi yang diberikan saat pembuatan objek, maka `StatelessWidget` adalah pilihan yang tepat.

Stateful widget adalah widget dalam Flutter yang memiliki state (keadaan) yang dapat berubah selama widget tersebut digunakan. Informasi yang tersimpan dalam state dapat dibaca secara sinkron saat widget dibangun dan mungkin akan berubah seiring waktu atau berdasarkan kejadian tertentu. Tanggung jawab implementasi widget adalah untuk memastikan bahwa objek `State` diberi tahu secara cepat saat state mengalami perubahan, menggunakan metode `setState`. Stateful widget juga membangun struktur widget lain secara rekursif, tetapi berbeda dengan stateless widget, struktur ini bisa berubah secara dinamis sesuai perubahan state. Ini membuat `StatefulWidget` cocok untuk antarmuka yang mungkin berubah-ubah, seperti jam atau komponen yang bergantung pada data sistem atau input pengguna.

Perbedaan utama pada statefull dan stateless widget terletak pada : 
1. Mutable State vs Immutable State:
   - Stateless widget tidak memiliki state yang dapat berubah setelah dibuat, sedangkan stateful widget memiliki state yang bisa diubah sepanjang siklus hidup widget.

2. Penggunaan State:
   - Pada stateless widget, antarmuka hanya bergantung pada konfigurasi awal dan `BuildContext`. Pada stateful widget, antarmuka dapat berubah berdasarkan state yang tersimpan dalam objek `State`.

3. Pembuatan State:
   - Pada stateful widget, objek `State` dibuat menggunakan metode `createState`. Jika stateful widget dihapus dari pohon dan kemudian dimasukkan kembali, `createState` akan dipanggil ulang untuk membuat objek `State` baru.
   - Stateful widget yang memiliki `GlobalKey` akan mempertahankan `State` meskipun dipindahkan dari satu lokasi ke lokasi lain dalam pohon widget.

4. Lifecycle:
   - Stateless widget memiliki siklus hidup yang lebih sederhana karena tidak memiliki state yang harus dikelola.
   - Stateful widget memiliki siklus hidup yang lebih kompleks karena mengelola state yang dapat berubah, serta memungkinkan penggunaan `GlobalKey` untuk mempertahankan `State` dalam situasi tertentu.

</details>

### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
<details>
<summary></summary>
1. MaterialApp
    MaterialApp adalah widget yang membungkus aplikasi dan menyediakan banyak konfigurasi seperti tema aplikasi, home widget, dan title aplikasi. Widget ini juga menyediakan tampilan Material Design untuk aplikasi.
2. ThemeData
    ThemeData digunakan untuk mendefinisikan tema aplikasi, termasuk skema warna dan pengaturan tema material. Pada kode ini, tema menggunakan warna utama Colors.amber dan warna sekunder Colors.amber[50].
3. Scaffold
    Scaffold adalah struktur dasar dari halaman di Flutter, yang menyediakan elemen standar seperti AppBar, Body, Drawer, dan lain-lain. Di sini, Scaffold digunakan untuk membuat kerangka halaman utama aplikasi.
4. AppBar
    AppBar adalah widget baris atas (baris judul) dari aplikasi. Dalam proyek ini, AppBar menampilkan judul “Raisa Pet Shop” dengan latar belakang biru tua (Colors.blue[900]).
5. GridView.count
    GridView.count adalah widget yang menampilkan elemen dalam bentuk grid. Di sini, digunakan untuk menampilkan beberapa item dalam tampilan grid dengan 3 kolom, jarak antar-elemen yang bisa disesuaikan, dan padding.
6. InkWell
    InkWell adalah widget yang menambahkan efek "tinta" (ink ripple effect) saat suatu elemen diklik. Dalam proyek ini, InkWell melingkupi setiap ItemCard sehingga setiap kali pengguna mengklik sebuah item, ada efek visual yang menunjukkan bahwa elemen telah diklik.
7. SnackBar
    SnackBar adalah widget yang menampilkan notifikasi sementara di bagian bawah layar. SnackBar digunakan untuk menampilkan pesan konfirmasi bahwa pengguna telah menekan sebuah tombol item.
8. Container
    Container adalah widget yang fleksibel yang digunakan untuk mengatur tata letak, warna, padding, margin, dan ukuran dari elemen yang dibungkusnya. Dalam ItemCard, Container digunakan untuk memberikan padding dan tata letak pada item.
9. Column
    Column adalah widget yang menampilkan elemen anaknya dalam tata letak vertikal (kolom). Di sini, Column digunakan dalam ItemCard untuk menampilkan ikon dan teks dalam susunan vertikal.
10. Icon
    Icon adalah widget untuk menampilkan ikon dari pustaka ikon bawaan Flutter. Di ItemCard, ikon digunakan untuk memberikan identifikasi visual pada setiap item seperti “Lihat Daftar Produk,” “Tambah Produk,” dan “Logout.”
11. Text
    Text adalah widget untuk menampilkan teks. Dalam kode ini, Text digunakan di berbagai tempat untuk menampilkan judul aplikasi, nama item, judul kartu informasi, dan isi kartu informasi.
12. Card
    Card adalah widget Material Design yang memiliki elevation (ketinggian) dan border radius yang dapat disesuaikan. Di sini, Card digunakan dalam InfoCard untuk menampilkan informasi dengan gaya kartu.
13. MediaQuery
    MediaQuery menyediakan informasi tentang ukuran dan orientasi layar perangkat. Di InfoCard, MediaQuery digunakan untuk menentukan lebar kartu berdasarkan lebar layar perangkat.
</details>

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
<details>
<summary></summary>
setState() dalam Flutter adalah sebuah metode yang digunakan di dalam objek State dari sebuah StatefulWidget untuk memberi tahu framework Flutter bahwa tampilan widget harus diperbarui. Saat Anda memanggil setState(), Flutter menandai status widget sebagai "kotor" atau "dirty", yang berarti UI perlu diperbarui pada frame berikutnya. Perubahan yang dilakukan pada variabel status (variabel di dalam objek State) hanya akan tercermin di UI setelah setState() dipanggil. Semua variabel yang berada di dalam objek State dari sebuah StatefulWidget dapat terpengaruh oleh setState(). Terutama, variabel-variabel yang menyimpan informasi penting untuk UI, seperti:
- Counter atau variabel numerik lainnya (misalnya untuk menghitung jumlah klik)
- Boolean (untuk mengubah status on/off, tampilan, atau status terpilih/tidak terpilih)
- String (untuk memperbarui teks yang ditampilkan di UI)
- List dan Map (untuk memperbarui daftar item yang ditampilkan di UI)
</details>

### Jelaskan perbedaan antara const dengan final.
<details>
<summary></summary>
Secara garis besar, perbedaan antara variabel const dan final terletak pada : 
1. Waktu Penetapan Nilai
    final: Nilai final ditetapkan hanya sekali dan bisa diberikan nilai saat runtime. Ini berarti bahwa nilai final dapat ditentukan berdasarkan perhitungan atau hasil yang hanya tersedia saat program berjalan, seperti hasil dari operasi atau fungsi.
    const: Nilai const ditetapkan pada waktu compile-time, jadi harus diketahui sebelumnya. Ini hanya bisa digunakan dengan nilai yang benar-benar konstan yang tidak akan berubah, seperti angka tetap atau string, dan tidak bisa berasal dari operasi yang dijalankan saat runtime.
2. Kedalaman Immutabilitas
    final: Hanya variabel atau objek yang ditandai dengan final yang tidak dapat diubah. Namun, jika variabel final adalah koleksi atau objek kompleks, isi dalam koleksi tersebut masih bisa diubah, kecuali elemen-elemen di dalamnya juga ditandai dengan final atau const.
    const: Objek atau koleksi yang ditandai const bersifat deeply immutable atau transitively immutable. Artinya, seluruh struktur data di dalamnya, termasuk semua elemen, juga harus const dan tidak bisa diubah sama sekali.
3. Penggunaan di dalam Kelas
    final: Bisa dideklarasikan sebagai field instance di kelas tanpa harus bersifat static. Setiap objek kelas akan memiliki nilai final-nya sendiri.
    const: Dalam konteks kelas, const harus digunakan bersama dengan static, yaitu static const, karena const harus sudah diinisialisasi saat compile-time dan tidak bisa terkait dengan instance kelas.
4. Canonization atau Penggabungan Objek Const
    const: Objek const di-Dart adalah canonicalized, artinya jika Anda membuat objek const dengan nilai yang sama, Dart akan menggunakan satu objek yang sama untuk menghemat memori.
    final: Objek final tidak bersifat canonicalized. Jika dua variabel final memiliki nilai yang sama, Dart tetap akan membuat dua objek terpisah.
</details>

###  Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
<details>
<summary></summary>
Saya memulai pembuatan proyek Flutter baru bernama `petshop_mobile` dengan perintah `flutter create petshop_mobile` dan kemudian masuk ke dalam direktori proyek yang baru terbentuk. Secara otomatis, struktur proyek dasar terbentuk, termasuk file `main.dart` yang berfungsi sebagai entry point. Langkah selanjutnya adalah membuat file baru bernama `menu.dart` untuk memisahkan tampilan utama aplikasi sehingga `main.dart` bisa tetap ringkas dan berfungsi hanya sebagai entry point. Karena aplikasi ini memerlukan interaksi dinamis, saya mengubah `StatelessWidget` menjadi `StatefulWidget`, yang memungkinkan penggunaan fungsi `setState()` untuk memperbarui UI secara real-time saat tombol ditekan. Untuk menjaga kerapian struktur, saya memindahkan kode utama dari `main.dart` (mulai dari baris ke-39 hingga akhir) ke dalam `menu.dart`, sehingga bagian tampilan aplikasi berada dalam file terpisah.

Di `menu.dart`, saya membuat kelas bernama `ItemHomepage` dengan atribut `name`, `icon`, dan `color`. Atribut-atribut ini memungkinkan saya untuk mengatur nama, ikon, dan warna setiap tombol yang akan ditampilkan di halaman utama. Selanjutnya, saya membuat object ItemHomepage pada MyHomepage(). Setiap tombol diatur agar memiliki ikon, warna, dan teks yang berbeda, sesuai data yang diberikan. Untuk menambah interaksi, pada setiap tombol, saya menambahkan `SnackBar` yang akan muncul saat tombol ditekan dan menampilkan pesan, seperti “Kamu telah menekan tombol {nama}!”. Saya menggunakan `ScaffoldMessenger` untuk memunculkan `SnackBar` ini. Kode ini mengatur tampilan tombol sebagai berikut:

```dart
return Material(
  color: item.color, // Warna dari item
  borderRadius: BorderRadius.circular(12),
  child: InkWell(
    onTap: () {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
        );
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(item.icon, color: Colors.white),
        Text(item.name, style: TextStyle(color: Colors.white)),
      ],
    ),
  ),
);
```

Setelah menyiapkan `menu.dart`, langkah terakhir adalah mengintegrasikan `MenuPage` ini dengan `main.dart` agar dapat menjadi tampilan utama saat aplikasi dijalankan. Saya melakukan ini dengan memanggil `MyHomePage()` sebagai nilai `home` di `MaterialApp` pada `main.dart`. Dengan langkah-langkah ini, saya berhasil membuat tiga tombol dengan variasi warna dan ikon, serta menampilkan `SnackBar` dengan pesan yang dinamis setiap kali salah satu tombol ditekan.
</details>

</details>




