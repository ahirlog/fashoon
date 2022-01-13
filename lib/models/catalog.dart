// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

class CatalogModel {
  static List<Item>? items;

  // Get Item by ID
  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  // Get item by position
  Item getByPosition(int pos) => items![pos];
}

class Item {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final String? color;
  final String? image;

  Item(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.color,
      this.image});

  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      color: map['color'],
      image: map['image'],
    );
  }
}
