import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clima_app/API/modeloApi.dart';
import 'package:flutter_clima_app/API/peticionApi.dart';

part 'clima_event.dart';
part 'clima_state.dart';

class ClimaBloc extends Bloc<ClimaEvent, ClimaState> {
  ClimaBloc() : super(ClimaInitial()) {
    on<CargarClima>((event, emit) async {
      emit(ClimaLoading());
      try {
        final clima = await ServicioApi().cargarClima(event.lat, event.lon);
        emit(ClimaLoaded(clima));
      } catch (e) {
        emit(ClimaError("Error al cargar el clima"));
      }
    });
  }
}
