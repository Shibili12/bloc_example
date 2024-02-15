import 'dart:convert';

import 'package:bloc_example/apicrud/multiple_Api_Call/model/productmodel.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/model/universitymodel.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/model/usermodel.dart';
import 'package:http/http.dart';

class Httpservice {
  String userUrl = "https://jsonplaceholder.typicode.com/users";
  String productUrl = "https://fakestoreapi.com/products";

  String universityUrl =
      "http://universities.hipolabs.com/search?country=United+States";
  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<UserModel> users =
          data.map((user) => UserModel.fromJson(user)).toList();
      return users;
    } else {
      throw Exception();
    }
  }

  Future<List<UniversityModel>> getUniversity() async {
    Response response = await get(Uri.parse(universityUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<UniversityModel> university =
          data.map((user) => UniversityModel.fromJson(user)).toList();
      return university;
    } else {
      throw Exception();
    }
  }

  Future<List<ProductModel>> getProducts() async {
    Response response = await get(Uri.parse(productUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<ProductModel> products =
          data.map((product) => ProductModel.fromJson(product)).toList();
      return products;
    } else {
      throw Exception();
    }
  }
}
