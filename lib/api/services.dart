import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_example/model/user_Model.dart';

class ApiServices{
  String endpoint = 'https://poetrydb.org/title/Ozymandias/lines.json';
Future<List<String>> getUsers() async {
  Response response = await get(Uri.parse(endpoint));
  if (response.statusCode == 200) {
    final List<dynamic> result = jsonDecode(response.body);
    List<String> lines = List<String>.from(result[0]['lines']);
    
    return lines;
  } else {
    throw Exception(response.reasonPhrase);
  }
}

}

final userProvider= Provider((ref)=>ApiServices());