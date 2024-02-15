part of 'multiple_bloc.dart';

@immutable
sealed class MultipleState {}

final class MultipleInitial extends MultipleState {}

class UserLoading extends MultipleState {}

class UserLoaded extends MultipleState {
  final List<UserModel> users;

  UserLoaded({required this.users});
}

class UniversityLoaded extends MultipleState {
  final List<UniversityModel> university;

  UniversityLoaded({required this.university});
}

class ProductLoaded extends MultipleState {
  final List<ProductModel> products;

  ProductLoaded({required this.products});
}
