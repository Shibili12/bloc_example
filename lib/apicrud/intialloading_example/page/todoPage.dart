import 'package:bloc_example/apicrud/intialloading_example/bloc/initial_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class TodoPage extends StatelessWidget {
  final initialstate = InitialInitial();
  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InitialBloc, InitialState>(builder: (context, state) {
        return FutureBuilder(
          future: initialstate.getlist(),
          builder: (context, snapshot) => ListView.builder(
              itemCount: state.todo.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todo[index].title!),
                  trailing: Icon(state.todo[index].completed == true
                      ? Icons.task_alt
                      : Icons.circle_outlined),
                );
              }),
        );
      }),
    );
  }
}
