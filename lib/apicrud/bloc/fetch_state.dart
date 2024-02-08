part of 'fetch_bloc.dart';

class FetchState {
  final bool isLoading;
  final List<Productmodel> data;

  FetchState({required this.isLoading, required this.data});
}

final class FetchInitial extends FetchState {
  FetchInitial({required super.isLoading, required super.data});
}
