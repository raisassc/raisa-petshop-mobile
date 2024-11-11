# 🌸 Welcome to Raisa Petshop in Mobile App 🌸


## 🐰 Assignment 1 🐰


<details>
<summary></summary>


### 😸 Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.


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


sumber : [https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html, https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html]


</details>


### 😸 Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
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


### 😸 Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
<details>
<summary></summary>


setState() dalam Flutter adalah sebuah metode yang digunakan di dalam objek State dari sebuah StatefulWidget untuk memberi tahu framework Flutter bahwa tampilan widget harus diperbarui. Saat Anda memanggil setState(), Flutter menandai status widget sebagai "kotor" atau "dirty", yang berarti UI perlu diperbarui pada frame berikutnya. Perubahan yang dilakukan pada variabel status (variabel di dalam objek State) hanya akan tercermin di UI setelah setState() dipanggil. Semua variabel yang berada di dalam objek State dari sebuah StatefulWidget dapat terpengaruh oleh setState(). Terutama, variabel-variabel yang menyimpan informasi penting untuk UI, seperti:
- Counter atau variabel numerik lainnya (misalnya untuk menghitung jumlah klik)
- Boolean (untuk mengubah status on/off, tampilan, atau status terpilih/tidak terpilih)
- String (untuk memperbarui teks yang ditampilkan di UI)
- List dan Map (untuk memperbarui daftar item yang ditampilkan di User Interface)
sumber : [https://dev.to/nicks101/when-to-use-setstate-in-flutter-380]
</details>


### 😸 Jelaskan perbedaan antara const dengan final.
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


sumber : [https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart]
</details>


### 😸 Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
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


## 🐰 Assignment 2 🐰


<details>
<summary></summary>


### 😸 Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?


<details>
<summary></summary>


Dalam Flutter, `const` berguna untuk meningkatkan kinerja dan efisiensi memori dengan menandai widget atau nilai sebagai konstan (immutable), sehingga tidak perlu dibangun ulang selama aplikasi berjalan. Ketika sebuah widget atau nilai ditandai dengan `const`, Flutter mengetahui bahwa elemen tersebut tidak akan berubah, sehingga dapat dioptimalkan untuk proses rendering dan manajemen memori. Keuntungan utama menggunakan `const` adalah optimalisasi kinerja, karena widget yang ditandai `const` hanya dibuat satu kali dan di-reuse tanpa harus di-render ulang setiap saat, yang membantu aplikasi berjalan lebih lancar. Selain itu, `const` juga menghemat memori, karena hanya satu instance widget yang disimpan dalam memori. Hal ini mengurangi frekuensi pengumpulan sampah (garbage collection) dan membantu meningkatkan kecepatan aplikasi. Selain kinerja dan efisiensi memori, penggunaan `const` juga membuat kode lebih bersih dan mudah dipahami, karena menunjukkan secara jelas elemen-elemen yang tidak akan berubah. Sebaiknya gunakan `const` untuk widget statis yang tidak akan berubah, seperti `Text` atau `Icon`, serta untuk nilai tetap seperti padding, margin, atau warna yang tidak dinamis. Namun, `const` tidak perlu digunakan pada widget atau nilai yang bisa berubah selama runtime, seperti nilai yang bergantung pada input pengguna atau data eksternal, atau pada widget yang membutuhkan status, seperti `StatefulWidget`. Penggunaan `const` secara bijak bisa membantu aplikasi Flutter menjadi lebih efisien dan responsif, terutama saat ada banyak elemen UI yang bersifat statis.


sumber : [https://medium.com/@pakorn_traipan/final-vs-const-in-dart-choosing-the-right-variable-type-for-your-program-2117c2a3b96b#:~:text=Because%20const%20variables%20are%20known%20at%20compile-time%2C%20they,compiler%20cannot%20optimize%20them%20in%20the%20same%20way.]


</details>


### 😸 Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!


<details>
<summary></summary>
Dalam Flutter, `Row` dan `Column` adalah dua widget dasar yang digunakan untuk menyusun elemen-elemen UI dalam tata letak horizontal atau vertikal. `Row` digunakan untuk menempatkan elemen secara horizontal (dari kiri ke kanan atau sebaliknya), sedangkan `Column` digunakan untuk menempatkan elemen secara vertikal (dari atas ke bawah atau sebaliknya). Keduanya memiliki properti penting seperti `mainAxisAlignment` dan `crossAxisAlignment` yang memungkinkan kita untuk mengatur posisi dan ruang di antara anak-anak widget.


#### 1. Row
`Row` digunakan untuk menempatkan widget anak-anak secara horizontal. Properti `mainAxisAlignment` digunakan untuk mengatur penempatan anak-anak widget sepanjang sumbu utama (horizontal), sedangkan `crossAxisAlignment` mengatur posisi widget anak sepanjang sumbu silang (vertikal).


Contoh penggunaan `Row`:


```dart
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contoh Row"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              child: const Text("Item 1"),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              child: const Text("Item 2"),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.red,
              child: const Text("Item 3"),
            ),
          ],
        ),
      ),
    );
  }
}
```


Pada contoh di atas, kita memiliki tiga `Container` sebagai widget anak dari `Row`. Mereka akan ditempatkan secara horizontal dengan `mainAxisAlignment.spaceAround`, yang memberi ruang di antara setiap anak dan sebelum serta setelah anak pertama dan terakhir.


#### 2. Column
`Column` digunakan untuk menempatkan widget anak-anak secara vertikal. Sama seperti `Row`, `Column` memiliki `mainAxisAlignment` untuk mengatur posisi anak-anak sepanjang sumbu utama (vertikal) dan `crossAxisAlignment` untuk sumbu silang (horizontal).


Contoh penggunaan `Column`:


```dart
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contoh Column"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              child: const Text("Item 1"),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              child: const Text("Item 2"),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.red,
              child: const Text("Item 3"),
            ),
          ],
        ),
      ),
    );
  }
}
```


Dalam contoh `Column` di atas, widget `Container` disusun secara vertikal dengan `mainAxisAlignment.spaceAround`, memberi ruang di antara setiap widget serta di antara widget pertama dan terakhir dengan batas layar.


#### Perbandingan Penggunaan
- **Arah Penataan**: `Row` menyusun elemen secara horizontal, sementara `Column` secara vertikal.
- **mainAxisAlignment**: Pada `Row`, `mainAxisAlignment` digunakan untuk mengatur elemen secara horizontal; pada `Column`, digunakan untuk mengatur elemen secara vertikal.
- **crossAxisAlignment**: Pada `Row`, `crossAxisAlignment` mengatur posisi elemen secara vertikal, sedangkan pada `Column`, mengatur secara horizontal.
 
Kedua widget ini sering digunakan bersama untuk membuat tata letak yang kompleks dalam aplikasi Flutter, dan penggunaannya tergantung pada arah penyusunan elemen yang dibutuhkan dalam desain UI.
sumber : [https://www.geeksforgeeks.org/row-and-column-widgets-in-flutter-with-example/]
</details>


### 😸 Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

<details>
<summary></summary>

Pada tugas kali ini, saya telah menggunakan berbagai elemen input untuk mengumpulkan data dalam form produk, seperti input bertipe String untuk nama produk, flavour, deskripsi, kategori, dan URL gambar;
input bertipe int untuk harga dan jumlah produk; input bertipe double untuk netto; dan input bertipe DateTime untuk memilih tanggal kedaluwarsa produk. Selain itu, terdapat beberapa elemen input lain yang tidak
saya gunakan namun bisa bermanfaat dalam berbagai kasus. Misalnya, **DropdownButtonFormField** yang memungkinkan pengguna memilih satu opsi dari daftar pilihan, cocok untuk memilih kategori produk. **Checkbox** dan **Switch** juga dapat digunakan untuk opsi boolean,
seperti persetujuan atau status aktif/non-aktif produk. **Radio Buttons** berguna untuk memilih satu opsi dari beberapa pilihan, sedangkan **File Picker** memudahkan pengguna mengunggah file, seperti gambar produk, langsung dari perangkat.
Elemen lain seperti **TextField dengan Custom Input Formatter** memungkinkan penerapan format khusus, misalnya untuk memasukkan nomor telepon, dan **DateRangePicker** atau **TimePicker** bisa digunakan untuk memilih rentang tanggal atau waktu.
**Slider** juga bisa dimanfaatkan untuk memilih nilai dalam rentang tertentu, seperti memilih harga diskon. Semua elemen input ini dapat meningkatkan pengalaman pengguna, memberikan lebih banyak pilihan interaksi, dan memenuhi kebutuhan aplikasi
dengan cara yang lebih interaktif dan fungsional.
</details>


### 😸 Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

<details>
<summary></summary>

Dalam aplikasi Flutter yang saya buat, saya telah mengatur tema menggunakan `ThemeData` pada `MaterialApp`, di mana skema warna ditentukan dengan warna biru sebagai warna utama (primary) dan biru gelap (`blue[900]`) sebagai warna sekunder. Penerapan tema ini memberikan konsistensi visual di seluruh aplikasi, terutama terlihat pada elemen-elemen seperti app bar dan tombol, yang menciptakan kesan yang seragam dan mudah dikenali pengguna. Penggunaan warna yang konsisten membantu membangun identitas visual aplikasi dan meningkatkan kenyamanan pengguna.

Meskipun tema ini sudah memberikan dasar yang kuat untuk visual aplikasi, penggunaannya masih relatif terbatas pada penentuan skema warna. Saya belum sepenuhnya memanfaatkan kemampuan `ThemeData` untuk mengatur elemen-elemen visual lainnya, seperti tipografi, gaya tombol khusus, atau widget lain yang dapat disesuaikan. Dengan mengembangkan tema ini lebih lanjut, saya dapat menciptakan gaya visual yang lebih lengkap dan personal untuk aplikasi, seperti menyesuaikan gaya teks default, mengatur border dan elevasi tombol, atau bahkan mendefinisikan tema untuk mode terang dan gelap secara lebih mendetail. Pemanfaatan penuh `ThemeData` akan memungkinkan aplikasi memiliki tampilan yang lebih menyatu dan profesional, serta meningkatkan pengalaman pengguna secara keseluruhan.

</details>

### 😸 Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

<details>
<summary></summary>
Dalam aplikasi Flutter dengan banyak halaman, saya menggunakan metode navigasi seperti `Navigator.push()` dan `Navigator.pushReplacement()` untuk mengatur perpindahan antar halaman dengan efektif. Dengan `Navigator.push()`, saya dapat menambahkan halaman baru ke dalam stack navigasi, memungkinkan pengguna kembali ke halaman sebelumnya, seperti saat membuka halaman detail dari daftar item. Ini cocok digunakan ketika pengguna ingin menelusuri informasi lebih lanjut tetapi tetap memiliki opsi untuk kembali ke layar sebelumnya.

Sebaliknya, saya menggunakan `Navigator.pushReplacement()` untuk mengganti halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack. Metode ini berguna dalam skenario seperti transisi dari halaman login ke halaman beranda setelah proses autentikasi, memastikan pengguna tidak bisa kembali ke layar login.
</details>

</details>











