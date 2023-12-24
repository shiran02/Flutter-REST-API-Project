import 'package:flutter/material.dart';
import 'package:flutter_api_project/example2.dart';
import 'package:flutter_api_project/example3.dart';
import 'package:flutter_api_project/example4.dart';
import 'package:flutter_api_project/example5.dart';
import 'package:flutter_api_project/home_screen.dart';
import 'package:flutter_api_project/login_api.dart';
import 'package:flutter_api_project/sign_up_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LoginScreen(),
    );
  }
}
