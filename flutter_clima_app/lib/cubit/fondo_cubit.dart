import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fondo_state.dart';

class FondoCubit extends Cubit<FondoState> {
  FondoCubit() : super(FondoInitial());

  void actualizarTema(double temperatura) {
    if (temperatura > 21) {
      emit(FondoCalido());
    } else {
      emit(FondoFrio());
    }
  }
}
