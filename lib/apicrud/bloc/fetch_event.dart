part of 'fetch_bloc.dart';

@immutable
sealed class FetchEvent {}

class FetchApi extends FetchEvent {}

class Caltotal extends FetchEvent {
  int qty;
  double price;
  TextEditingController totalcontroller;
  Caltotal({
    required this.qty,
    required this.price,
    required this.totalcontroller,
  });
}
