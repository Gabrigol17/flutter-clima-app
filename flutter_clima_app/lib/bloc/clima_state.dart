part of 'clima_bloc.dart';

sealed class ClimaState extends Equatable {
  const ClimaState();
  
  @override
  List<Object> get props => [];
}

final class ClimaInitial extends ClimaState {}
final class ClimaLoading extends ClimaState {}
final class ClimaLoaded extends ClimaState {
  final ModeloClima clima;
  ClimaLoaded(this.clima);

  @override
  List<Object> get props => [clima];
}

final class ClimaError extends ClimaState {
  final String mensaje;

  ClimaError(this.mensaje);

  @override
  List<Object> get props => [mensaje];
}
