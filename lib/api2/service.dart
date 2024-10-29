import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_example/model/users_Model.dart';

class ApiService{
  String endpoint = 'https://reqres.in/api/users?page=2';
  Future<List> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200){
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UsersModel.fromJson(e))).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}
final usersProvider= Provider((ref)=>ApiService());
