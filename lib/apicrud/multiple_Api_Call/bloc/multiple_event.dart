part of 'multiple_bloc.dart';

@immutable
sealed class MultipleEvent {}

class GetUser extends MultipleEvent {}

class GetUniversity extends MultipleEvent {}

class GetProducts extends MultipleEvent {}
