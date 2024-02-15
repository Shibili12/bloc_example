import 'dart:convert';

import 'package:bloc_example/apicrud/intialloading_example/model/todomodel.dart';
import 'package:http/http.dart';

class ApiHeleper {
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<Todo>> getProducts() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<Todo> products =
          data.map((product) => Todo.fromJson(product)).toList();
      return products;
    } else {
      throw Exception();
    }
  }
}
