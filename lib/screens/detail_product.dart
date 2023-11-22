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
