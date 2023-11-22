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
