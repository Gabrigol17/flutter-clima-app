part of 'clima_bloc.dart';

sealed class ClimaState extends Equatable {
  const ClimaState();
  
  @override
  List<Object> get props => [];
}

final class ClimaInitial extends ClimaState {}
