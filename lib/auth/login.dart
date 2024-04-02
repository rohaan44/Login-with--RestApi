import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

void Login(String email,Password) async{
try {
  final response = await http.post(Uri.parse("https://reqres.in/api/login"),
  body: {
    "email": email,
    "password" : Password

  });
  if (response.statusCode==200) {
    var data = jsonDecode(response.body.toString());
    print(data['token']); 
    print("Response Created");
  }
  else print("Response denied");
} 
catch (e) {
  print(e.toString());
}

}


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        TextFormField(
      
        controller: emailController,
        decoration: InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
          )
        ),
        
        ),
        SizedBox(height: 20,)
        ,TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: "password",
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
          )
        ),
        
        ),
      SizedBox(height: 30,),
      Container(
        height: 40,
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue
          ),
          onPressed: (){
            Login(emailController.text, passwordController.text);
            
          }, child: Text("Login")))
        
        ],),
      ),
    );
  }
}