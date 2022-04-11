import 'package:firstattempt/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton=false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext Context) async{
    if(_formkey.currentState!.validate()){
    setState(() {
      changeButton=true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton=false;
    });}
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      child:SingleChildScrollView(
      child:Form(
        key: _formkey,
        child: Column(
          children: [
            Image.asset('assets/images/login.png',fit: BoxFit.contain,),
            SizedBox(height: 10),
            Text('Welcome $name',style: TextStyle(
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
                  validator: (value){
                  if(value!.isEmpty){
                    return"Please Enter UserName";
                  }
                  return null;
                  },
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  onChanged:(value){
                  name=value;
                  setState(() {
                  });
                  } ,
                ),
              SizedBox(height: 15,),
                TextFormField(decoration: InputDecoration(
                  hintText: 'Enter Password',
                  labelText: "Password",
                ),
                  validator: (value){
                    if(value!.isEmpty){
                      return"Please Enter Password";
                    }
                    else if(value.length < 6){
                      return"Password to Short";
                    }
                    return null;
                  },
                style: TextStyle(
                  fontSize: 15,

                ),
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                Material(
                  color: Colors.indigo,
                  borderRadius:BorderRadius.circular( changeButton ? 30:60),
                  child: InkWell  (
                    splashColor: Colors.red,
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      alignment: Alignment.center,
                      height: 50,
                      width: changeButton ? 70: 170,
                      child: changeButton ? Icon(Icons.done, color:Colors.black) : Text('Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,),
                      ),
                      ),
                    ),
                  ),

              ],
            ),
          )
          ],
        ),
      ))
    );}
}