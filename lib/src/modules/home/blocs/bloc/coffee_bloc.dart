import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeInitial()) {
    on<CoffeeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
