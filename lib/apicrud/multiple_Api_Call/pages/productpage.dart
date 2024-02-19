import 'package:bloc_example/apicrud/multiple_Api_Call/bloc/multiple_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search producucts",
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                onChanged: (query) {
                  context.read<MultipleBloc>().add(Searchproduct(query: query));
                },
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: BlocBuilder<MultipleBloc, MultipleState>(
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
                          child: CheckboxListTile(
                            value: state.products[index].isSelected,
                            onChanged: (value) {
                              context.read<MultipleBloc>().add(Selectcheckbox(
                                  product: newstate.products[index]));
                            },
                            title: Text(newstate.products[index].title!),
                            secondary: Image.network(
                              newstate.products[index].image!,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  default:
                    return SizedBox();
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 79,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<MultipleBloc>().add(AddtoSelectproducts());
                      Navigator.of(context).pop();
                    },
                    child: Text("select")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
