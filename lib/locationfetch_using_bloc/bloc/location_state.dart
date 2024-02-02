part of 'location_bloc.dart';

class LocationState {
  var currentaddress;
  final bool isLoading;
  LocationState({required this.isLoading, required this.currentaddress});
}

final class LocationInitial extends LocationState {
  LocationInitial({required super.currentaddress, required super.isLoading});
}
