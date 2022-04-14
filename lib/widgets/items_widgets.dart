import "package:flutter/material.dart";
import 'package:firstattempt/models/catalog.dart';
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : assert(item != null) ,super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      shape: StadiumBorder(),

      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name,textScaleFactor: 1,),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),

      ),
    );
  }
}