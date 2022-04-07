import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ID Card Application'),
          centerTitle: true,
          backgroundColor: Colors.black38,
          elevation: 20.0,
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(onPressed: (){
                print('Settings Clicked');
              },
                child: Text(
                  'Settings',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),

                ),)
            ],
          ),
        )
    );
  }
}