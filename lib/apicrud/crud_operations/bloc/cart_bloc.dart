import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(isLoading: false, cartproducts: [])) {
    on<AddtoCart>((event, emit) {
      emit(CartState(isLoading: true, cartproducts: []));
      var carts = Cartproducts(
          image: event.image,
          name: event.name,
          price: event.price,
          qty: event.qty);
      final List<Cartproducts> updatedProducts = List.from(state.cartproducts)
        ..add(carts);
      print(updatedProducts.length);
      emit(CartState(isLoading: false, cartproducts: updatedProducts));
    });
  }
}

class Cartproducts {
  String image;
  String name;
  int qty;
  double price;
  Cartproducts({
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
  });
}
