import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api_project/Models/user_model.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}
var data;
Future<void> getUserApi() async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  data = jsonDecode(response.body.toString());

  if(response.statusCode == 200){

  }else{

  }

}


class _ExampleFourState extends State<ExampleFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(), 
              builder: (context, snapshot) {
                
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Text('Loading');
                }else{
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                              ReusableRow(title: 'Name ' , value: data[index]['name'].toString()),
                              ReusableRow(title: 'email ' , value: data[index]['email'].toString()),
                             // ReusableRow(title: 'address ' , value: data[index]['address'].toString()),
                              ReusableRow(title: 'address ' , value: data[index]['address']['street'].toString()),
                          ],
                        ),
                      );
                    },
                    );



              
                   
                }
              },
              ) 
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {

  String title , value ;

   ReusableRow({super.key  , required this.title ,  required this.value});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}