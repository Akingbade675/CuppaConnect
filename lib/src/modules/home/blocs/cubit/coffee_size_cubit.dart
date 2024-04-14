import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';

// part 'coffee_size_state.dart';

class CoffeeSizeCubit extends Cubit<Size?> {
  CoffeeSizeCubit() : super(null);

  void selectSize(Size size) {
    emit(size);
  }

  void clearSize() {
    emit(null);
  }
}
