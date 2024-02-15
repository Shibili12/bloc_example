part of 'multiple_bloc.dart';

@immutable
sealed class MultipleEvent {}

class GetUser extends MultipleEvent {}

class GetUniversity extends MultipleEvent {}

class Getproducts extends MultipleEvent {}
