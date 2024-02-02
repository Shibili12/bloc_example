import 'package:bloc/bloc.dart';
import 'package:bloc_example/locationfetch_using_bloc/location_helper.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc()
      : super(LocationInitial(currentaddress: "", isLoading: false)) {
    on<Getlocation>((event, emit) async {
      emit(LocationState(currentaddress: "", isLoading: true));
      final address = await Locationhelper().getcurrentlocation();
      emit(LocationState(currentaddress: address, isLoading: false));
    });
  }
}
