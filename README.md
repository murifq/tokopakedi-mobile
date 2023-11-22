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

# Tugas 9

## Implemntasi _checklist_

### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
1. Melakukan _deployment_ ulang pada project django

### Membuat halaman login pada proyek tugas Flutter.
1. Tambahkan `login.dart` pada folder `screens`
2. Tambahkan kode berikut
```
  import 'package:tokopakedi/screens/menu.dart';
  import 'package:flutter/material.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';

  void main() {
      runApp(const LoginApp());
  }

  class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: 'Login',
          theme: ThemeData(
              primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      );
      }
  }

  class LoginPage extends StatefulWidget {
      const LoginPage({super.key});

      @override
      _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
              appBar: AppBar(
                  title: const Text('Login'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                  labelText: 'Username',
                              ),
                          ),
                          const SizedBox(height: 12.0),
                          TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                              ),
                              obscureText: true,
                          ),
                          const SizedBox(height: 24.0),
                          ElevatedButton(
                              onPressed: () async {
                                  String username = _usernameController.text;
                                  String password = _passwordController.text;

                                  // Cek kredensial
                                  // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                  // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                  // gunakan URL http://10.0.2.2/
                                  final response = await request.login("https://muhamad-rifqi21-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                  'username': username,
                                  'password': password,
                                  });
                      
                                  if (request.loggedIn) {
                                      String message = response['message'];
                                      String uname = response['username'];
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyHomePage()),
                                      );
                                      ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                              SnackBar(content: Text("$message Selamat datang, $uname.")));
                                      } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              title: const Text('Login Gagal'),
                                              content:
                                                  Text(response['message']),
                                              actions: [
                                                  TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                          Navigator.pop(context);
                                                      },
                                                  ),
                                              ],
                                          ),
                                      );
                                  }
                              },
                              child: const Text('Login'),
                          ),
                      ],
                  ),
              ),
          );
      }
  }
```

### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
1. Buat app baru pada django dengan nama `authentication`
2. Tambahkan file `urls.py` lalu tambahkan berikut ini
```
from django.urls import path
from authentication.views import *

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
]
```
3. Tambahkan function baru pada `views.py` di dalma folder `authentication`
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import logout as auth_logout

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
    
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```
4. Tambahkan di `settings.py`
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'

CSRF_TRUSTED_ORIGINS =["https://muhamad-rifqi21-tugas.pbp.cs.ui.ac.id"]
```
5. Tambahkan `authentication` ke `INSTALLED_APPS` pada main project settings.py aplikasi Django 
6. Jalankan perintah `pip install django-cors-headers` untuk menginstal library yang dibutuhkan.
7. Tambahkan `corsheaders` ke `INSTALLED_APPS` pada main project settings.py aplikasi Django kamu.
8. Tambahkan `corsheaders.middleware.CorsMiddleware` pada main project settings.py aplikasi Django kamu.
9. Install package pada terminal flutter
```
flutter pub add provider
flutter pub add pbp_django_auth
```
10. Ubah `main.dart` menjadi beirkut
```
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tokopakedi/screens/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: LoginPage()),
            
        );
    }
}
```
11. Tambahkan `login.dart` menjadi hal berikut
```
  import 'package:tokopakedi/screens/menu.dart';
  import 'package:flutter/material.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';

  void main() {
      runApp(const LoginApp());
  }

  class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: 'Login',
          theme: ThemeData(
              primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      );
      }
  }

  class LoginPage extends StatefulWidget {
      const LoginPage({super.key});

      @override
      _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
              appBar: AppBar(
                  title: const Text('Login'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                  labelText: 'Username',
                              ),
                          ),
                          const SizedBox(height: 12.0),
                          TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                              ),
                              obscureText: true,
                          ),
                          const SizedBox(height: 24.0),
                          ElevatedButton(
                              onPressed: () async {
                                  String username = _usernameController.text;
                                  String password = _passwordController.text;

                                  // Cek kredensial
                                  // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                  // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                  // gunakan URL http://10.0.2.2/
                                  final response = await request.login("https://muhamad-rifqi21-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                  'username': username,
                                  'password': password,
                                  });
                      
                                  if (request.loggedIn) {
                                      String message = response['message'];
                                      String uname = response['username'];
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyHomePage()),
                                      );
                                      ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                              SnackBar(content: Text("$message Selamat datang, $uname.")));
                                      } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              title: const Text('Login Gagal'),
                                              content:
                                                  Text(response['message']),
                                              actions: [
                                                  TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                          Navigator.pop(context);
                                                      },
                                                  ),
                                              ],
                                          ),
                                      );
                                  }
                              },
                              child: const Text('Login'),
                          ),
                      ],
                  ),
              ),
          );
      }
  }
```

### Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Salin data `json` django ke `Quicktype` 
2. Copy kode dari `Quicktype` ke `lib/models` dan buat `product.dart`
3. Copy menjadi seperti berikut
```
// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String photoUrl;
    String name;
    int amount;
    int price;
    String description;
    int rating;
    int sold;

    Fields({
        required this.user,
        required this.photoUrl,
        required this.name,
        required this.amount,
        required this.price,
        required this.description,
        required this.rating,
        required this.sold,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        photoUrl: json["photo_url"],
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        description: json["description"],
        rating: json["rating"],
        sold: json["sold"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "photo_url": photoUrl,
        "name": name,
        "amount": amount,
        "price": price,
        "description": description,
        "rating": rating,
        "sold": sold,
    };
}
```
### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
1. Tambahkan `list_product.dart` pada `screens` menjadi seperti berikut
```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tokopakedi/models/product.dart';

import 'package:tokopakedi/widgets/left_drawer.dart';
import 'package:tokopakedi/screens/detail_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!

    var url = Uri.parse('https://muhamad-rifqi21-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailScreen(
                                    // loggedInUser: widget.loggedInUser,
                                    selectedItem: snapshot.data![index]);
                              }));
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              // padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text("${snapshot.data![index].fields.price}"),
                                  const SizedBox(height: 10),
                                  Text(
                                      "${snapshot.data![index].fields.description}")
                                ],
                              ),
                            ),
                          ));
                }
              }
            }));
  }
}
```

### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
1. Tambahkan `dependencies` pada `pubspec.yaml`
```
. . .
  carousel_slider: ^4.2.1
  zoom_widget: ^2.0.1
. . .
```
2. Tambahkan `detail_product.dart` menjadi seperti berikut
```
import 'package:flutter/material.dart';
import 'package:tokopakedi/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tokopakedi/screens/zoomed_photo.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  // final Account loggedInUser;
  final Item selectedItem;
  const DetailScreen({Key? key, required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double getMaxWidth() {
      return MediaQuery.of(context).size.width;
    }

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: getMaxWidth() < 800
                ? Column(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 238, 238, 238),
                        child: CarouselSlider(
                          items: [selectedItem.fields.photoUrl]
                              .map((url) => Container(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ZoomedFotoScreen(url:url);
                                      }));
                                    },
                                    child: Image.network(url),
                                  )))
                              .toList(),
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                          ),
                        ),
                      ),
                      Expanded(
                          child: DetailMobileScreen(selectedItem:selectedItem))
                    ],
                  )
                : Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CarouselSlider(
                            items: [selectedItem.fields.photoUrl]
                                .map((url) => Container(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                          return ZoomedFotoScreen(url:url);
                                        }));
                                      },
                                      child: Image.network(url),
                                    )))
                                .toList(),
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: DetailMobileScreen(selectedItem:selectedItem)),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     const SizedBox(width: 10),
                        //     CartButton(loggedInUser:loggedInUser, selectedItem: selectedItem),
                        //     const SizedBox(width: 10),
                        //     FavoriteButton(loggedInUser:loggedInUser, selectedItem:selectedItem, isFavorite: loggedInUser.isItemInFavoriteList(selectedItem))
                        //   ],
                        // )
                      ],
                    ),
                )),
      );
        
  }
}

class DetailMobileScreen extends StatefulWidget {
  const DetailMobileScreen({Key? key, required this.selectedItem})
      : super(key: key);
  // final Account loggedInUser;
  final Item selectedItem;

  @override
  _DetailMobileScreen createState() => _DetailMobileScreen();
}

class _DetailMobileScreen extends State<DetailMobileScreen> {
  // late List<Item> loggedInUserCart = widget.loggedInUser.getCart();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text("Rating: "+widget.selectedItem.fields.rating.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24))),
        Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(widget.selectedItem.fields.price.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24))),
        const SizedBox(height: 20),
        Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(widget.selectedItem.fields.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20))),
        const SizedBox(height: 20),
        Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text("Stok: "+widget.selectedItem.fields.amount.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14))),
        const SizedBox(height: 10),
        Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: const Text("Deskripsi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        const SizedBox(height: 10),
        Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(widget.selectedItem.fields.description,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14))),

      ],
    );
  }
}
```
3. Tambahkan `zoomed_photo.dart` menjadi sperti berikut
```
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ZoomedFotoScreen extends StatelessWidget {
  final String url;

  const ZoomedFotoScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Zoom(child: Image.network(url)),
      )),
    );
  }
}
```

## Pertanyaan

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, bisa melakukan tersebut. Kita bisa langsung parse json yang ada. Tetapi untuk memudahkan, maka lebih baik membuat model terlebih dahulu

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah permintaan HTTP yang membawa cookie untuk mengelola sesi pengguna dan menyimpan informasi penting seperti status login. Dalam aplikasi Flutter, instance `CookieRequest` yang sama perlu dibagikan ke seluruh komponen untuk menjaga agar sesi pengguna tetap konsisten, memastikan keamanan dengan mempertahankan otentikasi pengguna di berbagai bagian aplikasi, dan memudahkan pengelolaan state.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Flutter akan request data ke django berupa json
2. Kemudian, akan dikirimkan response berupa json dari django, yang akan diolah oleh flutter
3. Maka flutter akan menampilkan hasil dari kiriman json yang dikirmkan oleh django

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Login pada flutter akan diteruskan ke web django dengan sistem login yang berbeda yg berada dalam app "authentication". 
2. Lalu dikirimkan data berupa username dan password, yang kemudian fungsi pada views.py di `authentication` akan melakukan autentikasi
4. Lalu django akan memberi kiriman berhasil tidaknya login
5. Flutter akan menampilkan hasil dari login. Apabila berhasil maka langsung akan ke page selanjutnya

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
1. Padding:  Menambahkan _padding_ di sekitar
2. Column: Menampilkan _children_-nya secara vertikal dan mengisi _vertical space_ yang tersedia
3. Text: Menampillkan teks
4. InkWell: Area segi empat yang mana bisa memberikan respon ketika disentuh
5. Container: Menyimpan widget dan memposisikannya di layar
6. Scaffold: _Basic layout structure_ di flutter. Dapat menampung _app bar_, _body_, dan _floating action button_
7. SizedBox: Memberikan jarak dengna menggunakan kotak kosong, dalam konteks tugas ini
8. Expanded: Menampilkan widget dengan mengisi tempat yang tersedia 