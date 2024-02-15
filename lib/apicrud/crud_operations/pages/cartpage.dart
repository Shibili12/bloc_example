import 'package:bloc_example/apicrud/crud_operations/bloc/cart_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.cartproducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: Image.network(state.cartproducts[index].image),
                      trailing: Text("Qty ${state.cartproducts[index].qty}"),
                      title: Text(
                        state.cartproducts[index].name,
                        maxLines: 1,
                      ),
                      subtitle:
                          Text(state.cartproducts[index].price.toString()),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
