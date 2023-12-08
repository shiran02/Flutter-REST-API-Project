import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExampleTwo extends StatelessWidget {
  ExampleTwo({super.key});

  List<Photoes> photoes_list = [];

  //future fuction..

  Future<List<Photoes>> getPhotoes() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photoes photoes = Photoes(id: i['id'], url: i['url'], title: i['title']);
        photoes_list.add(photoes);
        
      }
      return photoes_list;
    } else {
      return photoes_list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotoes(),
              builder: (context ,AsyncSnapshot<List<Photoes>> snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');
                }else {
                  return ListView.builder(
                      itemCount: photoes_list.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          leading: CircleAvatar(
                            foregroundImage: NetworkImage(
                              photoes_list[index].url.toString()
                            ),
                          ),
                         // title: Text(snapshot.data![index].title.toString()),
                          title: Text( 'Note ID ' + photoes_list[index].id.toString()),
                          subtitle: Text(photoes_list[index].title.toString()),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),

    );
  }
}

class Photoes {
  String? title, url;
  int? id;

  Photoes({
    required this.title,
    required this.url,
    required this.id,
  });
}
