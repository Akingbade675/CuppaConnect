part of 'favourite_items_bloc.dart';

sealed class FavouriteItemsEvent extends Equatable {
  const FavouriteItemsEvent();

  @override
  List<Object> get props => [];
}

final class LoadFavouriteItems extends FavouriteItemsEvent {}

final class ToggleFavouriteItem extends FavouriteItemsEvent {
  final String coffeeId;

  const ToggleFavouriteItem(this.coffeeId);

  @override
  List<Object> get props => [coffeeId];
}

final class ClearFavouriteItems extends FavouriteItemsEvent {}
