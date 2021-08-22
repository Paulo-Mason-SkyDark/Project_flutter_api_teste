import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_request/model/dados_http.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = Uri.https("jsonplaceholder.typicode.com", "/posts/2", {'q': '{http}'});

  Future<String> getJSONData() async {
    http.get(url, headers: {"Accept": "application/json"}).then(
      (response) {
        setState(() {
          var data = json.decode(response.body)['results'];
        });
      },
    );

    return "Dados obtidos com sucesso";
  }

  Future<DadosPost> fetchPost() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return DadosPost.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<DadosPost>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                "id: ${snapshot.data!.id.toString()}"
                " \n\n iduser: ${snapshot.data!.userId.toString()}  "
                "\n\n title: ${snapshot.data!.title.toString()} "
                "\n\n body: ${snapshot.data!.body.toString()}",
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
