part of 'favourite_bloc.dart';

enum Liststatus { loading, sucsess, failure }

class FavouriteState extends Equatable {
  final List<FavitemModel> favitemlist;
  final List<FavitemModel> temFavlist;
  final Liststatus liststatus;
  const FavouriteState({
    this.favitemlist = const [],
    this.temFavlist = const [],
    this.liststatus = Liststatus.loading,
  });
  FavouriteState copyWith(
      {List<FavitemModel>? favitemlist,
      List<FavitemModel>? temFavlist,
      Liststatus? liststatus}) {
    return FavouriteState(
      favitemlist: favitemlist ?? this.favitemlist,
      temFavlist: temFavlist ?? this.temFavlist,
      liststatus: liststatus ?? this.liststatus,
    );
  }

  @override
  List<Object> get props => [favitemlist, temFavlist, liststatus];
}

final class FavouriteInitial extends FavouriteState {}
