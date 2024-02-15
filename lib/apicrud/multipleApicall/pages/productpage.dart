import 'package:bloc_example/apicrud/multipleApicall/bloc/multiple_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MultipleBloc, MultipleState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case UserLoading:
              return Center(child: CircularProgressIndicator());
            case ProductLoaded:
              final newstate = state as ProductLoaded;
              return ListView.builder(
                itemCount: newstate.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(newstate.products[index].title!),
                      onTap: () {
                        Navigator.of(context)
                            .pop(newstate.products[index].title!);
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
