import 'package:bloc_example/apicrud/multipleApicall/bloc/multiple_bloc.dart';
import 'package:bloc_example/apicrud/multipleApicall/pages/productpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUser extends StatelessWidget {
  final String username;
  final String name;
  final String phone;
  final String email;
  EditUser(
      {super.key,
      required this.username,
      required this.name,
      required this.phone,
      required this.email});
  TextEditingController controller = TextEditingController();
  TextEditingController productcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: username,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: email,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: phone,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select University",
                ),
                onTap: () {
                  context.read<MultipleBloc>().add(GetUniversity());
                  bottomlist(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "select product",
                ),
                onTap: () async {
                  context.read<MultipleBloc>().add(Getproducts());
                  final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Productpage()));

                  productcontroller.text = result.toString();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomlist(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: BlocBuilder<MultipleBloc, MultipleState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case UniversityLoaded:
                    final newState = state as UniversityLoaded;
                    return ListView.builder(
                      itemCount: newState.university.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(newState.university[index].name!),
                          onTap: () {
                            controller.text = newState.university[index].name!;
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  default:
                    return SizedBox();
                }
              },
            ),
          );
        });
  }
}
