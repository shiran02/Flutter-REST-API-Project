import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api_project/Models/user_model.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getuserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    print(response);

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Api Course'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: getuserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              ReusableRow(title: 'Name : ',value: snapshot.data![index].name.toString()),
                              ReusableRow(title: 'Address : ',value: snapshot.data![index].address!.street.toString()),
                              ReusableRow(title: 'LAt : ',value: snapshot.data![index].address!.geo!.lat.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ))
          ],
        ),
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
