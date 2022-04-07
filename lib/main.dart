import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:Home() ,
));
    class Home extends StatelessWidget {
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
