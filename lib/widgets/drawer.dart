import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURL ="https://i.pinimg.com/280x280_RS/0c/ea/33/0cea331d3bf5e2426ca1a2701c192c81.jpg";
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.brown),
              child: UserAccountsDrawerHeader(

                decoration: BoxDecoration(color: Colors.brown),
                margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                    radius: 5.0,
                  ),
                  accountName: Text( "Ibrahim Shahid",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  accountEmail: Text("ibrahimshahid98@gmail.com",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
          )
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home,color: Colors.black,),
            title: Text("Home",style: TextStyle(
              color: Colors.black,
            ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled,color: Colors.black,),
            title: Text("Profile",style: TextStyle(
              color: Colors.black,
            ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings,color: Colors.black,),
            title: Text("Settings",style: TextStyle(
              color: Colors.black,
            ),
            ),
          )



        ],
      ),
    );
  }
}