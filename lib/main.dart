import 'package:flutter/material.dart';
import 'package:http_request/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aquisição http',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aquisição a http'),
      debugShowCheckedModeBanner: false,
    );
  }
}
