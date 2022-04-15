import 'package:firstattempt/models/catalog.dart';
import 'package:firstattempt/widgets/drawer.dart';
import 'package:firstattempt/widgets/items_widgets.dart';
import 'package:firstattempt/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 25;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2),);
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body:SafeArea(
          child: Container(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if(CatalogModel.items !=null && CatalogModel.items.isNotEmpty)
                  Expanded(child: CatalogList())
                else
                  Center(child: CircularProgressIndicator(),)
              ],
            ),
          ),
        ),
    );
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catalog App' ,
          style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: MyTheme.darkBluishColor,
        ),
        ),
        Text(
          "Trending Products",style: TextStyle(fontSize: 18, color: MyTheme.darkBluishColor,),)
      ],);
  }
}
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemBuilder: (context,index){
          final catalog=CatalogModel.items[index];
          return CatalogItem(catalog:catalog);},
        itemCount: CatalogModel.items.length,
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : assert (catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(width: 70, height: 100,
          child: Row(
            children: [
              Container(

                  padding: EdgeInsets.all(5),
                child: CatalogImage(image: catalog.image,),
              ),
              SizedBox(width: 10,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catalog.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.darkBluishColor,
                    ),
                  ),
                  Text(catalog.desc,style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  ),

                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                    Text("\$${catalog.price.toString()}"),
                    ElevatedButton(
                      onPressed: (){}, child: Text("Buy",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    ),
                    style:ElevatedButton.styleFrom(
                      primary:Colors.indigoAccent,
                      minimumSize: Size(5, 28),
                    ),
                    ),

                  ],)
                ],
              ))
            ],
          ),),
          padding: EdgeInsets.symmetric(vertical:5,horizontal: 5),
        ),
      ),
    );

  }
}
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key,required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(image,);
  }
}