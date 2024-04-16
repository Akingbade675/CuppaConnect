part of 'favourite_items_bloc.dart';

sealed class FavouriteItemsState extends Equatable {
  const FavouriteItemsState();

  @override
  List<Object> get props => [];
}

final class FavouriteItemsLoading extends FavouriteItemsState {}

final class FavouriteItemsLoaded extends FavouriteItemsState {
  final List<String> favouriteCoffees;

  const FavouriteItemsLoaded(this.favouriteCoffees);

  @override
  List<Object> get props => [favouriteCoffees];
}

final class FavouriteItemsError extends FavouriteItemsState {
  final String message;

  const FavouriteItemsError(this.message);

  @override
  List<Object> get props => [message];
}
