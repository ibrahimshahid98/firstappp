import 'package:firstattempt/widgets/items_widgets.dart';
import 'package:flutter/cupertino.dart';
class CatalogModel{
  static List<Item> items =[];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  Item({required this.name,required this.color,required this.desc,required this.id,required this.image,required this.price});
  factory Item.fromMap(Map<String, dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],

    );
  }
  toMap() => {
    "id":id,
    "name": name,
    "desc": desc,
    "price":price,
    "color":color,
    "image":image,


  };
}