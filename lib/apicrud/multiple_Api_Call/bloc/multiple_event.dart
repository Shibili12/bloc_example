part of 'multiple_bloc.dart';

@immutable
sealed class MultipleEvent {}

class GetUser extends MultipleEvent {}

class GetUniversity extends MultipleEvent {}

class GetProducts extends MultipleEvent {}

class Searchproduct extends MultipleEvent {
  final String query;

  Searchproduct({required this.query});
}

class Selectcheckbox extends MultipleEvent {
  ProductModel product;
  Selectcheckbox({required this.product});
}

class AddtoSelectproducts extends MultipleEvent {}
