// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
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
    String productImage;
    String name;
    String flavour;
    int price;
    String description;
    double netto;
    String category;
    int stock;
    DateTime expDate;

    Fields({
        required this.user,
        required this.productImage,
        required this.name,
        required this.flavour,
        required this.price,
        required this.description,
        required this.netto,
        required this.category,
        required this.stock,
        required this.expDate,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        productImage: json["product_image"],
        name: json["name"],
        flavour: json["flavour"],
        price: json["price"],
        description: json["description"],
        netto: json["netto"]?.toDouble(),
        category: json["category"],
        stock: json["stock"],
        expDate: DateTime.parse(json["exp_date"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "product_image": productImage,
        "name": name,
        "flavour": flavour,
        "price": price,
        "description": description,
        "netto": netto,
        "category": category,
        "stock": stock,
        "exp_date": "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
    };
}
