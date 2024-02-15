part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddtoCart extends CartEvent {
  String image;
  String name;
  int qty;
  double price;

  AddtoCart({
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
  });
}
