import 'package:bloc_example/notification_using_bloc/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Noticationpage extends StatelessWidget {
  Noticationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            context.read<NotificationBloc>().add(Notificationlist());
            List<String> messages = state.messages;
            return ListView.builder(
                itemCount: messages.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(messages[index]),
                  );
                }));
          },
        ),
      ),
    );
  }
}
