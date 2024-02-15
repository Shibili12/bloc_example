import 'dart:convert';

import 'package:bloc_example/apicrud/crud_operations/model/productmodel.dart';
import 'package:bloc_example/apicrud/crud_operations/model/usermodel.dart';
import 'package:http/http.dart';

class Apiservice {
  String url = "https://fakestoreapi.com/products";
  String baseurl = "https://652cd09dd0d1df5273efb554.mockapi.io/users/users";
  Future<List<Productmodel>> getProducts() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<Productmodel> products =
          data.map((product) => Productmodel.fromJson(product)).toList();
      return products;
    } else {
      throw Exception();
    }
  }

  Future<List<User>> getUser() async {
    Response response = await get(Uri.parse(baseurl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<User> users = data.map((user) => User.fromJson(user)).toList();
      return users;
    } else {
      throw Exception();
    }
  }

  Future<List<User>> createUser(User user) async {
    final response = await post(
      Uri.parse(baseurl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      List<User> users = data.map((user) => User.fromJson(user)).toList();
      return users;
      // return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<List<User>> updateUser(int id, User user) async {
    final response = await put(
      Uri.parse('$baseurl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<User> users = data.map((user) => User.fromJson(user)).toList();
      // return User.fromJson(jsonDecode(response.body));
      return users;
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<List<User>> deleteUser(int id) async {
    final response = await delete(Uri.parse('$baseurl/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<User> users = data.map((user) => User.fromJson(user)).toList();
      return users;

      // return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete user');
    }
  }
}
