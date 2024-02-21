part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class Favoriteitemselect extends FavouriteEvent {
  final FavitemModel item;
  const Favoriteitemselect({required this.item});
}

class Selectitem extends FavouriteEvent {
  final FavitemModel item;
  const Selectitem({required this.item});
}

class UnselectItem extends FavouriteEvent {
  final FavitemModel item;
  const UnselectItem({required this.item});
}

class Deleteitem extends FavouriteEvent {}
