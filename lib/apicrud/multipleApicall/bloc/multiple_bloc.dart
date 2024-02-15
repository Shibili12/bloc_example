import 'package:bloc/bloc.dart';
import 'package:bloc_example/apicrud/crud_operations/sevice/apiservice.dart';
import 'package:bloc_example/apicrud/multipleApicall/model/productmodel.dart';
import 'package:bloc_example/apicrud/multipleApicall/model/universitymodel.dart';
import 'package:bloc_example/apicrud/multipleApicall/model/usermodel.dart';
import 'package:bloc_example/apicrud/multipleApicall/services/apiservice.dart';
import 'package:meta/meta.dart';

part 'multiple_event.dart';
part 'multiple_state.dart';

class MultipleBloc extends Bloc<MultipleEvent, MultipleState> {
  MultipleBloc() : super(MultipleInitial()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      final user = await Httpservice().getUser();
      emit(UserLoaded(users: user));
    });
    on<GetUniversity>((event, emit) async {
      final university = await Httpservice().getUniversity();
      emit(UniversityLoaded(university: university));
    });
    on<Getproducts>((event, emit) async {
      emit(UserLoading());
      final product = await Httpservice().getProducts();
      emit(ProductLoaded(products: product));
    });
  }
}
