import 'package:flutter/material.dart';
import 'package:tokopakedi/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tokopakedi/screens/zoomed_photo.dart';

// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:yuk_belanja/Model/account.dart';
// import 'package:yuk_belanja/Model/shopping_item.dart';

// import 'package:yuk_belanja/Screen/zoomed_photo_screen.dart';

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
        // bottomNavigationBar: 
        // getMaxWidth() < 800
        // ? BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: CartButton(loggedInUser: loggedInUser, selectedItem:selectedItem),
        //         label: 'Masukkan keranjang'),
        //     BottomNavigationBarItem(
        //         icon: FavoriteButton(
        //             loggedInUser: loggedInUser,
        //             selectedItem: selectedItem,
        //             isFavorite: loggedInUser.isItemInFavoriteList(selectedItem)),
        //         label: 'Favorite'),
        //   ],
        //   unselectedItemColor: Colors.blue,
        //   selectedItemColor: Colors.blue,
        // )
        // : null
      );
        
  }
}

// class CartButton extends StatelessWidget {
//   final Account loggedInUser;
//   final ShoppingItem selectedItem;
//   const CartButton({Key? key, required this.loggedInUser, required this.selectedItem})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.shopping_cart),
//       onPressed: () {
//         loggedInUser.addItemToCart(selectedItem);
//       },
//     );
//   }
// }

// class FavoriteButton extends StatefulWidget {
//   const FavoriteButton(
//       {Key? key,
//       required this.loggedInUser,
//       required this.selectedItem,
//       required this.isFavorite})
//       : super(key: key);
//   final Account loggedInUser;
//   final ShoppingItem selectedItem;
//   final bool isFavorite;
//   @override
//   _FavoriteButtonState createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton> {
//   late bool isFavorite = widget.isFavorite;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         isFavorite ? Icons.favorite : Icons.favorite_border,
//         color: Colors.red,
//       ),
//       onPressed: () {
//         setState(() {
//           isFavorite = !isFavorite;
//           if (isFavorite == true) {
//             widget.loggedInUser.addItemToFavoriteList(widget.selectedItem);
//           } else {
//             widget.loggedInUser.deleteItemFromFavoriteList(widget.selectedItem);
//           }
//         });
//       },
//     );
//   }
// }

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
