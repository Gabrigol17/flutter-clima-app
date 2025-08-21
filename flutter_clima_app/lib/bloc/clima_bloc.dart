import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clima_event.dart';
part 'clima_state.dart';

class ClimaBloc extends Bloc<ClimaEvent, ClimaState> {
  ClimaBloc() : super(ClimaInitial()) {
    on<ClimaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
