import 'package:bloc_example/apicrud/crud_operations/bloc/user_bloc.dart';
import 'package:bloc_example/apicrud/crud_operations/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: state.user.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.user[index].name!),
                        subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(state.user[index].email!),
                              Text(state.user[index].phone!),
                            ],
                          ),
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  final username = state.user[index].name!;
                                  final email = state.user[index].email!;
                                  final phone = state.user[index].phone!;
                                  final id = state.user[index].id!;
                                  popup(username, email, phone, id, context);
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                              onPressed: () {
                                context.read<UserBloc>().add(DeleteUser(
                                    int.parse(state.user[index].id!)));
                                context.read<UserBloc>().add(Fetchuser());
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
        },
      ),
    );
  }

  popup(String username, String email, String phone, String id,
      BuildContext context) {
    final controller1 = TextEditingController(text: username);
    final controller2 = TextEditingController(text: email);
    final controller3 = TextEditingController(text: phone);
    final controller4 = TextEditingController(text: id);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  enabled: false,
                  controller: controller4,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller1,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller2,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller3,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var user = User(
                      name: controller1.text,
                      email: controller2.text,
                      phone: controller3.text);
                  context
                      .read<UserBloc>()
                      .add(UpdateUser(int.parse(controller4.text), user));
                  context.read<UserBloc>().add(Fetchuser());

                  Navigator.pop(context);
                },
                child: Text("put"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
