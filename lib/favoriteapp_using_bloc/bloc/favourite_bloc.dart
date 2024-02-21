import 'package:bloc/bloc.dart';
import 'package:bloc_example/favoriteapp_using_bloc/model/favitemmodel.dart';
import 'package:bloc_example/favoriteapp_using_bloc/repository/fav_repository.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepository favouriteRepository;
  List<FavitemModel> favlist = [];
  List<FavitemModel> tempfavlist = [];
  FavouriteBloc(this.favouriteRepository) : super(FavouriteInitial()) {
    on<FetchFavouriteList>((event, emit) async {
      favlist = await favouriteRepository.fetchItem();
      emit(state.copyWith(
          favitemlist: List.from(favlist), liststatus: Liststatus.sucsess));
    });
    on<Favoriteitemselect>((event, emit) {
      final index =
          favlist.indexWhere((element) => element.id == event.item.id);
      if (event.item.isFavorite) {
        if (tempfavlist.contains(favlist[index])) {
          tempfavlist.remove(favlist[index]);
          tempfavlist.add(event.item);
        }
      } else {
        if (tempfavlist.contains(favlist[index])) {
          tempfavlist.remove(favlist[index]);
          tempfavlist.add(event.item);
        }
      }
      favlist[index] = event.item;
      emit(state.copyWith(
          favitemlist: List.from(favlist), temFavlist: List.from(tempfavlist)));
    });
    on<Selectitem>((event, emit) {
      tempfavlist.add(event.item);
      emit(state.copyWith(temFavlist: List.from(tempfavlist)));
    });
    on<UnselectItem>((event, emit) {
      tempfavlist.remove(event.item);
      emit(state.copyWith(temFavlist: List.from(tempfavlist)));
    });
    on<Deleteitem>((event, emit) {
      for (var i = 0; i < tempfavlist.length; i++) {
        favlist.remove(tempfavlist[i]);
      }
      tempfavlist.clear();
      emit(state.copyWith(
          favitemlist: List.from(favlist), temFavlist: List.from(tempfavlist)));
    });
  }
}
