import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favourite_repository/favourite_repository.dart';

part 'favourite_items_event.dart';
part 'favourite_items_state.dart';

class FavouriteItemsBloc
    extends Bloc<FavouriteItemsEvent, FavouriteItemsState> {
  final LocalFavouriteRepository localFavouriteRepo;

  FavouriteItemsBloc(this.localFavouriteRepo) : super(FavouriteItemsLoading()) {
    on<LoadFavouriteItems>(_onLoadFavouriteItems);
    on<ToggleFavouriteItem>(_onToggleFavouriteItem);
    on<ClearFavouriteItems>(_onClearFavouriteItems);
  }

  FutureOr<void> _onLoadFavouriteItems(
    LoadFavouriteItems event,
    Emitter<FavouriteItemsState> emit,
  ) {
    try {
      final favouriteCoffees = localFavouriteRepo.getFavourites();
      emit(FavouriteItemsLoaded(favouriteCoffees));
    } catch (e) {
      print(e);
      emit(const FavouriteItemsError('Failed to load favourite items'));
    }
  }

  FutureOr<void> _onToggleFavouriteItem(
    ToggleFavouriteItem event,
    Emitter<FavouriteItemsState> emit,
  ) {
    try {
      final coffeeId = event.coffeeId;
      final favouriteCoffees =
          List<String>.from((state as FavouriteItemsLoaded).favouriteCoffees);
      if (localFavouriteRepo.isFavourite(coffeeId)) {
        localFavouriteRepo.removeFavourite(coffeeId);
        favouriteCoffees.remove(coffeeId);
      } else {
        localFavouriteRepo.addFavourite(coffeeId);
        favouriteCoffees.add(coffeeId);
      }

      emit(FavouriteItemsLoaded(favouriteCoffees));
    } catch (e) {
      print(e);
      emit(const FavouriteItemsError('Failed to toggle favourite item'));
    }
  }

  FutureOr<void> _onClearFavouriteItems(
    ClearFavouriteItems event,
    Emitter<FavouriteItemsState> emit,
  ) {
    try {
      localFavouriteRepo.clear();
      emit(const FavouriteItemsLoaded([]));
    } catch (e) {
      print(e);
      emit(const FavouriteItemsError('Failed to clear favourite items'));
    }
  }

  bool isFavourite(String coffeeId) {
    return state is FavouriteItemsLoaded
        ? (state as FavouriteItemsLoaded).favouriteCoffees.contains(coffeeId)
        : false;
  }
}
