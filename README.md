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

## 🐰 Assignment 3 🐰

### 😸 Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

<details>
<summary></summary>

JSON adalah format yang menyimpan informasi terstruktur serta banyak digunakan sebagai alternatif yang lebih sederhana dan ringan dari XML (Extensive Markup Language).

Format XML kini sudah cukup jarang digunakan karena sulit dikonversi menjadi objek JavaScript. Butuh ribuan baris kode dan banyak kustomisasi berdasarkan elemen tertentu yang perlu diuraikan (parse).

Sebagai perbandingan, parser JSON hanya membutuhkan satu baris kode untuk mengubah teks menjadi JavaScript karena syntax keduanya sangat mirip.

JSON menggunakan parsing sisi server untuk meningkatkan responsivitas. Prosesnya tidak memerlukan informasi awal tentang objek parsing, sehingga JSON kini banyak digunakan sebagai format standar pertukaran data.

User juga bisa meminta data dari berbagai domain dengan memanfaatkan metode yang disebut ‘JSON padding’ (JSONP), yang menggunakan fungsi callback untuk mengirimkan data JSON. Hasilnya, batasan  same-origin policy pun tidak lagi menjadi halangan.

Membuat model untuk pengambilan atau pengiriman data JSON sangat penting karena membantu memastikan validitas dan keamanan data yang diterima atau dikirimkan. Model digunakan untuk memvalidasi bahwa data JSON memiliki struktur dan tipe data yang sesuai, sehingga mencegah kesalahan akibat data yang tidak valid atau hilang. Selain itu, penggunaan model juga memastikan konsistensi dalam pengelolaan data, memudahkan pemeliharaan kode, dan memungkinkan transformasi data secara efisien antara format JSON dan objek yang digunakan dalam aplikasi. Tanpa model, risiko kesalahan menjadi lebih tinggi, terutama dalam kasus data yang tidak sesuai atau sulit ditangani, yang dapat mengakibatkan error pada parsing, debugging yang rumit, atau ketidakkonsistenan data dalam sistem yang lebih besar.  
JSON kini menjadi format standar dalam pertukaran data karena kelebihannya dibandingkan XML. JSON memiliki sintaks yang lebih sederhana, ukuran yang lebih kecil, dan kemampuan untuk langsung dikonversi menjadi objek JavaScript menggunakan satu baris kode, seperti `JSON.parse()`. Berbeda dengan XML yang membutuhkan parser lebih kompleks, JSON menawarkan kecepatan parsing yang lebih baik dan mendukung fitur JSONP untuk pengambilan data lintas domain, membuatnya ideal untuk aplikasi modern. Dengan model yang baik, pengembang dapat memanfaatkan kelebihan JSON sepenuhnya dan meminimalkan potensi kesalahan.
sumber : [https://www.hostinger.co.id/tutorial/apa-itu-json]

</details>

### 😸 Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

<details>
<summary></summary>
Library HTTP yang digunakan dalam tugas ini berfungsi sebagai alat untuk memfasilitasi komunikasi antara klien dan server menggunakan protokol HTTP, yang merupakan standar utama dalam pertukaran data di internet. Dengan library ini, pengembang dapat mengirimkan permintaan HTTP seperti **GET** untuk mengambil data, **POST** untuk mengirimkan data, atau **PUT** dan **DELETE** untuk mengedit atau menghapus data di server. Selain itu, library ini juga membantu memproses respons dari server, seperti membaca data yang dikembalikan dalam format JSON atau format lainnya, sehingga mempermudah integrasi antara aplikasi klien dengan layanan berbasis API. Library HTTP mengotomatisasi banyak proses teknis, seperti pembentukan header permintaan, pengelolaan koneksi, dan interpretasi respons, sehingga pengembang tidak perlu menangani detail komunikasi secara manual.

Protokol HTTP sendiri adalah sistem komunikasi lapisan aplikasi yang memungkinkan transfer data seperti teks, gambar, video, dan file lainnya antara klien dan server. HTTP menggunakan mekanisme permintaan dan respons, di mana klien mengirimkan permintaan (request) ke server melalui URL atau alamat domain, dan server merespons dengan data yang diminta. Proses ini stateless, artinya server tidak menyimpan informasi tentang koneksi yang sudah selesai, sehingga setiap permintaan bersifat independen. Protokol HTTP juga menyediakan aturan tentang bagaimana data dikodekan, dikirim, dan diterima, memastikan pertukaran informasi dapat dilakukan dengan cara yang konsisten dan dapat diandalkan.

Dengan menggunakan library HTTP, pengembang dapat memanfaatkan protokol ini secara lebih efisien, baik untuk mengambil data dari server maupun untuk mengirim data ke server. Misalnya, dalam tugas ini, library HTTP digunakan untuk menangani pengambilan atau pengiriman data dalam format JSON, yang banyak digunakan sebagai standar pertukaran data karena sifatnya yang ringan dan mudah dipahami. Library ini tidak hanya mempercepat pengembangan tetapi juga mengurangi risiko kesalahan karena mengelola banyak detail komunikasi secara otomatis. Hasilnya, aplikasi dapat berfungsi dengan baik dalam berkomunikasi dengan server, mendukung pengalaman pengguna yang responsif dan efisien.
sumber : [https://it.telkomuniversity.ac.id/protokol-http-kenali-pengertian-serta-fungsinya-dalam-internet/

]
</details>

### 😸 Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

<details>
<summary></summary>
**Fungsi CookieRequest dalam Aplikasi Flutter:**

`CookieRequest` dalam konteks aplikasi Flutter digunakan untuk menangani dan mengelola cookie yang diterima dari server dalam proses komunikasi HTTP. Cookie sendiri adalah informasi yang dikirim oleh server dan disimpan pada perangkat pengguna, yang kemudian dapat digunakan kembali pada kunjungan berikutnya. Fungsi utama dari `CookieRequest` adalah untuk mengakses, menyimpan, dan mengirim cookie dalam setiap permintaan HTTP yang dilakukan oleh aplikasi. Dengan menggunakan `CookieRequest`, aplikasi dapat mengelola sesi pengguna, memastikan bahwa pengguna tetap login atau memiliki preferensi yang sama pada sesi berikutnya tanpa harus mengulang proses login atau pengaturan.

**Mengapa Instance CookieRequest Perlu Dibagikan ke Semua Komponen Aplikasi:**

Di aplikasi Flutter, instance `CookieRequest` perlu dibagikan ke semua komponen aplikasi untuk memastikan konsistensi dalam pengelolaan informasi sesi dan pengaturan pengguna di seluruh aplikasi. Cookie sering digunakan untuk menyimpan data penting seperti informasi login, pengaturan pribadi, atau preferensi pengguna. Jika `CookieRequest` hanya tersedia di bagian tertentu dari aplikasi, maka aplikasi akan kehilangan informasi ini saat berpindah layar atau melakukan permintaan API, yang dapat mengganggu pengalaman pengguna. Dengan membagikan instance `CookieRequest` ke seluruh komponen, aplikasi memastikan bahwa setiap permintaan HTTP, baik itu permintaan login, pengaturan, atau permintaan data lainnya, dapat menggunakan cookie yang tepat untuk memberikan pengalaman pengguna yang mulus dan konsisten.

Dengan demikian, `CookieRequest` sangat penting untuk menjaga keberlanjutan sesi pengguna dan personalisasi aplikasi, memungkinkan pengembang untuk mengelola preferensi pengguna secara efektif dan menyajikan konten yang relevan sesuai dengan kebiasaan dan pengaturan mereka.
sumber : [https://dasarpemrogramangolang.novalagung.com/B-cookie.html]

</details>

### 😸 Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

<details>
<summary></summary>

Untuk mengirimkan data dari input hingga ditampilkan dalam aplikasi Flutter, umumnya data akan melalui beberapa tahap dari pengumpulan hingga tampilan antarmuka pengguna. Berikut adalah mekanisme pengiriman data tersebut:

#### 1. **Input Data**
   Data dapat dimasukkan melalui berbagai jenis widget input di Flutter, seperti:
   - **TextField**: Untuk memasukkan teks.
   - **DropdownButton**: Untuk memilih dari pilihan yang ada.
   - **Checkbox** atau **Radio**: Untuk memilih nilai biner.
   
   Misalnya, menggunakan `TextField` untuk input teks:
   ```dart
   TextEditingController _controller = TextEditingController();
   TextField(
     controller: _controller,
     decoration: InputDecoration(labelText: 'Masukkan data'),
   );
   ```

#### 2. **Menyimpan Data**
   Setelah data dimasukkan, data tersebut akan disimpan dalam sebuah variabel atau objek. Biasanya, data akan disimpan dalam `TextEditingController` untuk teks atau variabel sederhana untuk data lainnya.

   Misalnya, untuk mendapatkan teks yang dimasukkan pada `TextField`:
   ```dart
   String inputData = _controller.text;
   ```

#### 3. **Pengolahan Data (Opsional)**
   Jika diperlukan, data yang dimasukkan dapat diproses terlebih dahulu sebelum dikirim atau ditampilkan. Misalnya, validasi input atau konversi data.

   Contoh validasi:
   ```dart
   if (inputData.isEmpty) {
     // Menampilkan pesan kesalahan
     print("Input tidak boleh kosong");
   }
   ```

#### 4. **Pengiriman Data**
   Data yang sudah diproses atau disimpan bisa dikirim ke backend atau disimpan dalam state aplikasi. 
   - **State Management**: Flutter menggunakan berbagai metode manajemen status seperti `Provider`, `Riverpod`, `Bloc`, atau `setState` untuk memperbarui tampilan berdasarkan data.
   
   Misalnya menggunakan `setState` untuk memperbarui tampilan:
   ```dart
   setState(() {
     // Mengubah data yang ditampilkan
     _displayData = inputData;
   });
   ```

   Jika data dikirim ke server (misalnya menggunakan `http`), bisa dilakukan dengan:
   ```dart
   final response = await http.post(
     Uri.parse('https://api.example.com/data'),
     body: {'data': inputData},
   );
   ```
</details>

### 😸 Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

<details>
<summary></summary>

Mekanisme autentikasi dari proses login, register, hingga logout antara aplikasi Flutter dan backend Django melibatkan beberapa langkah penting. Berikut adalah penjelasan lengkapnya:

1. Register (Pendaftaran Akun)
#### Input Data di Flutter: Pengguna memasukkan data akun seperti nama, email, dan kata sandi di halaman pendaftaran Flutter.
#### Pengiriman Data ke Backend Django:
Flutter mengirim data input pengguna dalam bentuk permintaan HTTP (biasanya POST) ke endpoint API yang dibuat di Django untuk proses pendaftaran, seperti /auth/register/.
Data dikirim dalam format JSON, dan Flutter menggunakan library seperti http atau dio untuk membuat permintaan ini.
#### Proses di Django:
Django menerima permintaan di endpoint yang telah dibuat pada views.py.
Data diverifikasi (misalnya, memastikan bahwa email tidak duplikat dan kata sandi memenuhi kriteria keamanan).
Django membuat entitas pengguna baru di database, mengenkripsi kata sandi menggunakan hashing bawaan Django (misalnya make_password()).
Jika pendaftaran berhasil, Django mengembalikan respons sukses (biasanya dengan status kode 201 dan pesan JSON).
#### Tanggapan ke Flutter:
Flutter menerima respons sukses dan dapat menampilkan notifikasi bahwa pendaftaran telah berhasil. Jika gagal maka flutter akan mengirimkan snackbar untuk menginformasikan bahwa register gagal
2. Login (Masuk)
#### Input Data di Flutter: Pengguna memasukkan email dan kata sandi di halaman login Flutter.
#### Pengiriman Data ke Backend Django:
Flutter mengirim data ini ke endpoint API login Django (misalnya /auth/login/) dalam bentuk permintaan HTTP POST.
#### Proses Autentikasi di Django:
Django memeriksa data input terhadap entri di database dengan metode seperti authenticate() untuk memvalidasi email dan kata sandi.
Jika validasi berhasil, Django membuat sesi pengguna atau token autentikasi (jika menggunakan autentikasi berbasis token/JWT).
Token ini dapat dikembalikan ke Flutter untuk disimpan sementara, biasanya di SharedPreferences untuk penyimpanan lokal.
#### Tanggapan ke Flutter:
Jika login berhasil, Django mengembalikan token autentikasi atau respons sesi dengan status kode 200.
Flutter menyimpan token ini dan menggunakannya untuk autentikasi permintaan selanjutnya (header Authorization).
3. Menampilkan Menu Utama di Flutter
#### Penggunaan Token untuk Autentikasi:
Token yang diperoleh selama login digunakan Flutter untuk memuat data dan mengakses halaman yang memerlukan otorisasi.
Flutter mengirimkan permintaan API dengan token ini di header (Authorization: Bearer <token>) ke endpoint Django untuk memvalidasi apakah pengguna berhak mengakses konten.
#### Verifikasi di Django:
Django memeriksa validitas token di middleware atau fungsi khusus yang memverifikasi keaslian token.
Jika valid, Django mengembalikan data yang diminta, dan Flutter menampilkan menu utama atau konten terkait.
#### Menampilkan Menu di Flutter:
Flutter memproses data dari Django dan menampilkan menu utama yang sesuai dengan otorisasi pengguna.
4. Logout (Keluar)
#### Aksi Logout di Flutter:
Pengguna menekan tombol logout di aplikasi Flutter.
Pengiriman Permintaan ke Backend Django:
Flutter mengirim permintaan logout ke endpoint API seperti /api/logout/, umumnya dengan metode POST.
Token atau sesi dapat dikirimkan agar Django dapat mengidentifikasi pengguna yang ingin logout.
#### Proses Logout di Django:
Django menghapus sesi pengguna dari server atau mengatur token agar tidak valid lagi (misalnya, menghapus token di database atau menambahkan token ke blacklist).
Django mengembalikan respons sukses, seperti status kode 204 (tanpa konten).
#### Tanggapan ke Flutter:
Flutter menerima respons sukses dan menghapus token autentikasi dari penyimpanan lokal (SharedPreferences), memastikan pengguna tidak lagi diidentifikasi sebagai pengguna yang sudah login. Kemuadian, Aplikasi Flutter diarahkan ke halaman login

</details>

### 😸 Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

<details>
<summary></summary>

#### 1. **Implementasi Fitur Registrasi Akun pada Proyek Django**
Saya memulai dengan menambahkan aplikasi *authentication* pada proyek Django untuk menangani proses registrasi, login, dan logout. Selanjutnya, saya menambahkan `authentication` ke dalam daftar `INSTALLED_APPS` di file `settings.py` proyek. Kemudian, saya menginstal library `django-cors-headers` untuk mengizinkan akses lintas domain, dan menambahkannya ke `INSTALLED_APPS` serta menyertakan `corsheaders.middleware.CorsMiddleware` di bagian middleware.

Saya juga menambahkan path untuk mengarahkan ke aplikasi *authentication* di `urls.py` proyek. Setelah itu, saya membuat fungsi *view* untuk login, registrasi, dan logout di dalam aplikasi *authentication*, dan menambahkan file `urls.py` yang tidak digenerasi secara otomatis saat pembuatan aplikasi namun memiliki fungsi penting untuk mengelola rute URL yang diperlukan.

#### 2. **Membuat Halaman Login di Proyek Flutter**
Saya menginstal package `provider` dan `pbp_django_auth` di proyek Flutter dengan menjalankan perintah:
```
flutter pub add provider
flutter pub add pbp_django_auth
```
Kemudian, saya memodifikasi *root widget* di `main.dart` agar menyediakan `CookieRequest` untuk semua *child widget* menggunakan *Provider*. Saya membuat dua berkas baru di folder `lib/screens`, yaitu `login.dart` dan `register.dart`, untuk halaman login dan registrasi. Untuk memastikan pengguna hanya bisa mengakses halaman lain setelah login, saya mengubah `home: MyHomePage()` menjadi `home: const LoginPage()` di `main.dart`. Selanjutnya, saya mengatur form login dan registrasi agar mengarah ke *endpoint* Django yang relevan.

#### 3. **Membuat Model Kustom untuk Proyek Flutter**
Saya mengirim hasil *endpoint* JSON dari Django ke *QuickType* untuk membangkitkan model Dart dengan nama `ProductEntry`. Saya mengatur *source type* menjadi JSON dan *language* menjadi Dart, lalu menempelkan data JSON ke dalam *textbox* di *QuickType*. Setelah itu, saya menyalin kode hasil *QuickType* dan menempelkannya ke dalam berkas `lib/models/product_entry.dart`.

#### 4. **Membuat Halaman Daftar Item dari Endpoint JSON di Django**
Saya menambahkan *package* HTTP dengan perintah:
```
flutter pub add http
```
Kemudian, saya menambahkan izin akses internet dengan menambahkan:
```xml
<uses-permission android:name="android.permission.INTERNET" />
```
di dalam `AndroidManifest.xml`.

Untuk menampilkan data, saya membuat file `list_productentry.dart` di `lib/screens` dan mengimpor *library* yang diperlukan, termasuk `package:flutter/material.dart` dan file model `product_entry.dart`. Saya menyalin fungsi `fetchProduct()` untuk mengambil data dari *endpoint* Django dan memastikan URL memiliki *trailing slash (/)*.

Saya menggunakan `FutureBuilder` di halaman tersebut untuk menampilkan data dalam bentuk daftar. Saya menambahkan navigasi di `widgets/left_drawer.dart` dengan menambahkan *ListTile* baru yang mengarah ke `ProductEntryPage`. Pada widget seperti `tracker_card.dart`, saya menambahkan navigasi `onTap` untuk mengarahkan ke halaman tersebut ketika tombol "Lihat Produk" ditekan.

#### 5. **Menghubungkan Form Flutter ke Layanan Django**
Di Django, saya menambahkan fungsi *view* `create_product_flutter()` di `main/views.py` untuk menerima request POST dari aplikasi Flutter, menggunakan dekorator `@csrf_exempt` agar terhindar dari error CSRF. Saya menambahkan rute baru di `main/urls.py` untuk mengakses fungsi tersebut.

Di Flutter, saya menghubungkan `productentry_form.dart` dengan `CookieRequest` untuk mengirim data POST. Saya mengganti kode di `onPressed` tombol agar dapat mengirim data ke Django menggunakan `request.postJson()`, dan menambahkan notifikasi `SnackBar` sebagai umpan balik. Jika data berhasil dikirim, aplikasi akan kembali ke halaman utama menggunakan `Navigator.pushReplacement()`.

#### 6. **Pengujian Akhir**
Saya memastikan semua *import* file yang dibutuhkan sudah ada, menjalankan aplikasi Flutter, dan menguji fitur untuk menambahkan serta menampilkan *ProductEntry*. Hasilnya, saya dapat melihat *ProductEntry* yang ditambahkan di situs web Django ditampilkan dengan benar di aplikasi Flutter, menunjukkan bahwa integrasi berhasil.
</details>

</details>











