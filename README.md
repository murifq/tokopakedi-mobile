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

# Tugas 1

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