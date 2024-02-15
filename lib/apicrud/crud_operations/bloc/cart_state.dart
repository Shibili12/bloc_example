part of 'cart_bloc.dart';

class CartState {
  final bool isLoading;
  final List<Cartproducts> cartproducts;

  CartState({required this.isLoading, required this.cartproducts});
}

final class CartInitial extends CartState {
  CartInitial({required super.isLoading, required super.cartproducts});
}
