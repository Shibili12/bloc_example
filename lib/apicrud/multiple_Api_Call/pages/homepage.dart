import 'package:bloc_example/apicrud/multiple_Api_Call/bloc/multiple_bloc.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/pages/editpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    context.read<MultipleBloc>().add(GetUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: BlocBuilder<MultipleBloc, MultipleState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case UserLoading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case UserLoaded:
              final newState = state as UserLoaded;
              return ListView.builder(
                itemCount: newState.users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(newState.users[index].name!),
                      subtitle: Text(newState.users[index].email!),
                      onTap: () async {
                        final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => EditUser(
                                    username: newState.users[index].username!,
                                    name: newState.users[index].name!,
                                    phone: newState.users[index].phone!,
                                    email: newState.users[index].email!)));
                        print(result.toString());
                        if (result == null) {
                          context.read<MultipleBloc>().add(GetUser());
                        }
                      },
                    ),
                  );
                },
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
