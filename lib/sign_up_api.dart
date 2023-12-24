import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void login(String email,password) async{

    try{

      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email' : email,
          'password': password
        }
        
      );

      if(response.statusCode == 200){
        var data =jsonDecode(response.body.toString());
        print(data['token']); 
        print('Login successFully');   
      }else{
        print('faild');
      }

    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
        
               SizedBox(height: 20,),
        
               TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
        
              SizedBox(height: 40,),
        
              GestureDetector(
                onTap: (){
                 login(emailController.text.toString(), passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Sign Up'),),
                ),
              )
        
          ],
        ),
      ),
    );
  }
}