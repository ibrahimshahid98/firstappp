import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      child:Column(
        children: [
          Image.asset('assets/images/login.png',fit: BoxFit.contain,),
          SizedBox(height: 10,),
          Text('Welcome',style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal:20),
          child: Column(
            children: [
              TextFormField(decoration: InputDecoration(
                hintText: 'Enter UserName',
                labelText: "UserName",
              ),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            SizedBox(height: 15,),
              TextFormField(decoration: InputDecoration(
                hintText: 'Enter Password',
                labelText: "Password",
              ),
              style: TextStyle(
                fontSize: 15,
              ),),
              SizedBox(height: 10,),
              ElevatedButton(
                style: TextButton.styleFrom(
                ),
                  onPressed: (){
                  print('pressed');
                  },
                  child: Text('Login'))
            ],
          ),
        )
        ],
      )
    );}
}