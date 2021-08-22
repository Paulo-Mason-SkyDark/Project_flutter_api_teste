import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request/model/dados_http.dart';

final url = Uri.https("jsonplaceholder.typicode.com", "/posts/2", {'q': '{http}'});

Future<DadosPost> fetchPost() async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return DadosPost.fromMap(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
