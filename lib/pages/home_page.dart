import 'package:firstattempt/models/catalog.dart';
import 'package:firstattempt/widgets/drawer.dart';
import 'package:firstattempt/widgets/items_widgets.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:(CatalogModel.items != null && CatalogModel.items.isNotEmpty)? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16,crossAxisSpacing: 16),
            itemBuilder: (context,index){
              final item= CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
                  child: GridTile(child: Image.network(item.image),
                  header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  ),
                  footer: Container(child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                    ),
                  ),

                  ));
            },
          itemCount: CatalogModel.items.length,) :
        Center(child: CircularProgressIndicator(),)
      ),
      drawer: MyDrawer(),
    );
  }
}