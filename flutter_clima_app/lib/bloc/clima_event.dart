part of 'clima_bloc.dart';

sealed class ClimaEvent extends Equatable {
  const ClimaEvent();

  @override
  List<Object> get props => [];
}

final class CargarClima extends ClimaEvent {
  final double lat;
  final double lon;

  const CargarClima(this.lat, this.lon);
  @override
  List<Object> get props => [lat, lon]; 
}