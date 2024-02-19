import 'package:bloc/bloc.dart';

import 'package:bloc_example/apicrud/multiple_Api_Call/model/productmodel.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/model/selectedproduct.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/model/universitymodel.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/model/usermodel.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/services/apiservice.dart';
import 'package:meta/meta.dart';

part 'multiple_event.dart';
part 'multiple_state.dart';

class MultipleBloc extends Bloc<MultipleEvent, MultipleState> {
  MultipleBloc() : super(MultipleInitial()) {
    final List<ProductModel> selectedProducts = [];
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      final user = await Httpservice().getUser();
      emit(UserLoaded(users: user));
    });
    on<GetUniversity>((event, emit) async {
      final university = await Httpservice().getUniversity();
      emit(UniversityLoaded(university: university));
    });
    on<GetProducts>((event, emit) async {
      emit(UserLoading());
      final product = await Httpservice().getProducts();
      emit(ProductLoaded(products: product));
    });

    on<Searchproduct>((event, emit) async {
      // final newstate = state as ProductLoaded;
      final product = await Httpservice().getProducts();
      List<ProductModel> filteredProducts = product
          .where((product) =>
              product.title!.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ProductLoaded(products: filteredProducts));
    });

    on<Selectcheckbox>((event, emit) {
      final currentState = state as ProductLoaded;

      final List<ProductModel> updatedProducts =
          List.from(currentState.products);

      final int index = updatedProducts
          .indexWhere((product) => product.id == event.product.id);
      if (index != -1) {
        var productModel = ProductModel(
          id: updatedProducts[index].id,
          title: updatedProducts[index].title,
          price: updatedProducts[index].price,
          description: updatedProducts[index].description,
          category: updatedProducts[index].category,
          image: updatedProducts[index].image,
          rating: updatedProducts[index].rating,
          isSelected: !updatedProducts[index].isSelected,
        );
        if (productModel.isSelected == !updatedProducts[index].isSelected) {
          if (productModel.isSelected == true) {
            selectedProducts.add(productModel);
          } else {
            selectedProducts.removeAt(index);
          }
          emit(SelectProductstate(selectedProducts: selectedProducts));
        }

        updatedProducts[index] = productModel;
        emit(ProductLoaded(products: updatedProducts));
        print("Selected: " + selectedProducts.length.toString());
      }
    });

    on<AddtoSelectproducts>((event, emit) {
      emit(SelectProductstate(selectedProducts: selectedProducts));
    });
  }
}
