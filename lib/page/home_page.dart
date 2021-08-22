import 'package:flutter/material.dart';
import 'package:http_request/model/dados_http.dart';
import 'package:http_request/services/services_get_infomation.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
