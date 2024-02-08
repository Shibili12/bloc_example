import 'package:bloc_example/apicrud/bloc/user_bloc.dart';
import 'package:bloc_example/apicrud/model/usermodel.dart';
import 'package:bloc_example/apicrud/pages/userlist.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurdPage extends StatelessWidget {
  CurdPage({super.key});

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Enter name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller2,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter phone number"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var user = User(
                          name: controller1.text,
                          email: controller2.text,
                          phone: controller3.text);
                      context.read<UserBloc>().add(Postuser(user: user));
                      controller1.clear();
                      controller2.clear();
                      controller3.clear();
                    },
                    child: Text("ADD USER"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<UserBloc>().add(Fetchuser());
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => UserList()));
                    },
                    child: Text("Get All Users"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
