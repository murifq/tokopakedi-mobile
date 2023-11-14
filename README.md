# tokopakedi

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Tugas 7

## Pertanyaan
###  Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
* Stateless widget
  1. Merupakan static widget
  2. Tidak dapat melakukan perubahan data ketika sedang dijalankan
  3. Tidak mempunyai state, hanya akan di-_render_ sekali dan tidak bisa di _re-render_ 
  4. Contohnya: Text, Icon, RaisedButton

* Stateful widget
  1. Merupakan dynamic widget
  2. Dapat melakukan perubahan data ketika sedang dijalankan
  3. Dapat memiliki _internal state_ dan dapat di-_re-render_ ketika ada perubahan data
  4. Contohnya: Checkbox, Radio Button, Slider

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. SingleChildScrollView: Membuat _single child_ bisa di-_scroll_
2. Padding:  Menambahkan _padding_ di sekitar
3. Column: Menampilkan _children_-nya secara vertikal dan mengisi _vertical space_ yang tersedia
4. Text: Menampillkan teks
5. GridView: Menampilkan _children_-nya secara 2D dan dapat di-_scroll_
6. Material: _Standard visual design_ di mobile dan web platform. Konsepnya seperti permukaan kertas
7. InkWell: Area segi empat yang mana bisa memberikan respon ketika disentuh
8. Container: Menyimpan widget dan memposisikannya di layar
9. Scaffold: _Basic layout structure_ di flutter. Dapat menampung _app bar_, _body_, dan _floating action button_
10. App bar: _Bar_ di atas aplikasi yang dapat menampilkan _tittle, leading actions_, dan lainnya



## Implementasi Checklist
### Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
1. Buka Terminal atau Command Prompt.
2. Masuk ke direktori di mana kamu ingin menyimpan proyek flutter-mu.
3. Generate proyek Flutter baru dengan nama shopping_list, kemudian masuk ke dalam direktori proyek tersebut.
```
flutter create tokopakedi
cd tokopakedi
```
4. Buka pada vscode ke folder yang telah kamu buat flutter _project_ sebelumnya
5. Buka `main.dart`, ubah `colorScheme` nya menjadi berikut:
```
colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
```



### Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item (Lihat Item),  Menambah item (Tambah Item), dan  Logout (Logout)
1. Hapus bagian `MyHomePage(title: 'Flutter Demo Home Page')` menjadi:
```
MyHomePage()
```
2. Di `menu.dart`, ubah widgetnya menjadi _stateless_ dengan menambahkan kode berikut:
```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
3. Hapus class yang ada di bawahnya
4. Tambahkan _class_ baru untuk item yang akan dijual:
```
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```
5. Di bawah kode `mePage({Key? key}) : super(key: key);`, tambahkan:
```
final List<ShopItem> items = [
ShopItem("Lihat Item", Icons.checklist),
ShopItem("Tambah Item", Icons.add_shopping_cart),
ShopItem("Logout", Icons.logout),
];
```
6. Tambahkan kode berikut di dalam _class_ `MyHomePage` dibawah kode `Widget build(BuildContext context) {` dengan kode berikut:
```
return Scaffold(
appBar: AppBar(
    title: const Text(
    'Shopping List',
    ),
),
body: SingleChildScrollView(
    // Widget wrapper yang dapat discroll
    child: Padding(
    padding: const EdgeInsets.all(10.0), // Set padding dari halaman
    child: Column(
        // Widget untuk menampilkan children secara vertikal
        children: <Widget>[
        const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
            child: Text(
            'PBP Shop', // Text yang menandakan toko
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
            ),
            ),
        ),
        // Grid layout
        GridView.count(
            // Container pada card kita.
            primary: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: items.map((ShopItem item) {
            // Iterasi untuk setiap item
            return ShopCard(item);
            }).toList(),
        ),
        ],
    ),
    ),
),
);
```
7. Buat _class_ card baru untuk menampilkan _card_ dengan data dari _class_ `ShopItem` dengan kode berikut:
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Memunculkan Snackbar dengan tulisan: "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan,  "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan,  "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
1. Tambahkan `SnackBar` di dalam fungsi `onTap` di dalam `InkWell` `ShopCard` _Class_ dengan kode berikut:
```
ScaffoldMessenger.of(context)
..hideCurrentSnackBar()
..showSnackBar(SnackBar(
    content: Text("Kamu telah menekan tombol ${item.name}!")));
```

## Bonus
1. Tambahkan _field_ `  final MaterialColor color;` di dalam `ShopItem` _class_
2. Ubah _constructor_ _class_ `ShopItem` menjadi seperti berikut:
```
ShopItem(this.name, this.icon, this.color);
```
3. Tambahkan `color` pada setiap _instance class_ `ShopItem` yang telah di definisikan pada `MyHomePage` _class_ menjadi seperti berikut:
```
final List<ShopItem> items = [
ShopItem("Lihat Item", Icons.checklist, Colors.indigo),
ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.green),
ShopItem("Logout", Icons.logout,Colors.red),
];
```
4. Ubah coolor di bawah `return Material(` di dalam `ShopCard` _Class_ menjadi seperti berikut:
```
color: item.color,
```

# Tugas 8
## Pertanyaan


## Implementasi Checklist
###  Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
1. Membuat folder `screens` dan `widgets`
2. Membuat file `shop_form.dart`
3. Tambahkan kode berikut
```
import 'package:flutter/material.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    @override
    Widget build(BuildContext context) {
        return Placeholder();
    }
}
```
4. Ubah widget `Placeholder`
```
Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Form Tambah Produk',
      ),
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  // TODO: Tambahkan drawer yang sudah dibuat di sini
  body: Form(
    child: SingleChildScrollView(),
  ),
);
```
5. Buatlah `key` dan `form`
```
...
class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
...
```
```
...
body: Form(
     key: _formKey,
     child: SingleChildScrollView(),
),
...
```
6. Tambahkan beberapa `field` dalam `form`
```
...
class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
...
```
7. Buatlah widget `Column` dalam `SingleChildScrollView`
8. Tambahkan _children_ dari `Column`
```
...
child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Nama Produk",
              labelText: "Nama Produk",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
...
```
9. Buatlah `TextFormField` sebagai berikut
```
...
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Harga",
      labelText: "Harga",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    // TODO: Tambahkan variabel yang sesuai
    onChanged: (String? value) {
      setState(() {
        _price = int.parse(value!);
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Harga tidak boleh kosong!";
      }
      if (int.tryParse(value) == null) {
        return "Harga harus berupa angka!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Deskripsi",
      labelText: "Deskripsi",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        // TODO: Tambahkan variabel yang sesuai
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Deskripsi tidak boleh kosong!";
      }
      return null;
    },
  ),
),
...
```
10. Buatlah tombol `save` sebagai child selanjutnya dari `Column`
```
...
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
...
```

### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
1. Tambahkan _conditional if_ baru pada ShopCard
```
  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
        },
```

### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
1. Tambahkan _conditional if_ baru pada  `ElevatedButton` _onPressed_ yang akan memunculkan `showDialog` 
```
  child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Produk berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: $_name'),
                                  // TODO: Munculkan value-value lainnya
                                  Text('Price: $_price'),
                                  Text('Description: $_description'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
```

###  Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
1. Buat file baru `left_drawer` pada folder `widgets`
2. Tambahkan _class_ baru pada file tersebut
```
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
          ),
          // TODO: Bagian routing
        ],
      ),
    );
  }
}
```
3. _Import_ yang dibutuhkan
```
import 'package:flutter/material.dart';
import 'package:shopping_list/menu.dart';
// TODO: Impor halaman ShopFormPage jika sudah dibuat
```
4. Tambahkan `ListTile` 
```
ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
    TODO: Buatlah routing ke ShopFormPage di sini,
    setelah halaman ShopFormPage sudah dibuat.
    */
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShopFormPage()));
            },
          ),
```
5. Ubahlah `DrawerHeader` nya menjadi seperti berikut
```
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat seluruh keperluan belanjamu di sini!",
                  // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white,),
                ),
              ],
            ),
          ),
```
6. Tambahkan _drawer_ pada home scree kita
```
...
// Impor drawer widget
import 'package:shopping_list/widgets/left_drawer.dart';
...
return Scaffold(
  appBar: AppBar(
    title: const Text(
      'Shopping List',
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
  drawer: const LeftDrawer(),
...
```

## Pertanyaan
### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
* Navigator.push()
  1. menavigasi ke halaman baru sambil mempertahankan halaman saat ini di stack navigasi.
  2. Dapat kembali ke screen sebelumnya dengan melakukan _pop_ pada stack screenya

* Navigator.pushReplacement()
  1. menavigasi ke halaman baru dan menghancurkan halaman saat ini
  2. Tidak dapat kembali ke scree sebelumnya

###  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. Align: Widget ini digunakan untuk mengatur posisi child widget di dalam dirinya sendiri dan secara opsional menyesuaikan ukurannya berdasarkan ukuran child.
2. AspectRatio: Widget ini mencoba untuk mengukur child dengan rasio aspek tertentu.
3. Center: Widget ini menengahkan child-nya di dalam dirinya sendiri.
4. Container: Widget ini membungkus widget lainnya.
5. Expanded: Widget ini memperluas child dari Row, Column, atau Flex.
6. Padding: Widget ini memberikan padding pada child-nya.
7. Column: Widget ini mengatur daftar child widget dalam arah vertikal.
8. Row: Widget ini mengatur daftar child widget dalam arah horizontal.
9. GridView: Widget ini mengimplementasikan komponen daftar grid1.
10. ListView: Widget ini adalah widget scrolling yang paling umum digunakan. Ia menampilkan child-nya satu per satu dalam arah scroll.
11. SingleChildScrollVieW: Membuat child nya dapat discroll

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. name, 
2. amount, 
3. description
Ketiganya menggunakan input  `TextFormField`. Hal tersebut dilakukan untuk mengantisipasi input dari pengguna, sehingga pengguna bisa input apa saja, tetapi tetap dapat diberikan peringatan jika salah.


###  Bagaimana penerapan clean architecture pada aplikasi Flutter?
Pemisahan komponen-komponen berdasarkan fungsinya masing-masing. Hal tersebut akan lebih memudahakn jika ingin melakukan debugging atau ingin melakukan pengembangan dan pemeliharaan pada aplikasi. Dalam tugas ini, maka dibuat dua folder.
* Folder `widgets`: Yang dapat menjadi widget di layar lain
* Folder `screens`: Yang ditampilkan di layar